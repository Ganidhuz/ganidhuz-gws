<p align="center">
  <img src="baymax.png" width="120" alt="Baymax" />
</p>

# 🗂️ ganidhuz-gws

> Google's own CLI. Multi-account. The way it should've shipped.

OpenClaw's built-in Google integration is great — but if you've ever hit inconsistency issues with Gmail or Drive, you're not alone. [GWS](https://github.com/nicholasgasior/gws) is Google's own official CLI, and it's rock solid.

There's just one problem: Google removed native multi-account support from it. 😉

This skill patches that gap — letting you seamlessly switch between any number of Google accounts without re-logging or token collisions.

---

## ✨ Features

- **Fills the gap Google left** — multi-account support GWS dropped, restored
- **One wrapper per account** — `gws-work`, `gws-personal`, `gws-throwaway` — just works
- **Full Google Workspace coverage** — Gmail, Drive, Calendar, Docs, Sheets
- **More reliable than built-in integrations** — uses Google's own official CLI under the hood
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
