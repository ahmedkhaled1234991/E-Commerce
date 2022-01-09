class AddressModel{

  int id;
  String name;
  String city;
  String region;
  String details;
  double latitude;
  double longitude;
  String notes;

  AddressModel({
    required this.id,
    required this.name,
    required this.city,
    required this.region,
    required this.details,
    required this.latitude,
    required this.longitude,
    required this.notes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'city': this.city,
      'region': this.region,
      'details': this.details,
      'latitude': this.latitude,
      'longitude': this.longitude,
      'notes': this.notes,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'] as int,
      name: map['name'] as String,
      city: map['city'] as String,
      region: map['region'] as String,
      details: map['details'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      notes: map['notes'] as String,
    );
  }
}