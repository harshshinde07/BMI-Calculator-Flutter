import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  // const ReusableCard({Key key}) : super(key: key);
  final Color colour;
  final Widget cardChild;
  final Function onPress;
  final double height;

  ReusableCard(
      {@required this.colour, this.cardChild, this.onPress, this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: height,
        child: cardChild,
        margin: EdgeInsets.fromLTRB(cardMargin, 12, cardMargin, 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cardRadius),
          color: colour,
        ),
      ),
    );
  }
}
