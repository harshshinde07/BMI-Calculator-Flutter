import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class IconContent extends StatelessWidget {
  // const IconContent({
  //   Key key,
  // }) : super(key: key);
  final String label;
  final IconData icon;

  IconContent({@required this.label, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: iconSize,
        ),
        SizedBox(
          height: iconTextSpacing,
        ),
        Text(
          label,
          style: textLabelStyle,
        )
      ],
    );
  }
}
