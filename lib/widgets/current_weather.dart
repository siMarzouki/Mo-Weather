import '../provider/settings.dart';
import 'package:provider/provider.dart';
import '../model/open_weather.dart';
import 'small_card.dart';
import 'package:flutter/material.dart';
import '../util/converters.dart';
import '../util/weather_icon.dart';

class CurrentWeather extends StatelessWidget {
  final OpenWeather weather;
  const CurrentWeather({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);
    TemperatureUnit unit = Provider.of<SettingsManager>(context).unit;

    int currentTemp =
        Temperature(weather.list![0].main!.temp as double).as(unit).round();
    int maxTemp =
        Temperature(weather.list![0].main!.tempMax as double).as(unit).round();
    int minTemp =
        Temperature(weather.list![0].main!.tempMin as double).as(unit).round();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //current weather icon
        Container(
          child: Icon(
            getIconData(weather.list![0].weather![0].icon),
            size: 70,
            color: appTheme.hintColor,
          ),
          margin: const EdgeInsets.all(20),
        ),
        const SizedBox(
          height: 20,
        ),
        //current weather temp
        Text(
          '$currentTemp°',
          style: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.w100,
              color: appTheme.hintColor),
        ),
        //max and min temp
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          SmallCard(label: "Max", value: '$maxTemp°', color: Colors.redAccent),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Center(
                child: Container(
              width: 1,
              height: 30,
              color: appTheme.hintColor.withAlpha(50),
            )),
          ),
          SmallCard(
            label: "Min",
            value: '$minTemp°',
            color: Colors.blueAccent,
          ),
        ]),
      ],
    );
  }
}
