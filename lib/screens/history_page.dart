import 'package:bmi_calculator/components/history_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/database/database.dart';
import 'package:bmi_calculator/models/record.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  DatabaseProvider provider = new DatabaseProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI REPORTS'),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: Text(
              'Please wait...',
              style: kBodyTextStyle,
            ));
          }
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data.length == 0) {
              return Center(
                  child: Text(
                'No records found.',
                style: kBodyTextStyle,
              ));
            }
            return ListView.builder(
              reverse: true,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                Record record = snapshot.data[index];
                return HistoryCard(
                  type: record.type,
                  gender: record.gender,
                  bmi: record.bmi,
                  time: record.date,
                );
              },
            );
          }
          return Center(
              child: Text(
            'Something went wrong.',
            style: kBodyTextStyle,
          ));
        },
        future: provider.getAllRecords(),
      ),
    );
  }
}
