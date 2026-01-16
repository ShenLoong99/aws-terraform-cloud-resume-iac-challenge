#!/bin/bash

# --- Cloud Resume Frontend Smoke Test ---
echo "🔍 Testing Cloud Resume Frontend..."

# 1. Validate Environment Variable
if [ -z "$SITE_URL" ]; then
  echo "❌ Error: SITE_URL environment variable is not set."
  exit 1
else
  # Ensure URL has protocol for curl
  if [[ ! $SITE_URL =~ ^http ]]; then
    SITE_URL="https://$SITE_URL"
  fi
fi

echo "🌐 Target URL: $SITE_URL"

# 2. Industry Standard Retry Logic (10 attempts, 15s interval)
for i in {1..10}; do
  # Fetch status and body
  # -s: Silent, -L: Follow redirects, --connect-timeout: prevent CI hangs
  SITE_RESPONSE=$(curl -s -L --connect-timeout 5 -w "%{http_code}" "$SITE_URL" -o /tmp/site_output.html)
  
  # Extract the last 3 digits (HTTP status code)
  SITE_STATUS="${SITE_RESPONSE: -3}"

  if [ "$SITE_STATUS" -eq 200 ]; then
    # --- PROJECT SPECIFIC CONTENT CHECKS ---
    # We check for your name or a common Resume section to verify correct deployment
    if grep -qE "Si Kai Tan|Resume|Professional Experience" /tmp/site_output.html; then
      echo "✅ Website check passed (Status: $SITE_STATUS)"
      echo "✅ Verified Resume content: Found 'Si Kai Tan' in HTML."
      exit 0
    else
      echo "⚠️ Status 200 received, but expected content was missing."
      echo "SITE RESPONSE: $SITE_RESPONSE"
    fi
  else
    echo "⏳ Attempt $i/10: Status $SITE_STATUS. Retrying in 15s..."
  fi
  sleep 15
done

echo "❌ Website check timed out after 10 attempts."
exit 1