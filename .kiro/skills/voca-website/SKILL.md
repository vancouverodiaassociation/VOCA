---
name: voca-website
description: Develop, update, and debug the Vancouver Odia Cultural Association (VOCA) Jekyll website. Use when adding or editing events, sponsors, gallery photos, translations (English/Odia i18n), home/events/gallery/about/contact pages, SCSS styles, the banner, header or mobile menu, dark/light theme, or when running, building, or deploying the VOCA site to GitHub Pages.
license: MIT
compatibility: Requires Ruby 3.2.x (rbenv), Bundler, and Jekyll 4.3. Visual checks use headless Google Chrome on macOS.
metadata:
  author: VOCA
  version: "1.0"
---

# VOCA Website

Static Jekyll 4.3 site served from GitHub Pages at `https://vancouverodiaassociation.github.io/voca/`.
All pages share `_layouts/default.html` (header, footer, scripts). Styles are SCSS; translation and theme logic is plain client-side JS.

## Before changing anything

1. Edit source files only. Never edit `_site/`. It is regenerated on every build.
2. Content lives in `_data/*.yml`. Prefer changing data over hard-coding markup.
3. Every user-visible string needs a `data-i18n` key plus an entry in `assets/js/i18n/en.json`. Add an `or.json` entry when a translation is known. Missing Odia keys fall back to the English text in the HTML.
4. Read `references/architecture.md` before changing layout, SCSS, or JS.

## Common tasks

| Task | Where | Details |
|------|-------|---------|
| Add or edit an event | `_data/events.yml` | `references/content.md#events` |
| Add a sponsor | `_data/sponsors.yml` and `assets/images/sponsors/` | `references/content.md#sponsors` |
| Add gallery photos | `assets/images/gallery/`, `full-gallery.html`, `_data/gdrive_gallery.yml` | `references/content.md#gallery` |
| Add or translate text | `assets/js/i18n/en.json`, `or.json` | `references/content.md#translations` |
| Change styles | `_sass/*.scss` | `references/architecture.md#styles` |
| Something looks broken | | `references/troubleshooting.md` |

## Run and verify

```bash
bundle exec jekyll serve        # http://127.0.0.1:4000/voca/
bash .kiro/skills/voca-website/scripts/verify.sh
```

`verify.sh` builds the site, validates both translation JSON files, and saves desktop (1280px) and mobile (500px) screenshots of the home, events, and gallery pages to `/tmp/voca-verify/`. The screenshots need the dev server running. After any visual change, run it and look at the screenshots at both widths. The 768px breakpoint is where most layout bugs appear.

Restart `jekyll serve` after editing `_config.yml`. Other changes rebuild automatically.

## Rules

- **Event dates:** `date` (ISO) drives sorting and the upcoming/past split. `date_label` is display-only. Keep them in sync.
- **Upcoming vs past:** "today" is the build time (`site.time`), so an event becomes "past" only after the next build or deploy.
- **Home page limit:** the home page shows the next 3 upcoming events. `events.html` shows all upcoming events, then past events newest first.
- **Event card markup:** render events only through `_includes/event-card.html`. Pass `past=true` for past events.
- **Links and assets:** use `relative_url` (`{{ '/path' | relative_url }}`). Hard-coded `/assets/...` paths break under the `/voca` baseurl.
- **Translation files:** edit `en.json` and `or.json` with targeted edits. Do not re-serialize them with a script. It reformats the whole file and produces noisy diffs.
- **Banner height:** `setImageHeight()` in `assets/js/main.js` sets the banner height inline and overrides CSS. Change banner sizing there as well as in `_sass/components.scss`.
- **Breakpoints:** `sm` 576, `md` 768, `lg` 992, `xl` 1200 (`_sass/variables.scss`). `respond-to(md)` means min-width 768px. For "below md" use `@media (max-width: #{$breakpoint-md - 1px})`.
- **No AgentMemory:** do not capture, recall or index VOCA sessions in AgentMemory (see `.kiro/steering/memory.md`).
- **Dark theme:** use the CSS variables (`--bg-color`, `--text-color`, `--card-bg`, `--border-color`) instead of fixed colours, so dark theme keeps working.

## Deploy

Push to `main`; GitHub Pages builds from the main branch. Never commit `.env` files, and never put credentials in files or remote URLs. See `references/troubleshooting.md#git-and-deploy`.
