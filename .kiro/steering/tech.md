---
inclusion: always
---

# Technology Stack

## Stack

- **Jekyll 4.3** static site, Liquid templates, served by GitHub Pages from `main`.
- **Ruby 3.2.2** via rbenv (`.ruby-version`), with Bundler. Gems are in the `Gemfile`: jekyll, minima, sass-embedded, webrick, and the jekyll-seo-tag, jekyll-sitemap and jekyll-feed plugins.
- **SCSS** compiled by Jekyll (`assets/css/main.scss` imports `_sass/*`).
- **Vanilla JavaScript**, no build step or bundler, no npm.
- **From CDNs:** Font Awesome 6.4 (icons), lightGallery 2.4 (photo lightbox).

Don't add frameworks (React, Tailwind, Bootstrap, jQuery), npm tooling or new CDN libraries without asking. The site must stay a simple static site that volunteers can maintain.

## Commands

```bash
bundle exec jekyll serve     # dev server at http://127.0.0.1:4000/voca/
bundle exec jekyll build     # build into _site/
bash .kiro/skills/voca-website/scripts/verify.sh   # build + i18n JSON check + screenshots
```

Restart `serve` after editing `_config.yml`. Run `verify.sh` after any change, and look at the desktop (1280px) and mobile (500px) screenshots for visual changes.

## Conventions

**Liquid and HTML**
- Always build URLs with `relative_url`, because the site lives under `baseurl: /voca`.
- Give every user-visible string a `data-i18n="key"` attribute plus English fallback text that matches `en.json`.
- Semantic, accessible markup: meaningful `alt` text, `aria-hidden="true"` on decorative icons, `aria-label` on icon-only buttons and links, `loading="lazy"` on images below the fold.
- External links use `target="_blank" rel="noopener"`. Add `sponsored` for sponsor links.

**SCSS**
- Mobile-first. `@include respond-to(md)` means 768px and up. For "below md" use `@media (max-width: #{$breakpoint-md - 1px})`.
- Use the tokens in `_sass/variables.scss` and the theme CSS variables (`var(--bg-color)`, `--text-color`, `--card-bg`, `--border-color`), never hard-coded greys, so dark mode keeps working.
- Nest rules under the section class. Avoid `!important` except where existing button styles already need it.

**JavaScript**
- Plain ES2015+ inside `DOMContentLoaded`, guard missing elements, no globals except `siteBaseUrl`.
- JS that sets inline styles overrides CSS. `main.js` sets the banner height, so check it when layout CSS seems to be ignored.

**Translations (`assets/js/i18n/*.json`)**
- Make small targeted edits that keep the existing layout and key order. Don't re-serialize the whole file with a script.
- The files must stay valid JSON. A single syntax error disables translations site-wide.

## Security

- Never commit credentials. Never put a GitHub token in the git remote URL; use SSH or `gh auth login`.
- No server-side code exists. Forms go to Google Forms and contact uses `mailto:`. Flag it before adding anything that collects user data.
