import '../provider/settings.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../themes.dart';
import '../util/converters.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = "/settings";
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsManager>(context);
    ThemeData appTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: appTheme.primaryColor,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
        color: appTheme.primaryColor,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Theme",
                style: TextStyle(
                  color: appTheme.hintColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                color: appTheme.hintColor.withOpacity(0.1),
              ),
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Dark",
                    style: TextStyle(color: appTheme.hintColor),
                  ),
                  Radio(
                    value: Themes.darkModeCode,
                    groupValue: settings.themeMode,
                    onChanged: (value) {
                      setState(() {
                        settings.updateTheme(value as int);
                      });
                    },
                    activeColor: appTheme.hintColor,
                  )
                ],
              ),
            ),
            Divider(
              color: appTheme.primaryColor,
              height: 1,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
                color: appTheme.hintColor.withOpacity(0.1),
              ),
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Light",
                    style: TextStyle(color: appTheme.hintColor),
                  ),
                  Radio(
                    value: Themes.lighModeCode,
                    groupValue: settings.themeMode,
                    onChanged: (value) {
                      setState(() {
                        settings.updateTheme(value as int);
                      });
                    },
                    activeColor: appTheme.hintColor,
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 15, left: 8, right: 8, bottom: 8),
              child: Text(
                "Unit",
                style: TextStyle(
                  color: appTheme.hintColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                color: appTheme.hintColor.withOpacity(0.1),
              ),
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Celsius",
                    style: TextStyle(color: appTheme.hintColor),
                  ),
                  Radio(
                    value: TemperatureUnit.celsius,
                    groupValue: settings.unit,
                    onChanged: (value) {
                      settings.updateUnit(value as TemperatureUnit);
                    },
                    activeColor: appTheme.hintColor,
                  )
                ],
              ),
            ),
            Divider(
              color: appTheme.primaryColor,
              height: 1,
            ),
            Container(
              color: appTheme.hintColor.withOpacity(0.1),
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Fahrenheit",
                    style: TextStyle(color: appTheme.hintColor),
                  ),
                  Radio(
                    value: TemperatureUnit.fahrenheit,
                    groupValue: settings.unit,
                    onChanged: (value) {
                      settings.updateUnit(value as TemperatureUnit);
                    },
                    activeColor: appTheme.hintColor,
                  )
                ],
              ),
            ),
            Divider(
              color: appTheme.primaryColor,
              height: 1,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
                color: appTheme.hintColor.withOpacity(0.1),
              ),
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Kelvin",
                    style: TextStyle(color: appTheme.hintColor),
                  ),
                  Radio(
                    value: TemperatureUnit.kelvin,
                    groupValue: settings.unit,
                    onChanged: (value) {
                      settings.updateUnit(value as TemperatureUnit);
                    },
                    activeColor: appTheme.hintColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
