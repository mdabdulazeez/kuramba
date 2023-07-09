import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../themes/themes.dart' as themes;

enum ThemeColor {
  green,
}

class DynamicTheme with ChangeNotifier {
  ThemeColor _currentThemeColor = ThemeColor.green;
  ThemeMode _currentThemeMode = ThemeMode.system;

  ThemeColor get currentThemeColor => _currentThemeColor;

  ThemeMode get currentThemeMode => _currentThemeMode;

  Map<String, ThemeMode> get availableThemeModes {
    return {
      'System': ThemeMode.system,
      'Light': ThemeMode.light,
      'Dark': ThemeMode.dark,
    };
  }

  Map<String, ThemeColor> get availableThemeColors {
    return {
      'Green': ThemeColor.green,
    };
  }

  Future<void> setThemeColor(ThemeColor themeColor) async {
    _currentThemeColor = themeColor;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('themeColor', themeColor.index);
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    _currentThemeMode = themeMode;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('themeMode', themeMode.index);
  }

  Future<void> fetchThemeData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('themeColor')) {
      _currentThemeColor = ThemeColor.values[prefs.getInt('themeColor')!];
    }
    if (prefs.containsKey('themeMode')) {
      _currentThemeMode = ThemeMode.values[prefs.getInt('themeMode')!];
    }
  }

  ThemeData get theme {
    switch (_currentThemeColor) {
      case ThemeColor.green:
        return themes.greenTheme;
      default:
        return themes.greenTheme;
    }
  }

  ThemeData get darkTheme {
    switch (_currentThemeColor) {
      case ThemeColor.green:
        return themes.greenDarkTheme;
        //break;
      default:
        return themes.greenDarkTheme;
    }
  }
}
