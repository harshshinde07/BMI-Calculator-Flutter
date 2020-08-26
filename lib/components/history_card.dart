import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HistoryCard extends StatelessWidget {
  HistoryCard(
      {this.time, this.gender, this.bmi, this.type, this.onPressDelete});

  final String gender, type;
  final time;
  final double bmi;
  final Function onPressDelete;
  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      colour: activeCardColor,
      cardChild: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          leading: Column(
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
                  ? Text('Male', style: kBodyTextStyle.copyWith(fontSize: 18.0))
                  : Text('Female',
                      style: kBodyTextStyle.copyWith(fontSize: 18.0)),
            ],
          ),
          title: Column(
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
              Text(type, style: kResultTextStyle.copyWith(fontSize: 20.0)),
            ],
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete_forever, color: Colors.white),
            onPressed: onPressDelete,
          ),
        ),
      ),
    );
  }
}
