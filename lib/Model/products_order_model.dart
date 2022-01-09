class ProductsOrderModel {

  int id;
  int quantity;
  int price;
  String name;
  String image;

  ProductsOrderModel({
    required this.id,
    required this.quantity,
    required this.price,
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'quantity': this.quantity,
      'price': this.price,
      'name': this.name,
      'image': this.image,
    };
  }

  factory ProductsOrderModel.fromMap(Map<String, dynamic> map) {
    return ProductsOrderModel(
      id: map['id'] as int,
      quantity: map['quantity'] as int,
      price: map['price'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }
}