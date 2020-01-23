import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'results_page.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/bmi_calculate_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;

  Gender selectedGender;
  int heightValue = 180;
  int weightValue = 60;
  int ageValue = 20;

  // void updateColor(Gender selectedGender) {
  //   if (selectedGender == Gender.male) {
  //     if (maleCardColor == inactiveCardColor) {
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inactiveCardColor;
  //     } else
  //       maleCardColor = inactiveCardColor;
  //   }
  //   if (selectedGender == Gender.female) {
  //     if (femaleCardColor == inactiveCardColor) {
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inactiveCardColor;
  //     } else
  //       femaleCardColor = inactiveCardColor;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: selectedGender == Gender.male
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: IconContent(
                          label: 'MALE', icon: FontAwesomeIcons.mars),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: selectedGender == Gender.female
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: IconContent(
                          label: 'FEMALE', icon: FontAwesomeIcons.venus),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('HEIGHT', style: textLabelStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(heightValue.toString(), style: kNumberTextStyle),
                        Text(
                          'cm',
                          style: textLabelStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 25.0),
                      ),
                      child: Slider(
                        value: heightValue.toDouble(),
                        min: 100.0,
                        max: 250.0,
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          setState(() {
                            heightValue = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('WEIGHT', style: textLabelStyle),
                          Text(weightValue.toString(), style: kNumberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                onPress: () {
                                  setState(() {
                                    weightValue--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              RoundIconButton(
                                onPress: () {
                                  setState(() {
                                    weightValue++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('AGE', style: textLabelStyle),
                          Text(ageValue.toString(), style: kNumberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                onPress: () {
                                  setState(() {
                                    ageValue--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              RoundIconButton(
                                onPress: () {
                                  setState(() {
                                    ageValue++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                BMIBrain calc =
                    BMIBrain(height: heightValue, weight: weightValue);

                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  );
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
