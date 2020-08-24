import 'package:bmi_calculator/database/database.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseProvider provider = new DatabaseProvider();
  await provider.createDatabase();
  provider.open();
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: kColorPrimary,
          scaffoldBackgroundColor: kScaffoldBackgroundColor),
      home: InputPage(),
    );
  }
}
