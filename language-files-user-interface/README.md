# Adiscon User Interface language files

This directory contains the review catalogs exported from the modern Adiscon User Interface project (`Adiscon/adiscon-client-ng`). The catalogs are review artifacts; the corresponding NG `.resw` files remain the source of truth.

The existing `language-files/` directory is a separate, parallel catalog surface for the legacy client and shared legacy UI. The two directory trees are intentionally maintained side by side and must not be synchronized automatically.

## Layout

```text
language-files-user-interface/
  catalog-metadata.json
  monitorware/<locale>.csv
  rsyslog-agent/<locale>.csv
  eventreporter/<locale>.csv
  winsyslog/<locale>.csv
```

The metadata file describes the four modern product hosts and the supported locales. Catalog paths in the metadata are relative to this directory.

Only the `Text` column is intended for translation changes. Keep `Unit`, `Unit Name`, `ID`, and `Comment` unchanged, preserve all placeholders, and keep one BCP 47 locale per file.
