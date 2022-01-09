
class GetOrdersModel{

  int id;
  num total;
  String date;
  String status;

  GetOrdersModel({
    required this.id,
    required this.total,
    required this.date,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'total': this.total,
      'date': this.date,
      'status': this.status,
    };
  }

  factory GetOrdersModel.fromMap(Map<String, dynamic> map) {
    return GetOrdersModel(
      id: map['id'] as int,
      total: map['total'] as num,
      date: map['date'] as String,
      status: map['status'] as String,
    );
  }
}