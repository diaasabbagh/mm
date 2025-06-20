class YearModel {
  final int id;
  final String value;

  YearModel({required this.id, required this.value});

  factory YearModel.fromJson(Map<String, dynamic> json) {
    return YearModel(
      id: json['id'],
      value: json['value'],
    );
  }
}



