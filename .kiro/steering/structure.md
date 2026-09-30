---
inclusion: always
---

# Project Structure

```
_config.yml            site settings (baseurl, languages, social links)
_layouts/default.html  the only layout; all pages use it
_includes/             header.html, footer.html, event-card.html
_data/                 events.yml, sponsors.yml, team.yml, gdrive_gallery.yml  ← content lives here
_sass/                 variables, mixins, base, components, pages
assets/css/main.scss   SCSS entry point (+ _gallery.scss, _full-gallery.scss)
assets/js/             main.js, language-switcher.js, theme-switcher.js, i18n/{en,or}.json
assets/images/         banner.jpg, logo.png, events/, gallery/, sponsors/, profile/
*.html (root)          pages: index, events, full-gallery (/gallery/), about, contact
.kiro/skills/voca-website/  detailed workflows and the verify script
_site/                 build output; generated, git-ignored, never edit
```

## Where things go

| Change | Location |
|--------|----------|
| Event, sponsor or album content | `_data/*.yml`, never hard-coded in HTML |
| Markup reused on more than one page | a new file in `_includes/`, passing params via `include.<name>` |
| Global look (buttons, header, banner) | `_sass/components.scss` |
| Page or section styles | `_sass/pages.scss`, nested under the section class |
| Colours, breakpoints, spacing tokens | `_sass/variables.scss` |
| Translatable text | `assets/js/i18n/en.json` and `or.json` |
| Images | `assets/images/<area>/`, lowercase-hyphenated names |

## Naming

- CSS classes: lowercase kebab-case, one block per section (`.sponsors-section`, `.sponsor-tile`). State modifiers use `is-*` (`.is-past`).
- i18n keys: `<page>.<section>.<item>` in camelCase segments (`home.whyJoin.reason1.title`). Event text uses `events.<event-id>.<field>`.
- Event ids: `<name>-<year>` (`diwali-2026`).
- Data files: lowercase `.yml`, with a comment header documenting every field.

## Home page section pattern

Each section is `<section class="home-section <name>-section [alt-bg]">` wrapping a `.container`, with a `.section-header` (eyebrow, h2, optional `.section-intro`). Alternate `alt-bg` so neighbouring sections contrast. The current order is recorded in `.kiro/skills/voca-website/references/architecture.md`; update it when you add, remove or reorder sections.

## Documentation

Keep the skill (`.kiro/skills/voca-website/`) accurate when structure changes. `TECHNICAL_DOCUMENTATION.md` is outdated. It references `_events/` and `_galleries/` collections that don't exist. Don't follow it.
