import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HistoryCard extends StatelessWidget {
  HistoryCard(
      {this.time, this.gender, this.bmi, this.type, this.height, this.weight, this.age, this.onPressDelete});

  final String gender, type;
  final time;
  final double bmi;
  final Function onPressDelete;
  final int height, weight, age;

  @override
  Widget build(BuildContext context) {
    var kStyle;

    switch (type) {
      case 'Obese Class III':
        {
          kStyle =
              kTypeTextStyle.copyWith(color: level5Color);
          break;
        }
      case 'Obese Class II':
        {
          kStyle =
              kTypeTextStyle.copyWith(color: level4Color);
          break;
        }
      case 'Obese Class I':
        {
          kStyle =
              kTypeTextStyle.copyWith(color: level3Color);
          break;
        }
      case 'Overweight':
        {
          kStyle =
              kTypeTextStyle.copyWith(color: level2Color);
          break;
        }
      case 'Underweight':
        {
          kStyle =
              kTypeTextStyle.copyWith(color: level3Color);
          break;
        }
      case 'Severely Underweight':
        {
          kStyle =
              kTypeTextStyle.copyWith(color: level4Color);
          break;
        }
      case 'Very Severely Underweight':
        {
          kStyle =
              kTypeTextStyle.copyWith(color: level5Color);
          break;
        }
      default:
        kStyle = kTypeTextStyle;
    }

    return ReusableCard(
      colour: activeCardColor,
      cardChild: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      gender == 'male'
                          ? Icon(
                        FontAwesomeIcons.mars,
                        size: 32.0,
                      )
                          : Icon(
                        FontAwesomeIcons.venus,
                        size: 32.0,
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      gender == 'male'
                          ? Text('Male',
                          style: kBodyTextStyle.copyWith(fontSize: 18.0))
                          : Text('Female',
                          style: kBodyTextStyle.copyWith(fontSize: 18.0)),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      time,
                      style: textLabelStyle.copyWith(
                          fontSize: 13.0, color: Colors.white),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text('BMI: $bmi',
                        style: kBodyTextStyle.copyWith(color: Colors.white)),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(type, style: kStyle),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete_forever,
                    color: Colors.white,
                  ),
                  onPressed: onPressDelete,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Height: $height', style: kDetailsTextStyle,),
                  Text('Weight: $weight', style: kDetailsTextStyle),
                  Text('Age: $age', style: kDetailsTextStyle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
