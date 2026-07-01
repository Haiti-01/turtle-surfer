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
