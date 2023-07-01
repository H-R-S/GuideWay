import 'package:cloud_firestore/cloud_firestore.dart';
import '../country/country_model.dart';

class RulesModel {
  final num? id;
  final String? title;
  final String? rules;
  final CountryModel? country;

  RulesModel({this.id, this.title, this.rules, this.country});

  factory RulesModel.fromSnapshot(DocumentSnapshot snap) {
    var data = snap.data() as Map<String, dynamic>;

    return RulesModel(
        id: data["id"],
        title: data["title"],
        rules: data["rules"],
        country: data["country"]);
  }

  static RulesModel fromJson(Map<String, dynamic> json) => RulesModel(
      id: json['id'],
      title: json['title'],
      rules: json['rules'],
      country: json["country"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "title": title, "rules": rules, "country": country};
}
