# ApeX Vigne

### Update packages dependencies
```
flutter pub get
```

### Rebuild components
```
dart run build_runner build
```

### Update icons
```
dart run _flutter_launcher_icons
```

### Notes
- If 'material_symbols_icons' package won't work, replace all Symbols.youricon => Icons.youricon and remove the package from pubspec.yaml
- You'll soon change WillPopScope by PopScope cause WillPopScope is deprecated but PopScope is actually bugged
- Keep an eye on the 'vibration' package for any update, cause he's actually using a deprecated package


