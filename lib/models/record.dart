class Record {
  final String type, gender;
  final int id, height, weight, age;
  final date;
  final double bmi;

  Record({this.id, this.bmi, this.date, this.gender, this.type, this.height, this.weight, this.age});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'gender': gender,
      'bmi': bmi,
      'type': type,
      'height': height,
      'weight': weight,
      'age': age
    };
  }
}
