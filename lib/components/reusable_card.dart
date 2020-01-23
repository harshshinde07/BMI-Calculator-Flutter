import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class ReusableCard extends StatelessWidget {
  // const ReusableCard({Key key}) : super(key: key);
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  ReusableCard({@required this.colour, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(cardMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cardRadius),
          color: colour,
        ),
      ),
    );
  }
}
