import 'package:bmi_calculator/bmi_calculate_brain.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/database/database.dart';
import 'package:bmi_calculator/models/record.dart';
import 'package:bmi_calculator/screens/history_page.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'results_page.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int heightValue = 180;
  int weightValue = 60;
  int ageValue = 20;

  DatabaseProvider provider = new DatabaseProvider();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height -
        56 - // app bar height
        70 - // bottom button height
        72; // card margins
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        actions: [
          IconButton(
            icon: Icon(Icons.view_list),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return HistoryPage();
              }));
            },
          ),
        ],
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
                      height: screenHeight / 3,
                      colour: selectedGender == Gender.male
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: IconContent(
                        label: 'MALE',
                        icon: FontAwesomeIcons.mars,
                        iconColor: selectedGender == Gender.male
                            ? Colors.white
                            : Color(0xFF8D8E98),
                      ),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      height: screenHeight / 3,
                      colour: selectedGender == Gender.female
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: IconContent(
                        label: 'FEMALE',
                        icon: FontAwesomeIcons.venus,
                        iconColor: selectedGender == Gender.female
                            ? Colors.white
                            : Color(0xFF8D8E98),
                      ),
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
                height: screenHeight / 3,
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
                      height: screenHeight / 3,
                      colour: activeCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('WEIGHT', style: textLabelStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(weightValue.toString(),
                                  style: kNumberTextStyle),
                              Text(
                                'kg',
                                style: textLabelStyle,
                              ),
                            ],
                          ),
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
                      height: screenHeight / 3,
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
              onTap: () async {
                BMIBrain calc =
                    BMIBrain(height: heightValue, weight: weightValue);

                DateTime now = DateTime.now();
                DateFormat dateFormat = DateFormat("dd-MM-yyyy hh:mm a");
                String timestamp = dateFormat.format(now);
                final bmi = calc.calculateBMI();
                final result = calc.getResult();
                Record record = new Record(
                    date: timestamp,
                    bmi: double.parse(bmi),
                    gender: selectedGender == Gender.male ? 'male' : 'female',
                    type: result,
                    height: heightValue,
                    weight: weightValue,
                    age: ageValue
                );
                await provider.insertRecord(record);

                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return ResultsPage(
                    bmiResult: bmi,
                    resultText: result,
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
