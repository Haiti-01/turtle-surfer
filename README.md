# 🐢 Turtle Surfer

Ein Endless-Runner im Stil von *Subway Surfers* — nur unter Wasser: Steuere eine
Schildkröte durchs Meer, weiche entgegenkommenden Fischen, Angelhaken und Seeigeln
aus und sammle Algen für Punkte.

**Alles steckt in einer einzigen `index.html`** — reines HTML/CSS/JavaScript mit
Canvas, **kein Server, kein Build, keine Abhängigkeiten**. Damit lässt es sich ohne
serverseitigen Aufwand statisch hosten.

## 🎮 Steuerung

| Taste | Aktion |
|-------|--------|
| ◀ ▶ / A D | Spur wechseln (3 Spuren) |
| ▲ / W | Auftauchen |
| ▼ / S | Abtauchen |
| Wischen | Steuerung am Handy (Swipe) |

- **Fische** kommen auf mittlerer Höhe → nach oben, unten oder zur Seite ausweichen
- **Angelhaken** hängen von oben → abtauchen oder Spur wechseln
- **Seeigel** liegen am Boden → auftauchen oder Spur wechseln
- **Algen** einsammeln → +25 Punkte

Die Geschwindigkeit steigt mit der Zeit, der Highscore wird lokal im Browser
(`localStorage`) gespeichert.

## 🛍️ Kosmetik & Freischaltungen

Über den **Kosmetik-Shop** (vom Startbildschirm erreichbar) lassen sich fünf
Kategorien anpassen — **42 Cosmetics** insgesamt:

- 🐢 **12 Schildkröten-Skins** (u. a. Karett- & Landschildkröte, Neon, Mitternacht,
  Geister-, Kristall- und animierter Regenbogen-Panzer)
- 🌊 **8 Hintergründe** (Korallenriff, Lagune, Tiefsee, Sonnenuntergang,
  Sternennacht, Höhle, Eismeer, Abgrund)
- 🌿 **8 Algen-Designs** · 🐟 **8 Kreaturen** (Fische, Kugelfische, Quallen,
  Krabben, Rochen, Seedrachen, Haie, Orcas) · 🟣 **6 Seeigel-Varianten**

Ausgewählte Items werden sofort im Spiel angewendet. Die Unlocks sind bewusst
gestaffelt — frühe Items bleiben erreichbar, Top-Items sind Langzeitziele:

- **🌿 Algen als Währung** — von 250 🌿 (Einstieg) bis 8000 🌿 (Regenbogen-Panzer)
- **🏆 Highscore-Meilensteine** — von 6000 (Landschildkröte) bis 30.000 Punkte
  (Kristallpanzer)

Jedes Item zeigt klar seinen Zustand (gesperrt / gekauft / ausgewählt) und seine
Bedingung. Guthaben, Gesamt-Algen, Highscore sowie freigeschaltete und ausgewählte
Cosmetics werden dauerhaft im `localStorage` gespeichert.

## 🌅 Optik & Spielfläche

- **Pseudo-3D-Perspektive** wie bei Subway Surfers: die drei Spuren laufen
  deutlich zum Fluchtpunkt hin zusammen, Hindernisse wachsen beim Näherkommen.
- **Scrollender Meeresboden** mit Sand-Textur: Rippel und Kiesel sind an
  Welt-Positionen verankert und strömen passend zur Spielgeschwindigkeit
  auf die Kamera zu.
- **Vorbeiziehende Kulissen:** Korallenriffe tauchen an den Seiten auf; ab und
  zu spawnt ein **Felsen-Tunnel** aus mehreren Bögen, durch den die Schildkröte
  hindurchschwimmt.

## ⚡ Power-Ups

Erscheinen zufällig als Blasen im Level; die aktive Dauer ist links oben als
Icon mit Timer-Leiste sichtbar:

| Power-Up | Effekt |
|----------|--------|
| 🛡️ Luftblase | Schutzschild — absorbiert genau eine Kollision |
| 🧲 Magnet | zieht 8 s lang alle Algen automatisch an |
| ⚡ Laser | zerstört 6 s lang alle entgegenkommenden Hindernisse |
| 🚀 Turbo | 4 s Geschwindigkeitsschub, doppelte Punkte, unverwundbar |
| 🐌 Zeitlupe | verlangsamt 6 s lang alle Hindernisse |

## 🔥 Combo-System

Algen ohne Unterbrechung nacheinander einsammeln erhöht den Multiplikator
(x2, x3 … bis x10) — deutlich sichtbar oben in der Mitte. Ein Treffer
(auch vom Schild absorbiert) oder eine **verpasste** Alge setzt die Combo zurück.

## 🐟 Bewegliche Hindernisse

Mit steigendem Schwierigkeitsgrad tauchen bewegte Varianten auf: Kreaturen,
die **die Spur wechseln**, Kreaturen, die **auf- und absteigen**, und Angelhaken,
die **seitlich pendeln**.

## 🎯 Missionen & 🏆 Trophäen

- **3 aktive Missionen** gleichzeitig (z. B. „Sammle 100 Algen", „Weiche 25 Angelhaken
  aus", „Erreiche eine 7er-Combo") mit Fortschrittsbalken auf dem Startbildschirm.
  Abschluss belohnt **Bonus-Algen**; sind alle drei erledigt, erscheint automatisch
  ein neuer Satz.
- **16 Trophäen** für Meilensteine (25.000 Punkte, 15er-Combo, 6000 Algen,
  100 Runden, …) mit eigenem Übersichts-Menü — erreichte farbig, offene
  ausgegraut mit Beschreibung. Die Anforderungen sind bewusst anspruchsvoll.

Alles (Missionen, Fortschritt, Trophäen, Statistiken) wird im `localStorage`
gespeichert und überlebt Browser-Neustarts.

## ▶️ Lokal spielen

Einfach `index.html` per Doppelklick im Browser öffnen — fertig.

## 🌐 Online stellen

Da es eine rein statische Seite ist, funktioniert jedes Static-Hosting. Der Einstiegspunkt
ist `index.html` im Wurzelverzeichnis.

### Variante A — GitHub Pages
1. Repo auf GitHub anlegen und pushen:
   ```bash
   git remote add origin https://github.com/<NUTZER>/<REPO>.git
   git push -u origin main
   ```
2. Auf GitHub: **Settings → Pages → Build and deployment → Source: „Deploy from a branch"**,
   Branch `main` / Ordner `/ (root)`, speichern.
3. Nach ein bis zwei Minuten ist das Spiel unter
   `https://<NUTZER>.github.io/<REPO>/` erreichbar.

### Variante B — Netlify / Vercel / Cloudflare Pages
Repo verbinden (oder den Ordner per Drag-and-drop hochladen). Es ist **kein**
Build-Command nötig, Publish-Verzeichnis ist das Projektwurzelverzeichnis.

## 📁 Struktur

```
index.html    # das komplette Spiel (Grafik, Logik, Sound)
.nojekyll      # sagt GitHub Pages: Dateien unverändert ausliefern
.gitignore     # schließt lokale Hilfsdateien (.claude/) aus
```

Der Ordner `.claude/` (kleiner Node-Vorschauserver) ist nur für die lokale Entwicklung
und wird bewusst **nicht** mitversioniert — fürs Hosting wird er nicht gebraucht.
