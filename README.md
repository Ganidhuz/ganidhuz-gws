<p align="center">
  <img src="baymax.png" width="120" alt="Baymax" />
</p>

# 🗂️ ganidhuz-gws

> The multi-account Google Workspace CLI setup Google never gave you.

Manage Gmail, Drive, Calendar, Docs, and Sheets across multiple Google accounts — from one machine, with zero token collisions. No juggling, no re-logging, no mess.

Built because Google's own tooling doesn't handle multi-account workflows without things breaking. 😉

---

## ✨ Features

- **Multiple accounts, zero collisions** — each account gets its own isolated credentials and runtime
- **One wrapper per account** — `gws-work`, `gws-personal`, `gws-throwaway` — just works
- **Full Google Workspace coverage** — Gmail, Drive, Calendar, Docs, Sheets
- **OpenClaw skill** — plug-and-play with [OpenClaw](https://openclaw.ai)
- **No manual env vars** — wrappers handle everything automatically

---

## 🚀 Install

Paste this into OpenClaw or any compatible agent:

```
clawhub install ganidhuz-gws
```

---

## 🔐 Setup

Run the setup script once — it walks you through logging into each Google account:

```bash
bash scripts/setup-gws-profiles.sh
```

You'll be asked how many accounts you want, their names (e.g. `work`, `personal`, `throwaway`), and their emails. A browser window will open for each one — just pick the right account and you're done.

---

## 📋 What Can It Do?

Just tell your agent which account to use — it handles the rest.

- 📬 **"Check unread emails on my work account"** — reads from the right inbox every time
- 📁 **"List files in my personal Drive"** — no cross-account confusion
- 📅 **"What's on my throwaway calendar today?"** — clean, isolated access
- 📝 **"Create a doc in my work account"** — scoped to exactly the account you mean

---

## ✅ Verify Your Setup

After setup, confirm all accounts are correctly mapped:

```bash
bash scripts/verify-gws-profiles.sh
```

Each profile should resolve to a distinct email address.

---

## 🤝 Contributing

Got another Google Workspace service you want covered? Hit a token issue? Something break on your setup?

PRs and issues are very welcome. The more accounts and setups this gets tested on, the better it gets.

[Open an issue](https://github.com/Ganidhuz/ganidhuz-gws/issues) or just submit a PR. 🙌

---

## 📄 License

MIT

---

<p align="center">
  <sub>Built by Ganidhu and Baymax</sub>
</p>
