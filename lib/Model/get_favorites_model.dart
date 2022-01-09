class GetFavoritesModel{

  int id;
  int price;
  String name;
  String image;

  GetFavoritesModel({
    required this.id,
    required this.price,
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'price': this.price,
      'name': this.name,
      'image': this.image,
    };
  }

  factory GetFavoritesModel.fromMap(Map<String, dynamic> map) {
    return GetFavoritesModel(
      id: map['id'] as int,
      price: map['price'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }
}