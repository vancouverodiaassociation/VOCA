# Content management

## Events

File: `_data/events.yml`. Order in the file does not matter; pages sort by `date`.

```yaml
- id: durga-puja-2026            # unique slug; also used in i18n keys events.<id>.*
  title: "Durga Puja"
  date: 2026-10-18               # ISO date; drives sorting and upcoming/past
  date_label: "Sunday, October 18, 2026"   # display only; must match `date`
  time: "11:00 AM"
  venue: "Laxmi Narayan Mandir, Surrey"
  address: "8321 140 St, Surrey, BC V3W 5K9"
  image: "/assets/images/events/durga-puja.jpg"   # about 3:2, at least 600px wide
  description: >-
    One or two sentences. Cards clamp to 3 lines.
  register_url: "https://forms.gle/..."  # optional; omit to hide the Register button
```

Checklist:
- `date` and `date_label` describe the same day.
- The image exists under `assets/images/events/`.
- Optional Odia text goes in `or.json` under `events.<id>` with keys `title`, `dateLabel`, `venue` and `description`.
- Rebuild. The event appears on the home page only if it is among the next 3 upcoming events.

## Sponsors

File: `_data/sponsors.yml`. Logos go in `assets/images/sponsors/`. Use a transparent PNG or SVG, about 3:1 landscape.

```yaml
- name: "Acme Foods"                            # required; used as alt text
  logo: "/assets/images/sponsors/acme.png"      # optional; name shown as text if empty
  url: "https://acme.example"                   # optional; makes the tile a link
```

Logos are shown in greyscale and switch to colour on hover. If the list is empty, only the "Become a Sponsor" call to action shows. The file currently contains placeholder sponsors. Replace them before publishing.

## Team

File: `_data/team.yml`, rendered in the "Our Team" section of `about.html`. The section is hidden when `members` is empty.

```yaml
year: 2026
members:
  - id: president                 # unique slug; Odia bio key about.team.<id>.bio
    name: "Full Name"
    role: "President"
    role_key: president           # optional; translated via about.team.roles.<role_key>
    photo: "/assets/images/profile/name.jpg"   # optional; square, >=400px; initials shown if empty
    bio: >-
      One to three sentences.
    email: ""                     # optional; mail icon
    linkedin: ""                  # optional; LinkedIn icon
```

Update `year` and the members each term. The file currently contains placeholder names. Replace them before publishing.

## Gallery

The Gallery page (`full-gallery.html`, URL `/gallery/`) has two sources:

1. **Community Moments.** Local files `assets/images/gallery/gallery1.jpg` to `gallery8.jpg`, rendered by `{% for i in (1..8) %}`. To add a photo, add `gallery9.jpg` and change the range to `(1..9)`.
2. **Google Drive albums.** Defined in `_data/gdrive_gallery.yml`. Each album has `album_title`, `album_id` and `photos`, where each photo has `url`, `thumbnail_url` and `alt`. Use Drive links in these forms:
   - full image: `https://drive.google.com/uc?export=view&id=FILE_ID`
   - thumbnail: `https://drive.google.com/thumbnail?id=FILE_ID&sz=w400`
   The files must be shared as "Anyone with the link". The file currently holds broken via.placeholder.com entries. Replace or delete them.

The home page has no gallery section.

## Translations

- Files: `assets/js/i18n/en.json` (complete) and `or.json` (partial).
- The HTML fallback text should match the `en.json` value.
- Key namespaces: `nav.*`, `footer.*`, `common.*`, `home.<section>.*`, `events.*`, `about.*`, `contact.*`, `galleryPage.*`.
- Add keys with small targeted edits. Keep the existing 2-space layout and the key order.
- Check validity: `python3 -c "import json;json.load(open('assets/js/i18n/or.json'))"`. A trailing comma or a missing comma breaks every translation on the site.
