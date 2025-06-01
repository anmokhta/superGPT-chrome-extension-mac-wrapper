#!/bin/bash

APP_DIR="/Applications/SuperGPT"
CHROMIUM="$APP_DIR/Chromium.app/Contents/MacOS/Chromium"
EXT_DIR="$APP_DIR/Superpower-ChatGPT"
PROFILE_DIR="$APP_DIR/.chromium-myapp-profile"
APP_URL="https://chatgpt.com/"

"$CHROMIUM" \
  --user-data-dir="$PROFILE_DIR" \
  --load-extension="$EXT_DIR" \
  --app="$APP_URL" \
  --no-first-run \
  --disable-sync \
  --disable-component-update \
  --disable-background-networking \
  --disable-default-apps \
  --disable-domain-reliability \
  --metrics-recording-only \
  --no-default-browser-check \
  --disable-prompt-on-repost \
  --no-proxy-server \
  --no-pings \
  --disable-webrtc \
  --enable-logging=stderr \
  --v=1 \
  --disable-features=TranslateUI,LocalNetworkAccessNotifications,LocalNetworkRequests,GoogleApiKeysMissing \
  --enable-features=WebAuthentication,WebAuthenticationConditionalUI,OverlayScrollbars