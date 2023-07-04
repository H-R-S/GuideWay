import 'package:cloud_firestore/cloud_firestore.dart';

class RuleModel {
  final num? id;
  final String? title;
  final String? description;
  final String? rules;
  final dynamic country;

  RuleModel({this.id, this.title, this.description, this.rules, this.country});

  factory RuleModel.fromSnapshot(DocumentSnapshot snap) {
    var data = snap.data() as Map<String, dynamic>;

    return RuleModel(
        id: data["id"],
        title: data["title"],
        description: data["description"],
        rules: data["rules"],
        country: data["country"]);
  }

  static RuleModel fromJson(Map<String, dynamic> json) => RuleModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      rules: json['rules'],
      country: json["country"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "rules": rules,
        "country": country!.toJson()
      };
}
