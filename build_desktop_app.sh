#!/bin/zsh
set -euo pipefail

APP_NAME="Goat Health Dashboard"
APP_DIR="dist/${APP_NAME}.app"
CONTENTS_DIR="${APP_DIR}/Contents"
MACOS_DIR="${CONTENTS_DIR}/MacOS"
RESOURCES_DIR="${CONTENTS_DIR}/Resources"

rm -rf "${APP_DIR}"
mkdir -p "${MACOS_DIR}" "${RESOURCES_DIR}"

clang \
  -fobjc-arc \
  -framework Cocoa \
  -framework WebKit \
  desktop/GoatHealthDashboard.m \
  -o "${MACOS_DIR}/GoatHealthDashboard"

cp index.html "${RESOURCES_DIR}/index.html"
cp manifest.webmanifest "${RESOURCES_DIR}/manifest.webmanifest"
cp service-worker.js "${RESOURCES_DIR}/service-worker.js"
cp -R assets "${RESOURCES_DIR}/assets"
cp assets/AppIcon.icns "${RESOURCES_DIR}/AppIcon.icns"

cat > "${CONTENTS_DIR}/Info.plist" <<'PLIST'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>CFBundleDevelopmentRegion</key>
  <string>en</string>
  <key>CFBundleExecutable</key>
  <string>GoatHealthDashboard</string>
  <key>CFBundleIdentifier</key>
  <string>local.codex.goat-health-dashboard</string>
  <key>CFBundleIconFile</key>
  <string>AppIcon</string>
  <key>CFBundleInfoDictionaryVersion</key>
  <string>6.0</string>
  <key>CFBundleName</key>
  <string>Goat Health Dashboard</string>
  <key>CFBundlePackageType</key>
  <string>APPL</string>
  <key>CFBundleShortVersionString</key>
  <string>1.0</string>
  <key>CFBundleVersion</key>
  <string>1</string>
  <key>LSMinimumSystemVersion</key>
  <string>11.0</string>
  <key>NSHighResolutionCapable</key>
  <true/>
</dict>
</plist>
PLIST

echo "Built ${APP_DIR}"
