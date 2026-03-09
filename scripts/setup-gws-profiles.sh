#!/usr/bin/env bash
# setup-gws-profiles.sh
# Sets up isolated multi-account GWS profiles and wrapper scripts.
# Usage: bash scripts/setup-gws-profiles.sh

set -e

PROFILES_DIR="$HOME/.config/gws/profiles"
BIN_DIR="$HOME/.local/bin"

mkdir -p "$PROFILES_DIR" "$BIN_DIR"

echo ""
echo "╔══════════════════════════════════════╗"
echo "║     GWS Multi-Account Setup          ║"
echo "╚══════════════════════════════════════╝"
echo ""
echo "You'll be asked to log in for each account one at a time."
echo "Make sure to pick the correct account in the browser each time."
echo ""

login_account() {
  local NAME=$1
  local EMAIL=$2
  local PROFILE_PATH="$PROFILES_DIR/$NAME.json"
  local RUNTIME_DIR="$HOME/.config/gws/runtime-$NAME"
  local WRAPPER="$BIN_DIR/gws-$NAME"

  echo "──────────────────────────────────────"
  echo "  Account: $NAME ($EMAIL)"
  echo "──────────────────────────────────────"
  echo "→ Logging out any existing session..."
  gws auth logout 2>/dev/null || true

  echo "→ Opening browser — please log in as: $EMAIL"
  gws auth login -s drive,gmail,calendar,sheets,docs

  echo "→ Exporting credentials..."
  gws auth export --unmasked > "$PROFILE_PATH"

  mkdir -p "$RUNTIME_DIR"

  echo "→ Writing wrapper to $WRAPPER"
  cat > "$WRAPPER" <<EOF
#!/usr/bin/env bash
GOOGLE_WORKSPACE_CLI_CREDENTIALS_FILE="$PROFILE_PATH" \\
GOOGLE_WORKSPACE_CLI_CONFIG_DIR="$RUNTIME_DIR" \\
gws "\$@"
EOF
  chmod +x "$WRAPPER"

  echo "✓ $NAME profile saved."
  echo ""
}

# Prompt for account names and emails
read -rp "How many accounts do you want to set up? " COUNT

for i in $(seq 1 "$COUNT"); do
  read -rp "  Account $i name (e.g. work, personal, throwaway): " ACC_NAME
  read -rp "  Account $i email: " ACC_EMAIL
  login_account "$ACC_NAME" "$ACC_EMAIL"
done

echo "══════════════════════════════════════"
echo "  All done! Your wrappers:"
echo ""
for f in "$BIN_DIR"/gws-*; do
  echo "  $f"
done
echo ""
echo "  Run: gws-<name> gmail users getProfile --params '{\"userId\":\"me\"}'"
echo "  to verify each account is correctly mapped."
echo "══════════════════════════════════════"
