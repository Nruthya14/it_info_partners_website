#!/bin/bash

# Stop on first error
set -e

echo "🛠️ Installing Flutter SDK..."
git clone https://github.com/flutter/flutter.git -b stable --depth 1
export PATH="$PATH:`pwd`/flutter/bin"

echo "📦 Flutter version:"
flutter --version

echo "🚀 Building Flutter web..."
flutter config --enable-web
flutter pub get
flutter build web

echo "✅ Build complete. Output in build/web"

