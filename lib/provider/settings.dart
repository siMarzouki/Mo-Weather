import '../themes.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../util/converters.dart';

class SettingsManager extends ChangeNotifier {
  static TemperatureUnit? _unit;
  static int? _themeMode;
  static String? city;
  static const String cityKey = "city";
  static const String themeKey = "theme";
  static const String unitKey = "unit";

  TemperatureUnit get unit => _unit!;
  int get themeMode => _themeMode!;

  void updateUnit(TemperatureUnit unit) async {
    _unit = unit;
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(unitKey, unit.index);
    notifyListeners();
  }

  void updateTheme(int code) async {
    _themeMode = code;
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(themeKey, code);
    notifyListeners();
  }

  static void changeCity(String city) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(cityKey, city);
  }

  static Future<void> getPreviousSettings() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(themeKey)) {
      _themeMode = prefs.getInt(themeKey)!;
    } else {
      _themeMode = Themes.darkModeCode;
    }
    if (prefs.containsKey(cityKey)) {
      city = prefs.getString(cityKey)!;
    } else {
      city = "paris";
    }
    if (prefs.containsKey(unitKey)) {
      _unit = TemperatureUnit.values[prefs.getInt(unitKey)!];
    } else {
      _unit = TemperatureUnit.celsius;
    }
  }
}
