import '../model/open_weather.dart';
import 'current_weather.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'small_card.dart';
import 'five_days_weather.dart';

class WeatherWidget extends StatelessWidget {
  final OpenWeather weather;

  const WeatherWidget({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);
    final cityName = weather.city!.name!.toUpperCase();
    final currentWeather = weather.list![0].weather![0];
    final weatherDescription = currentWeather.description!.toUpperCase();
    final windSpeed = weather.list![0].wind!.speed;
    final sunrise = DateFormat('hh:mm a').format(
        DateTime.fromMillisecondsSinceEpoch(weather.city!.sunrise! * 1000));
    final sunset = DateFormat('hh:mm a').format(
        DateTime.fromMillisecondsSinceEpoch(weather.city!.sunset! * 1000));
    final humidity = weather.list![0].main!.humidity;

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //City Name
            Text(
              cityName,
              style: TextStyle(
                fontSize: 25,
                letterSpacing: 5,
                color: appTheme.hintColor,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 20),
            //weather description
            Text(
              weatherDescription,
              style: TextStyle(
                fontSize: 15,
                letterSpacing: 5,
                fontWeight: FontWeight.w100,
                color: appTheme.hintColor,
              ),
            ),
            CurrentWeather(weather: weather),
            Padding(
              child: Divider(
                color: appTheme.hintColor.withAlpha(50),
              ),
              padding: const EdgeInsets.all(10),
            ),
            FiveDaysWeather(weathers: weather.list!),
            Padding(
              child: Divider(
                color: appTheme.hintColor.withAlpha(50),
              ),
              padding: const EdgeInsets.all(10),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              SmallCard(label: "wind speed", value: '$windSpeed m/s'),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Center(
                    child: Container(
                  width: 1,
                  height: 30,
                  color: appTheme.hintColor.withAlpha(50),
                )),
              ),
              SmallCard(label: "sunrise", value: sunrise),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Center(
                    child: Container(
                  width: 1,
                  height: 30,
                  color: appTheme.hintColor.withAlpha(50),
                )),
              ),
              SmallCard(label: "sunset", value: sunset),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Center(
                    child: Container(
                  width: 1,
                  height: 30,
                  color: appTheme.hintColor.withAlpha(50),
                )),
              ),
              SmallCard(label: "humidity", value: '$humidity%'),
            ]),
          ],
        ),
      ),
    );
  }
}
