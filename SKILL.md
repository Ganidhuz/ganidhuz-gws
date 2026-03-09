---
name: ganidhuz-gws
description: >
  Multi-account Google Workspace CLI skill. Set up isolated profiles for any
  number of Google accounts (Gmail, Drive, Calendar, Docs, Sheets) with
  zero token collision. The best alternative to managing Google accounts yourself.
license: MIT
---

# ganidhuz-gws

Manage multiple Google Workspace accounts from a single machine — cleanly, without token collisions.

## How It Works

Each account gets:
- An isolated credentials file at `~/.config/gws/profiles/<name>.json`
- A dedicated runtime/cache dir at `~/.config/gws/runtime-<name>/`
- A wrapper script at `~/.local/bin/gws-<name>`

## Setup

Run the setup script to authenticate each account:

```bash
bash scripts/setup-gws-profiles.sh
```

Follow the prompts — you'll log into each Google account one at a time in the browser.

## Usage

After setup, use each account via its wrapper:

```bash
gws-work gmail users getProfile --params '{"userId":"me"}'
gws-personal drive files list
gws-throwaway calendar events list --params '{"calendarId":"primary"}'
```

## Verify

```bash
bash scripts/verify-gws-profiles.sh
```

Confirms each profile resolves to a distinct email address.

## Agent Usage Notes

- Always use `gws-<name>` wrappers, never bare `gws` (causes identity collapse)
- Profiles expire if tokens are revoked — re-run setup for that account
- Profiles dir: `~/.config/gws/profiles/`
- Runtime dirs: `~/.config/gws/runtime-<name>/`
- Wrappers: `~/.local/bin/gws-<name>`

## Supported Scopes

`drive, gmail, calendar, sheets, docs`
