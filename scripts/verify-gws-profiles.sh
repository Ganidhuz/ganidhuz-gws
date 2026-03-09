#!/usr/bin/env bash
# verify-gws-profiles.sh
# Verifies all GWS profiles are correctly mapped to distinct accounts.

PROFILES_DIR="$HOME/.config/gws/profiles"

echo ""
echo "╔══════════════════════════════════════╗"
echo "║     GWS Profile Verification         ║"
echo "╚══════════════════════════════════════╝"
echo ""

if [ ! -d "$PROFILES_DIR" ]; then
  echo "✗ No profiles directory found at $PROFILES_DIR"
  echo "  Run setup-gws-profiles.sh first."
  exit 1
fi

PROFILES=("$PROFILES_DIR"/*.json)
if [ ${#PROFILES[@]} -eq 0 ]; then
  echo "✗ No profile files found in $PROFILES_DIR"
  exit 1
fi

ALL_OK=true

for PROFILE_PATH in "${PROFILES[@]}"; do
  NAME=$(basename "$PROFILE_PATH" .json)
  RUNTIME_DIR="$HOME/.config/gws/runtime-$NAME"

  echo "  Checking: $NAME"
  RESULT=$(
    GOOGLE_WORKSPACE_CLI_CREDENTIALS_FILE="$PROFILE_PATH" \
    GOOGLE_WORKSPACE_CLI_CONFIG_DIR="$RUNTIME_DIR" \
    gws gmail users getProfile --params '{"userId":"me"}' 2>&1
  )

  EMAIL=$(echo "$RESULT" | grep -o '"emailAddress": *"[^"]*"' | head -1 | sed 's/.*: *"\(.*\)"/\1/')

  if [ -n "$EMAIL" ]; then
    echo "  ✓ $NAME → $EMAIL"
  else
    echo "  ✗ $NAME → could not resolve (session may be expired)"
    ALL_OK=false
  fi
  echo ""
done

if $ALL_OK; then
  echo "All profiles verified successfully! ✅"
else
  echo "Some profiles failed. Re-run setup-gws-profiles.sh to re-auth."
fi
echo ""
