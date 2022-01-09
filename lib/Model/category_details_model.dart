class CategoryDetailsModel{

  int id;
  String name;
  int price;
  String image;

  CategoryDetailsModel({
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

  factory CategoryDetailsModel.fromMap(Map<String, dynamic> map) {
    return CategoryDetailsModel(
      id: map['id'] as int,
      name: map['name'] as String,
      price: map['price'] as int,
      image: map['image'] as String,
    );
  }
}