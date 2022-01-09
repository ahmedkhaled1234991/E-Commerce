class ProductsModel{

  int id;
  String name;
  int price;
  String image;

  ProductsModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'price': this.price,
      'image': this.image,
    };
  }

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      id: map['id'] as int,
      name: map['name'] as String,
      price: map['price'] as int,
      image: map['image'] as String,
    );
  }
}