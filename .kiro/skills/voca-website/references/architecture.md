# Architecture

## File map

```
_config.yml              site settings; baseurl "/voca", languages, social links
_layouts/default.html    <head>, header/footer includes, JS includes, event modal
_includes/
  header.html            logo, desktop nav, hamburger toggle, theme + language controls, mobile menu
  footer.html
  event-card.html        shared event card (home + events pages)
_data/
  events.yml             all events
  sponsors.yml           home page sponsors
  team.yml               About page committee members
  gdrive_gallery.yml     Google Drive albums for the Gallery page
_sass/
  variables.scss         colours, breakpoints, radius, header height
  mixins.scss            respond-to, flex, heading, button, card
  base.scss              reset, typography, theme CSS variables, .container
  components.scss        buttons, header/nav, banner
  pages.scss             home sections, event cards, events/about/contact pages
assets/css/
  main.scss              entry point; imports _sass + _gallery + _full-gallery + CDN CSS
  _gallery.scss          .gallery-grid / .gallery-item
  _full-gallery.scss     Gallery page wrapper
assets/js/
  main.js                mobile menu, banner height, lightGallery init, event modal
  language-switcher.js   loads i18n JSON, applies data-i18n, saves choice
  theme-switcher.js      sets body.theme-light / theme-dark, saves choice
  i18n/en.json, or.json  translations
index.html               home
events.html              all events (upcoming + past)
full-gallery.html        Gallery page (permalink /gallery/)
about.html, contact.html
```

`TECHNICAL_DOCUMENTATION.md` is partly out of date. It mentions `_events/` and `_galleries/` collections that don't exist. Trust the file map above.

## Home page section order (index.html)

1. Banner: image plus an empty `.banner-overlay` gradient, with no text.
2. Welcome: photo, mission text, three highlights, and a link to About. This merges the old intro line and the About block.
3. Upcoming Events: next 3 events from today (`alt-bg`).
4. Why Join VOCA: six icon cards and an orange CTA band.
5. Our Sponsors: tiles from `sponsors.yml` and a "Become a Sponsor" mailto link (`alt-bg`).

Sections use `.home-section` for vertical padding. Add `.alt-bg` for the grey background and alternate it between sections. Section headers follow this pattern:

```html
<div class="section-header">
  <span class="eyebrow" data-i18n="home.x.eyebrow">Label</span>
  <h2 data-i18n="home.x.title">Title</h2>
  <p class="section-intro" data-i18n="home.x.intro">Optional intro</p>
</div>
```

## About page section order (about.html)

1. `.page-hero`: saffron gradient over `gallery3.jpg`, title and intro.
2. Our Story: `.split-grid` image + text.
3. Values & Vision: two `.pillar-card`s (`alt-bg`).
4. What We Do: `.festival-grid` and `.activity-grid`.
5. Our Team: cards from `_data/team.yml` (`alt-bg`), hidden if no members.
6. Join CTA: shared `.cta-band`.

Non-home pages use `.page-block` (same padding as `.home-section`). `.cta-band`, `.btn-light` and `.btn-ghost-light` are top-level in `pages.scss` so any page can use them.

## Styles

- Brand colours: `$primary-color` `#FF7722` (saffron), `$secondary-color` `#FFA55A`, `$accent-color` `#FFD8B5`.
- Theme colours come from CSS variables set on `body.theme-light` / `body.theme-dark` in `base.scss`.
- Mobile-first: `@include respond-to(md) { ... }` adds rules at 768px and up.
- The header uses flex `space-between`. Below 768px the logo gets `margin-right: auto`, the controls are `order: 2`, and the hamburger is `order: 3`, so the hamburger sits at the far right.
- The banner is 500px tall on desktop with `object-fit: cover`. Below 768px it is `height: auto` and the image is `position: static`, so the full image shows.
- Fonts: Poppins (sans). Icons: Font Awesome 6.4 from a CDN (`fas`, `far` classes).

## JavaScript behaviour

- **i18n:** `language-switcher.js` fetches `${siteBaseUrl}/assets/js/i18n/<lang>.json`. It replaces the `textContent` of every `[data-i18n]` element whose key exists. Missing keys keep the HTML text. It only sets `textContent`, so do not put markup inside `data-i18n` elements. `data-i18n-alt` is not implemented.
- **Theme:** `theme-switcher.js` uses the saved choice, or the system preference if none is saved. It replaces the whole `body` className.
- **Banner height:** `main.js` `setImageHeight()` sets `width × 0.4` at 768px and wider. Below that it clears the inline height. It runs on load and on resize.
- **Gallery:** `lightGallery` is initialised on every `.gallery-grid`.
- **Event modal:** it binds only to `.event-card a.btn` links whose href contains `/events/`. Register links go to Google Forms, so they open normally.
