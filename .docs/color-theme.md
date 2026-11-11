# VOCA Color Theme — "Jagannath Warmth"

Finalized color palette for the Vancouver Odia Cultural Association website.

## Goal

A palette that is:

- **Culturally specific to Odia heritage** — not a generic "Indian site" orange. Draws on the
  Jagannath temple flag (crimson), haladi/turmeric (gold), and Konark stonework (terracotta).
- **Warm and welcoming** — the site's main job is to greet first-time visitors, often newcomers,
  mostly on phones from social media links.
- **Accessible** — all text roles meet WCAG AA contrast.
- **Dual-theme** — works in both light and dark mode, which the site already supports via CSS
  variables (`--bg-color`, `--text-color`, `--card-bg`, `--border-color`).

This replaces the original saffron-orange brand (`#FF7722`). Moving off saffron is an intentional
rebrand, approved while the site is still pre-launch.

## Palette

### Light theme

| Role         | Hex       | Inspiration            | Where to use                                   |
|--------------|-----------|------------------------|------------------------------------------------|
| Primary      | `#C1272D` | Temple-flag crimson    | Buttons, links, primary CTAs, heading accents  |
| Primary hover| `#9E1F24` | Deeper crimson         | Hover / active state of primary elements       |
| Secondary    | `#E8A13A` | Haladi / turmeric gold | Fills, icons, dividers — **decorative only**   |
| Accent       | `#D96C3F` | Konark terracotta      | Tags, hover highlights, small supporting accents|
| Background   | `#FAF6F0` | Tussar silk / ivory    | Page background                                |
| Surface/Card | `#FFFFFF` | —                      | Cards and panels (lift off the ivory bg)       |
| Text         | `#1E1B18` | Kajal / warm charcoal  | Body text, headings                            |
| Muted text   | `#5B534C` | —                      | Secondary/supporting text (AA-passing)         |
| Border       | `#E6DED3` | —                      | Card and section borders                       |

### Dark theme

| Role         | Hex       | Where to use                                   |
|--------------|-----------|------------------------------------------------|
| Primary      | `#F2555A` | Lightened crimson so it glows on dark          |
| Primary hover| `#F67A7E` | Hover / active                                 |
| Secondary    | `#F0B861` | Lightened turmeric — decorative only           |
| Accent       | `#E88A5E` | Lightened terracotta                           |
| Background   | `#1A1613` | Warm near-black (not cold grey)                |
| Surface/Card | `#262019` | Warm dark surface                              |
| Text         | `#F3ECE2` | Warm off-white                                 |
| Muted text   | `#B3A89B` | Secondary text                                 |
| Border       | `#3A322A` | Card and section borders                       |

## Usage rules

These rules keep the palette readable and on-brand. Follow them when applying colors.

1. **Crimson carries brand + interaction.** Buttons, links, and primary CTAs use the primary
   crimson. White text on `#C1272D` is ~5.0:1 contrast → passes WCAG AA for normal text.
2. **Gold and terracotta are accent-only.** Use them for fills, icons, borders, and decorative
   dividers — **never for body text or small text on a light background.** Gold on ivory fails AA
   contrast. If a gold-ish *text* color is ever needed, darken to about `#8A5A12`.
3. **Avoid muddy mid-tones.** Terracotta sits between crimson and gold on the hue wheel; keep it to
   small accents so large crimson and terracotta areas don't blur together.
4. **Warm neutrals, not grey.** Backgrounds and borders lean warm (ivory, warm charcoal) to match
   the cultural tone. Don't introduce cold pure-greys.
5. **Everything routes through the existing CSS variables.** No new theming machinery is needed —
   only the token values change.

## Contrast quick-reference (light theme)

| Pair                              | Ratio   | Verdict        |
|-----------------------------------|---------|----------------|
| Text `#1E1B18` on bg `#FAF6F0`    | ~15:1   | Pass (AAA)     |
| White on primary `#C1272D`        | ~5.0:1  | Pass (AA)      |
| Muted `#5B534C` on bg `#FAF6F0`   | ~6.4:1  | Pass (AA)      |
| Gold `#E8A13A` on bg `#FAF6F0`    | ~1.8:1  | **Fail — accents only, never text** |

## Mapping to the codebase

All tokens live in `_sass/variables.scss`, then flow into CSS custom properties in
`_sass/base.scss` under `.theme-light` / `.theme-dark`.

```scss
// _sass/variables.scss — brand
$primary-color:        #C1272D;
$primary-hover:        #9E1F24;
$secondary-color:      #E8A13A;
$accent-color:         #D96C3F;

// Light theme
$light-bg:             #FAF6F0;
$light-card-bg:        #FFFFFF;
$light-text:           #1E1B18;
$light-text-muted:     #5B534C;
$light-border:         #E6DED3;

// Dark theme
$dark-primary:         #F2555A;
$dark-primary-hover:   #F67A7E;
$dark-secondary:       #F0B861;
$dark-accent:          #E88A5E;
$dark-bg:              #1A1613;
$dark-card-bg:         #262019;
$dark-text:            #F3ECE2;
$dark-text-muted:      #B3A89B;
$dark-border:          #3A322A;
```

> Note: primary/secondary/accent are currently single values shared by both themes. To get the
> lightened dark-mode brand colors above, they should also become CSS variables under
> `.theme-light` / `.theme-dark` (like bg/text/border already are), rather than SCSS constants used
> directly. This is a small refactor to do at implementation time.

## Status

Finalized as the target palette. Not yet wired into `_sass/variables.scss`. When implementing,
verify both light and dark themes at desktop (1280px) and mobile (500px) using
`bash .kiro/skills/voca-website/scripts/verify.sh`.
