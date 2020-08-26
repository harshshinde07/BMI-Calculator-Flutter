class Record {
  final String type, gender;
  final int id;
  final date;
  final double bmi;

  Record({this.id, this.bmi, this.date, this.gender, this.type});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'gender': gender,
      'bmi': bmi,
      'type': type,
    };
  }
}
