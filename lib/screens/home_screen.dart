import 'package:app10/provider/settings.dart';
import 'settings_screen.dart';
import '../widgets/weather_widget.dart';
import 'package:intl/intl.dart';
import '../network/network.dart';
import '../model/open_weather.dart';
import 'package:flutter/material.dart';

enum OptionsMenu { changeCity, settings }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = "/home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<OpenWeather> weatherObject;

  @override
  void initState() {
    super.initState();

    weatherObject = Network().getOpenWeather(SettingsManager.city!);
  }

  _onOptionMenuItemSelected(OptionsMenu item) {
    switch (item) {
      case OptionsMenu.changeCity:
        _showCityChangeDialog();
        break;
      case OptionsMenu.settings:
        Navigator.of(context).pushNamed(SettingsScreen.routeName);
        break;
    }
  }

  void _showCityChangeDialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          ThemeData appTheme = Theme.of(context);
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('Change City',
                style: TextStyle(color: Colors.black)),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                style: TextButton.styleFrom(
                    primary: appTheme.hintColor,
                    elevation: 1.5,
                    backgroundColor: Colors.blue),
                onPressed: () {
                  setState(() {
                    weatherObject =
                        Network().getOpenWeather(SettingsManager.city!);
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
            content: TextField(
              autofocus: true,
              onChanged: (text) {
                SettingsManager.city = text;
              },
              decoration: const InputDecoration(
                hintText: 'Type Your City Name',
                hintStyle: TextStyle(color: Colors.black),
              ),
              style: const TextStyle(color: Colors.black),
              cursorColor: Colors.black,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);
    return Scaffold(
      backgroundColor: appTheme.primaryColor,
      appBar: AppBar(
        backgroundColor: appTheme.primaryColor,
        elevation: 0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              DateFormat('EEEE, d MMMM yyyy').format(DateTime.now()),
              style: TextStyle(
                color: appTheme.hintColor.withAlpha(90),
                fontSize: 14,
              ),
            )
          ],
        ),
        actions: <Widget>[
          PopupMenuButton<OptionsMenu>(
              child: Icon(
                Icons.more_vert,
                color: appTheme.hintColor,
              ),
              onSelected: _onOptionMenuItemSelected,
              itemBuilder: (context) => <PopupMenuEntry<OptionsMenu>>[
                    const PopupMenuItem<OptionsMenu>(
                      value: OptionsMenu.changeCity,
                      child: Text("Change City"),
                    ),
                    const PopupMenuItem<OptionsMenu>(
                      value: OptionsMenu.settings,
                      child: Text("Settings"),
                    ),
                  ])
        ],
      ),
      body: ListView(
        children: [
          FutureBuilder<OpenWeather>(
              future: weatherObject,
              builder:
                  (BuildContext context, AsyncSnapshot<OpenWeather> snapshot) {
                if (snapshot.hasData) {
                  return Column(children: [
                    WeatherWidget(weather: snapshot.data as OpenWeather)
                  ]);
                } else {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height - 200,
                    child: Center(
                        child: CircularProgressIndicator(
                      color: appTheme.hintColor,
                    )),
                  );
                }
              })
        ],
      ),
    );
  }
}
