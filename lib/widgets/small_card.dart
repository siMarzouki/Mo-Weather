import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData? iconData;
  final Color? color;

  const SmallCard(
      {Key? key,
      required this.label,
      required this.value,
      this.iconData,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(color: color ?? appTheme.hintColor.withAlpha(80)),
        ),
        const SizedBox(
          height: 5,
        ),
        iconData != null
            ? Icon(
                iconData,
                color: appTheme.hintColor,
                size: 20,
              )
            : Container(),
        const SizedBox(
          height: 10,
        ),
        Text(
          value,
          style: TextStyle(color: appTheme.hintColor),
        ),
      ],
    );
  }
}
