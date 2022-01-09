class GetCategoriesModel{

  int id;
  String name;
  String image;

  GetCategoriesModel({
    required this.id,
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'image': this.image,
    };
  }

  factory GetCategoriesModel.fromMap(Map<String, dynamic> map) {
    return GetCategoriesModel(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }
}