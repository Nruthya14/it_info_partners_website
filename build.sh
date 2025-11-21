#!/bin/bash

# Stop on first error
set -e

echo "🛠️ Installing Flutter SDK..."

# Remove existing Flutter SDK if present (Netlify caches build folders)
if [ -d "flutter" ]; then
  echo "⚠️ Existing Flutter SDK found. Removing..."
  rm -rf flutter
fi

# Clone fresh Flutter SDK
git clone https://github.com/flutter/flutter.git -b stable --depth 1
export PATH="$PATH:`pwd`/flutter/bin"

echo "📦 Flutter version:"
flutter --version

echo "🚀 Building Flutter web..."
flutter config --enable-web
flutter pub get

# Build optimized web release
flutter build web --release

echo "✅ Build complete. Output in build/web"
