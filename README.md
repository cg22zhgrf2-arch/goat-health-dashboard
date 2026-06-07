# Goat Health Dashboard

A static PWA dashboard for tracking MacIntosh and Ms. McGonegal, two Nigerian Dwarf doelings.

## iPhone

Once published with GitHub Pages, open the HTTPS site in Safari and use Share > Add to Home Screen.

## Data

Checklist state, logs, and water level are stored locally in each browser and can sync through Firebase when signed in.

For Firebase Auth on GitHub Pages, add this authorized domain in Firebase Authentication settings:

```text
cg22zhgrf2-arch.github.io
```

The dashboard's Export backup and Import backup controls are still available for iCloud Drive backups.

## Desktop App

The native macOS wrapper can be rebuilt locally:

```zsh
./build_desktop_app.sh
```
