# ApeX Vigne

### Update packages dependencies
flutter pub get

### Update icons
dart run _flutter_launcher_icons

### Notes

- If 'material_symbols_icons' doesn't work, replace all Symbols.youricon => Icons.youricon
- You'll soon change WillPopScope by PopScope cause WillPopScope is deprecated but PopScope is actually bugged
- Keep an eye on the 'vibration' package for any update, cause he's actually using a deprecated package
