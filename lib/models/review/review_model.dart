import 'package:cloud_firestore/cloud_firestore.dart';
import '../user/user_model.dart';

class ReviewModel {
  final num? id;
  final UserModel? user;
  final Timestamp? timestamp;
  final num? rating;

  ReviewModel({this.id, this.user, this.timestamp, this.rating});

  factory ReviewModel.fromSnapshot(DocumentSnapshot snap) {
    var data = snap.data() as Map<String, dynamic>;

    return ReviewModel(
        id: data["id"],
        user: data["user"],
        timestamp: data["timestamp"],
        rating: data["rating"]);
  }

  static ReviewModel fromJson(Map<String, dynamic> json) => ReviewModel(
      id: json['id'],
      user: json['user'],
      timestamp: json['timestamp'],
      rating: json["rating"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "user": user, "timestamp": timestamp, "rating": rating};
}
