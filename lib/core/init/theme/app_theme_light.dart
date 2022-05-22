import 'package:flutter/material.dart';
import 'package:flutterproject/core/init/theme/app_theme.dart';

class AppThemeLight extends AppTheme {
  static AppThemeLight? _instance;
  static AppThemeLight? get instance {
    if (_instance == null) {
      _instance = AppThemeLight._init();
      return _instance;
    }
    return null;
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData.light();
}
