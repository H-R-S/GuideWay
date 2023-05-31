import 'package:cloud_firestore/cloud_firestore.dart';

class CountryModel {
  final num? id;
  final String? name;
  final String? flag;
  final String? dialingCode;
  final num? latitude;
  final num? longitude;

  CountryModel(
      {this.id,
      this.name,
      this.flag,
      this.dialingCode,
      this.latitude,
      this.longitude});

  factory CountryModel.fromSnapshot(DocumentSnapshot snap) {
    var data = snap.data() as Map<String, dynamic>;

    return CountryModel(
        id: data["id"],
        name: data["name"],
        flag: data["flag"],
        latitude: data["latitude"],
        dialingCode: data["dialingCode"],
        longitude: data["longitude"]);
  }

  static CountryModel fromJson(Map<String, dynamic> json) => CountryModel(
      id: json['id'],
      name: json['name'],
      flag: json['flag'],
      latitude: json["latitude"],
      dialingCode: json["dialingCode"],
      longitude: json["longitude"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "flag": flag,
        "dialingCode": dialingCode,
        "latitude": latitude,
        "longitude": longitude
      };
}
