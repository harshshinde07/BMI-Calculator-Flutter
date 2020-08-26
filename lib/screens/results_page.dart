import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultsPage(
      {@required this.interpretation,
      @required this.bmiResult,
      @required this.resultText});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height -
        56 - // app bar height
        70 - // bottom button height
        54; // all margins

    var style;

    switch (resultText) {
      case 'Obese Class III':
        {
          style = kResultTextStyle.copyWith(color: level5Color);

          break;
        }
      case 'Obese Class II':
        {
          style = kResultTextStyle.copyWith(color: level4Color);

          break;
        }
      case 'Obese Class I':
        {
          style = kResultTextStyle.copyWith(color: level3Color);

          break;
        }
      case 'Overweight':
        {
          style = kResultTextStyle.copyWith(color: level2Color);

          break;
        }
      case 'Underweight':
        {
          style = kResultTextStyle.copyWith(color: level3Color);

          break;
        }
      case 'Severely Underweight':
        {
          style = kResultTextStyle.copyWith(color: level4Color);

          break;
        }
      case 'Very Severely Underweight':
        {
          style = kResultTextStyle.copyWith(color: level5Color);

          break;
        }
      default:
        style = kResultTextStyle;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.center,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              height: screenHeight * (4 / 5),
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: style,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
