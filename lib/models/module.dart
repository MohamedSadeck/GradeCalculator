class Module {
  static int lastId = 0;
  final int id;
  String name;
  int coefficient;
  int credit;
  bool hasTP;
  bool hasTD;
  double? tdGrade;
  double? tpGrade;
  double? examGrade;
  double? finalGrade;

  Module({
    required this.name,
    required this.coefficient,
    required this.hasTP,
    required this.hasTD,
    this.credit = 0,
  }) : id = lastId++;

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

  Module.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        coefficient = json['coefficient'],
        credit = json['credit'],
        hasTP = json['hasTP'],
        hasTD = json['hasTD'],
        tdGrade = json['tdGrade'],
        tpGrade = json['tpGrade'],
        examGrade = json['examGrade'],
        finalGrade = json['finalGrade'];

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
    return 'Module{id: $id, name: $name, coefficient: $coefficient, hasTP: $hasTP, hasTD: $hasTD, tdGrade: $tdGrade, tpGrade: $tpGrade, examGrade: $examGrade, finalGrade: $finalGrade}';
  }
}
