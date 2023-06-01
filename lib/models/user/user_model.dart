import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? uid;
  final num? countryId;
  final String? username;
  final String? fullName;
  final String? email;
  final String? dob;

  UserModel(
      {this.uid,
      this.countryId,
      this.username,
      this.fullName,
      this.email,
      this.dob});

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    var data = snap.data() as Map<String, dynamic>;

    return UserModel(
        uid: data["uid"],
        countryId: data["countryId"],
        username: data["username"],
        email: data["email"],
        fullName: data["fullName"],
        dob: data["dob"]);
  }

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
      uid: json['uid'],
      countryId: json['countryId'],
      username: json['username'],
      email: json["email"],
      fullName: json["fullName"],
      dob: json["dob"]);

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "countryId": countryId,
        "username": username,
        "fullName": fullName,
        "email": email,
        "dob": dob
      };
}
