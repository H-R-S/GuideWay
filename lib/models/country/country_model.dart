import 'package:cloud_firestore/cloud_firestore.dart';

class CountryModel {
  final num? id;
  final String? name;
  final String? flag;
  final String? dialingCode;
  final String? capital;
  final num? latitude;
  final num? longitude;
  final String? currency;
  final String? currencyCode;
  final String? domain;

  CountryModel(
      {this.id,
      this.name,
      this.flag,
      this.dialingCode,
      this.capital,
      this.latitude,
      this.longitude,
      this.currency,
      this.currencyCode,
      this.domain});

  factory CountryModel.fromSnapshot(DocumentSnapshot snap) {
    var data = snap.data() as Map<String, dynamic>;

    return CountryModel(
        id: data["id"],
        name: data["name"],
        flag: data["flag"],
        dialingCode: data["dialingCode"],
        capital: data["capital"],
        latitude: data["latitude"],
        longitude: data["longitude"],
        currency: data["currency"],
        currencyCode: data["currencyCode"],
        domain: data["domain"]);
  }

  static CountryModel fromJson(Map<String, dynamic> json) => CountryModel(
      id: json['id'],
      name: json['name'],
      flag: json['flag'],
      dialingCode: json["dialingCode"],
      capital: json["capital"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      currency: json["currency"],
      currencyCode: json["currencyCode"],
      domain: json["domain"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "flag": flag,
        "dialingCode": dialingCode,
        "capital": capital,
        "latitude": latitude,
        "longitude": longitude,
        "currency": currency,
        "currencyCode": currencyCode,
        "domain": domain
      };
}
