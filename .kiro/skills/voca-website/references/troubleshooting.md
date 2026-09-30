# Troubleshooting

## Site served at the wrong path

The server URL comes from `baseurl` in `_config.yml`. It is currently `/voca`. Restart `jekyll serve` after changing it. GitHub Pages paths are case-sensitive and must match the repo name. The repo is `VOCA`, so confirm that the production URL resolves under `/voca/`. If it doesn't, set `baseurl: "/VOCA"`.

## Change not visible

- You edited `_site/`. Edit the source instead.
- You edited `_config.yml` and haven't restarted `jekyll serve`.
- The browser cached `main.css` or `main.js`. Hard refresh.
- A translation overwrote your HTML text. The JS replaces `[data-i18n]` text with the JSON value, so update `en.json` too.

## Layout wrong at a certain width

- Check both sides of 768px. Most mobile rules are `max-width: 767px`, and desktop rules use `respond-to(md)`.
- An inline style from JS can override CSS. Inspect the element; `main.js` sets the banner height.
- An old rule `@media (max-width: 600px)` in the `.banner` block of `components.scss` used to set a fixed height. It has been removed; don't add it back.

## Events missing or in the wrong place

- `date` is in the past relative to the last build, so the event moved to Past Events.
- `date` doesn't match `date_label`, so it sorts in the wrong position.
- A YAML indentation error in `events.yml` makes the build fail or drops entries. Run `bundle exec jekyll build` and read the error.

## Translations stop working entirely

One of the JSON files is invalid. Validate it with `python3 -c "import json;json.load(open(...))"`. Check the browser console for fetch errors.

## Ruby or Bundler errors

The project uses Ruby 3.2.2 via rbenv (`.ruby-version`). If `ruby -v` shows a different version, run `eval "$(rbenv init - zsh)"` and then `rbenv rehash`. After a Ruby change, run `rm -rf vendor/bundle && bundle install`. The README has the full reinstall steps.

## Git and deploy

- Deploy by pushing to `main`; GitHub Pages builds the site.
- Authenticate with SSH (`git@github.com:vancouverodiaassociation/VOCA.git`), a credential helper, or `gh auth login`. Never embed a personal access token in the remote URL. It is stored in plain text in `.git/config` and shows up in `git remote -v`.
- `.gitignore` already excludes `_site/`, `vendor/`, `.bundle/`, `.jekyll-cache/`, `.idea/` and `.env*`.
