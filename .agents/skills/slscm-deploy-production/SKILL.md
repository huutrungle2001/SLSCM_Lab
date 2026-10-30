---
name: slscm-deploy-production
description: >-
  Use this skill whenever building, verifying, and deploying website updates to GitHub Pages
  (https://slscm-lab.github.io) and Vercel. Automates verification, subtree split, GPG/SSH commit
  re-signing, and production synchronization via ./scripts/sync_to_production.sh.
---

# SLSCM Lab — Production Deployment & Subtree Sync Skill

This skill defines the operational workflow for deploying changes from the `huutrungle2001/SLSCM_Lab` monorepo to the public production website at [`slscm-lab/slscm-lab.github.io`](https://github.com/slscm-lab/slscm-lab.github.io).

## Multi-Platform Hosting Architecture

| Platform | Repository & Branch | Live URL | Deployment Trigger |
| :--- | :--- | :--- | :--- |
| **GitHub Pages** (Academic) | `slscm-lab/slscm-lab.github.io` (`main`) | [https://slscm-lab.github.io](https://slscm-lab.github.io) | Automatic on push |
| **Vercel** (Edge CDN) | `slscm-lab/slscm-lab.github.io` (`main`) | [https://slscm-lab.vercel.app](https://slscm-lab.vercel.app) | Automatic on push |
| **Dev / Staging** | `huutrungle2001/SLSCM_Lab` (`master`) | [https://slscm-dev.vercel.app](https://slscm-dev.vercel.app) | Automatic on monorepo push |

---

## One-Command Automated Production Sync

To deploy, execute:

```bash
./scripts/sync_to_production.sh
```

### What this script automates:
1. **Pre-flight Checks**: Confirms git working tree is clean and branch is `master`.
2. **Build Verification**: Runs `npm --prefix web run build` to catch TypeScript or bundling issues.
3. **Subtree Isolation**: Executes `git subtree split --prefix=web -b web-deploy`.
4. **Verified Commit Re-signing**: Spawns an isolated `/tmp` git worktree and re-signs all commits using the authorized SSH signing key (`~/.ssh/id_ed25519_huutrungle.pub`). This guarantees the GitHub **Verified** badge without disturbing running Vite dev servers.
5. **Proxy-Bypassing Push**: Pushes directly to `slscm-web web-signed:main --force`.
6. **Teardown**: Cleans up worktree and temporary deploy branches.

---

## Step-by-Step Manual Protocol (Fallback)

If running the script manually:

```bash
# 1. Test build
cd web && npm run build && cd ..

# 2. Split subtree
git branch -D web-deploy 2>/dev/null || true
git subtree split --prefix=web -b web-deploy

# 3. Checkout and re-sign
git checkout -B web-signed web-deploy
git rebase --exec 'git commit --amend --no-edit -S' --root

# 4. Push with proxy bypass
env -u HTTPS_PROXY -u HTTP_PROXY -u https_proxy -u http_proxy -u ALL_PROXY -u SSL_CERT_FILE \
  git push slscm-web web-signed:main --force

# 5. Return to master
git checkout master
git branch -D web-deploy web-signed
```
