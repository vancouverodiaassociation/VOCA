# Vancouver Odia Cultural Association (VOCA) Website

This repository contains the source code for the Vancouver Odia Cultural Association website, a not-for-profit social and cultural organization based in Vancouver, Canada.

## Features

- Static website hosted on GitHub Pages
- Internationalization support (English and Odia)
- Dark/Light theme toggle
- Responsive design for all devices
- Event calendar
- Event gallery with photos and videos
- Social media integration
- Google Forms integration for event registration

## Development Setup

### Prerequisites

- Ruby version 2.7.0 or higher
- Bundler
- Jekyll
- Xcode Command Line Tools

### Setup

1. Clone this repository
2. Navigate to the project directory
3. Install dependencies:

   Run this in your terminal:
   
   ```bash
   # 1. Remove the broken stub
   rbenv uninstall -f 3.2.2
   
   # 2. Reinstall (needs Xcode CLT + openssl; installs cleanly)
   rbenv install 3.2.2
   
   # 3. Activate and verify
   rbenv local 3.2.2   # already set via .ruby-version, harmless to re-run
   rbenv rehash
   ruby -v             # MUST show 3.2.2 now, not 4.0.5
   ```
   
   Once `ruby -v` shows **3.2.2**, do the bundle reset:
   
   ```bash
   # 4. Wipe stale bundles built against 2.6 / 4.0
   rm -rf vendor/bundle

   # 5. Reinstall and run
   gem install bundler
   bundle install
   bundle exec jekyll serve
   ```
   
   Two notes:
   - If `rbenv install 3.2.2` fails to compile, it's usually a missing dependency. The common fix on Apple Silicon is:
     ```bash
     brew install openssl@3 readline libyaml
     RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@3)" rbenv install 3.2.2
     ```
   - Make sure `eval "$(rbenv init - zsh)"` is in your `~/.zshrc` so this persists across new terminals. You already ran it in the current session, but it only helps once a real 3.2.2 exists.

4. Start the local development server:
   ```bash
   bundle exec jekyll serve
   ```
5. Open your browser and go to http://localhost:4000

## Content Management

The content of the website can be easily updated by modifying the files in the `_data` directory:
- `events.yml`: Add or modify events
- `gallery.yml`: Update gallery content
- `i18n/`: Update translations for English and Odia

Alternatively, you can modify the JSON files in the `assets/js/i18n/` directory for translations and `assets/js/events.json` for event data.

## GitHub Tracking

   ```text
   * git init / git add . / git commit -m "..."
   * git config --local --list
   * git config --local user.name "odia" && git config --local user.email "odia@odia.org"
   * git remote add origin git@github.com:vancouverodiaassociation/VOCA.git
   * Go to GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic) ____ Click "Generate new token" → "Generate new token (classic)" ____ Select the necessary scopes (at minimum, select "repo" for full repository access) ____ Click "Generate token" ____ Important: Copy the token immediately as you won't be able to see it again
   * git remote set-url origin https://vancouverodiaassociation:YOUR_TOKEN@github.com/vancouverodiaassociation/VOCA.git
   * git branch -M main
   * git push -u origin main
   ```

## Deployment

The website can be deployed to GitHub Pages by:

1. Push changes to the main branch
2. Go to the repository settings
3. Enable GitHub Pages for the main branch

## License

This project is licensed under the MIT License - see the LICENSE file for details.
