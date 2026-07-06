// ============================================================
// Konfiguration der globalen Bestenliste (Supabase)
//
// Setup (einmalig, ~5 Minuten):
//   1) Kostenloses Projekt anlegen: https://supabase.com
//   2) supabase-setup.sql im SQL-Editor des Projekts ausführen
//   3) Unten Projekt-URL und den *anon/public*-Key eintragen
//      (Dashboard → Settings → API)
//
// Sicherheit: Der anon-Key ist der ÖFFENTLICHE Browser-Key von
// Supabase und darf hier stehen — die Zugriffsrechte regelt Row
// Level Security in der Datenbank (siehe supabase-setup.sql).
// NIEMALS den service_role-Key hier eintragen!
//
// Solange beide Felder leer sind, läuft das Spiel normal weiter,
// nur ohne Online-Bestenliste (lokaler Highscore als Fallback).
// ============================================================
window.LEADERBOARD_CONFIG = {
  url: '',      // z. B. 'https://abcdefghijkl.supabase.co'
  anonKey: ''   // z. B. 'eyJhbGciOiJIUzI1NiIs...'
};
