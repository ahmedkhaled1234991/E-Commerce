class SocialContactsModel{

  int id;
  String value;

  SocialContactsModel({
    required this.id,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'value': this.value,
    };
  }

  factory SocialContactsModel.fromMap(Map<String, dynamic> map) {
    return SocialContactsModel(
      id: map['id'] as int,
      value: map['value'] as String,
    );
  }
}