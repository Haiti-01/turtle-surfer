-- ============================================================
-- Turtle Surfer – globale Bestenliste (Supabase / Postgres)
-- Dieses Skript EINMALIG im Supabase SQL-Editor ausführen:
--   Dashboard → SQL Editor → New query → einfügen → Run
-- ============================================================

-- Tabelle: id, name, score, created_at
create table if not exists public.leaderboard (
  id         uuid primary key default gen_random_uuid(),
  name       text not null,
  score      integer not null,
  created_at timestamptz not null default now()
);

-- Pro Name (case-insensitiv) genau EIN Eintrag
create unique index if not exists leaderboard_name_unique
  on public.leaderboard (lower(name));

-- ------------------------------------------------------------
-- Row Level Security: Jeder darf LESEN, niemand darf direkt
-- schreiben/ändern/löschen. Schreiben geht nur über die
-- Funktion submit_score() weiter unten.
-- ------------------------------------------------------------
alter table public.leaderboard enable row level security;

drop policy if exists "leaderboard_public_read" on public.leaderboard;
create policy "leaderboard_public_read"
  on public.leaderboard for select
  to anon, authenticated
  using (true);

-- Keine insert/update/delete-Policies => direkte Schreibzugriffe blockiert.
-- Zusätzlich die Standard-Grants entziehen (doppelter Boden):
revoke insert, update, delete on public.leaderboard from anon, authenticated;
grant  select on public.leaderboard to anon, authenticated;

-- ------------------------------------------------------------
-- Score-Einreichung ausschließlich über diese Funktion.
-- security definer = läuft mit Owner-Rechten, RLS-unabhängig.
-- Serverseitige Plausibilisierung:
--   * Name: 2–16 Zeichen (getrimmt)
--   * Score: 1 … 500000 (unrealistische Werte werden abgelehnt)
--   * Pro Name bleibt nur der HÖCHSTE Score erhalten
-- ------------------------------------------------------------
create or replace function public.submit_score(p_name text, p_score integer)
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  clean_name text;
begin
  clean_name := trim(p_name);
  if clean_name is null
     or char_length(clean_name) < 2
     or char_length(clean_name) > 16 then
    raise exception 'Ungueltiger Name (2-16 Zeichen).';
  end if;
  if p_score is null or p_score < 1 or p_score > 500000 then
    raise exception 'Unplausibler Score.';
  end if;

  -- vorhandenen Eintrag nur aktualisieren, wenn der neue Score hoeher ist
  update public.leaderboard
     set score = p_score, created_at = now()
   where lower(name) = lower(clean_name)
     and score < p_score;

  -- kein Eintrag vorhanden (oder bestehender ist hoeher): Insert versuchen;
  -- bei Namenskonflikt (hoeherer Bestand) passiert einfach nichts
  if not found then
    insert into public.leaderboard (name, score)
    values (clean_name, p_score)
    on conflict do nothing;
  end if;
end;
$$;

grant execute on function public.submit_score(text, integer) to anon, authenticated;
