import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  // const IconContent({
  //   Key key,
  // }) : super(key: key);
  final String label;
  final IconData icon;
  final Color iconColor;

  IconContent(
      {@required this.label, @required this.icon, @required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: iconSize,
          color: iconColor,
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
