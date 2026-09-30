---
inclusion: always
---

# Product Overview

The Vancouver Odia Cultural Association (VOCA) is a non-profit cultural association based in Surrey, BC. This repository is its public website.

## Audience

- Odia families and individuals in the Vancouver metro area and across British Columbia, including newcomers to Canada.
- People interested in Odia and Indian culture.
- Local businesses that sponsor or might sponsor events.

Many visitors arrive on phones from social media links. Treat mobile layout (under 768px) as a primary target, not an afterthought.

## What the site must do

1. **Promote upcoming events** and send people to the Google Forms registration link. This is the site's main job.
2. **Explain who VOCA is** and invite people to join (mailto to the association email).
3. **Recognise sponsors** and invite new ones.
4. **Show community photos** on the Gallery page.
5. **Support English and Odia** via the language switcher, plus light and dark themes.

## Pages

| Page | Purpose |
|------|---------|
| Home (`index.html`) | Banner, welcome/about, next 3 events, Why Join, sponsors |
| Events (`events.html`) | All upcoming events, then past events |
| Gallery (`full-gallery.html`, `/gallery/`) | Community photos and Google Drive albums |
| About (`about.html`) | Story, values, vision, what we do |
| Contact (`contact.html`) | Email, location, social links |

## Content and tone

- Warm, welcoming, community-focused. Plain language that a first-time visitor understands.
- Brand colour is saffron orange (`#FF7722`). Visual style is modern and clean: rounded cards, generous spacing, alternating section backgrounds.
- Don't repeat the same content in more than one section. For example, the mission statement lives only in the home Welcome section.
- Event, sponsor and gallery content is maintained by non-developers in `_data/*.yml`. Keep those formats simple and documented.
- Don't invent facts about VOCA such as people, dates, sponsors or addresses. Use clearly marked placeholders and flag them to the user.
