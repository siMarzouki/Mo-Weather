import '../model/open_weather.dart';
import '../provider/settings.dart';
import '../util/converters.dart';
import 'small_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../util/weather_icon.dart';

class FiveDaysWeather extends StatelessWidget {
  const FiveDaysWeather({
    Key? key,
    required this.weathers,
  }) : super(key: key);

  final List<Liste> weathers;

  @override
  Widget build(BuildContext context) {
    TemperatureUnit unit = Provider.of<SettingsManager>(context).unit;

    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: weathers.length,
        separatorBuilder: (context, index) => const Divider(
          height: 100,
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(left: 10, right: 10),
        itemBuilder: (context, index) {
          final item = weathers[index];
          return Card(
            elevation: 1,
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Center(
                child: SmallCard(
                  label: DateFormat('E, ha').format(
                      DateTime.fromMillisecondsSinceEpoch(item.dt! * 1000)),
                  value:
                      '${Temperature(item.main!.temp as double).as(unit).round()}°',
                  iconData: getIconData(item.weather![0].icon),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
