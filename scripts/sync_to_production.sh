#!/usr/bin/env bash
# ==============================================================================
# sync_to_production.sh — SLSCM Lab Subtree Synchronization Script
# ==============================================================================
# Safely splits `web/` into a clean standalone branch, re-signs all commits
# with Trung Le Huu's SSH signing key, and pushes to `slscm-lab/website:main`.
# ==============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

cd "${ROOT_DIR}"

echo "======================================================================"
echo "🚀 SLSCM Lab: Synchronizing web/ to Production (slscm-lab/website)"
echo "======================================================================"

# 1. Verify working directory is clean
if [[ -n "$(git status --porcelain)" ]]; then
  echo "❌ Error: Working tree is not clean. Please commit or stash changes before syncing."
  git status --short
  exit 1
fi

# 2. Verify we are on master
CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"
if [[ "${CURRENT_BRANCH}" != "master" ]]; then
  echo "⚠️ Warning: You are on branch '${CURRENT_BRANCH}', not 'master'."
  read -p "Do you want to continue? (y/N): " confirm
  if [[ "${confirm}" != "y" && "${confirm}" != "Y" ]]; then
    echo "Aborted."
    exit 1
  fi
fi

# 3. Test build locally before pushing
echo "📦 Running frontend build verification..."
npm --prefix web run build

# 4. Check or configure slscm-web remote
REMOTE_URL="https://github.com/slscm-lab/website.git"
if ! git remote get-url slscm-web >/dev/null 2>&1; then
  echo "🔗 Adding slscm-web remote: ${REMOTE_URL}"
  git remote add slscm-web "${REMOTE_URL}"
fi

# 5. Split web/ into standalone branch
echo "🌿 Splitting web/ subtree into web-deploy branch..."
git branch -D web-deploy 2>/dev/null || true
git subtree split --prefix=web -b web-deploy

# 6. Re-sign all commits with SSH key for GitHub "Verified" badge
echo "🔏 Re-signing commits with ed25519 SSH signing key..."
git checkout -B web-signed web-deploy
git rebase --exec 'git commit --amend --no-edit -S' --root

# 7. Push to slscm-lab/website main branch bypassing 9Router proxy
echo "🚀 Pushing web-signed branch to slscm-lab/website:main..."
env -u HTTPS_PROXY -u HTTP_PROXY -u https_proxy -u http_proxy -u ALL_PROXY -u SSL_CERT_FILE \
  git push slscm-web web-signed:main --force

# 8. Return to original branch
echo "🔙 Returning to ${CURRENT_BRANCH}..."
git checkout "${CURRENT_BRANCH}"

echo "======================================================================"
echo "✅ SUCCESS! Production repository is synchronized and verified:"
echo "   Repo: https://github.com/slscm-lab/website"
echo "   Live: https://slscm-lab.vercel.app"
echo "======================================================================"

