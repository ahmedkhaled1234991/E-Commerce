import 'package:ecommerce_app_project/Model/products_order_model.dart';

class OrderDetailsModel {

  int id;
  int cost;
  int discount;
  num vat;
  num total;
  String payment_method;
  String date;

  OrderDetailsModel({
    required this.id,
    required this.cost,
    required this.discount,
    required this.vat,
    required this.total,
    required this.payment_method,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'cost': this.cost,
      'discount': this.discount,
      'vat': this.vat,
      'total': this.total,
      'payment_method': this.payment_method,
      'date': this.date,
    };
  }

  factory OrderDetailsModel.fromMap(Map<String, dynamic> map) {
    return OrderDetailsModel(
      id: map['id'] as int,
      cost: map['cost'] as int,
      discount: map['discount'] as int,
      vat: map['vat'] as num,
      total: map['total'] as num,
      payment_method: map['payment_method'] as String,
      date: map['date'] as String,
    );
  }
}