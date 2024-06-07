import 'package:uuid/uuid.dart';

class Module {
  final String id;
  String name;
  int coefficient;
  int credit;
  bool hasTP;
  bool hasTD;
  double tdGrade = 0;
  double tpGrade = 0;
  double examGrade = 0;
  double finalGrade = 0;

  Module({
    required this.name,
    required this.coefficient,
    required this.hasTP,
    required this.hasTD,
    this.credit = 0,
  }) : id = const Uuid().v4();

  void update({
    required String name,
    required int coefficient,
    required int credit,
    required bool hasTP,
    required bool hasTD,
  }) {
    this.name = name;
    this.coefficient = coefficient;
    this.credit = credit;
    this.hasTP = hasTP;
    this.hasTD = hasTD;
  }

  void updateGrades({
    required double tdGrade,
    required double tpGrade,
    required double examGrade,
    required double examWeight,
  }) {
    this.tdGrade = tdGrade;
    this.tpGrade = tpGrade;
    this.examGrade = examGrade;
    if (hasTD && hasTP) {
      finalGrade =
          ((tdGrade + tpGrade) / 2) * (1 - examWeight) + examWeight * examGrade;
    } else if (hasTD) {
      finalGrade = (1 - examWeight) * tdGrade + examWeight * examGrade;
    } else if (hasTP) {
      finalGrade = (1 - examWeight) * tpGrade + examWeight * examGrade;
    } else {
      finalGrade = examGrade;
    }
  }

  Module.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        coefficient = json['coefficient'],
        credit = json['credit'],
        hasTP = json['hasTP'],
        hasTD = json['hasTD'],
        tdGrade = json['tdGrade']?.toDouble() ?? 0.0,
        tpGrade = json['tpGrade']?.toDouble() ?? 0.0,
        examGrade = json['examGrade']?.toDouble() ?? 0.0,
        finalGrade = json['finalGrade']?.toDouble() ?? 0.0;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'coefficient': coefficient,
        'credit': credit,
        'hasTP': hasTP,
        'hasTD': hasTD,
        'tdGrade': tdGrade,
        'tpGrade': tpGrade,
        'examGrade': examGrade,
        'finalGrade': finalGrade,
      };

  @override
  String toString() {
    return '\n Module{id: $id, name: $name, coefficient: $coefficient, hasTP: $hasTP, hasTD: $hasTD, tdGrade: $tdGrade, tpGrade: $tpGrade, examGrade: $examGrade, finalGrade: $finalGrade}';
  }
}
