import 'package:money_manager/enums/theme_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  static final String _key = "theme";
  static final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future<ThemeStyle> getTheme() async {
    final prefs = await _prefs;
    var idx = prefs.getInt(_key) ?? ThemeStyle.light.index;
    return ThemeStyle.values[idx];
  }

  static Future<bool> setTheme(ThemeStyle theme) async {
    final prefs = await _prefs;
    return prefs.setInt(_key, theme.index);
  }
}