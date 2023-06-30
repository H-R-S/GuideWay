import 'package:cloud_firestore/cloud_firestore.dart';

class FeedBackModel {
  final num? id;
  final Timestamp? timestamp;
  final String? reason;
  final String? feedback;
  final dynamic user;

  FeedBackModel(
      {this.id, this.timestamp, this.reason, this.feedback, this.user});

  factory FeedBackModel.fromSnapshot(DocumentSnapshot snap) {
    var data = snap.data() as Map<String, dynamic>;

    return FeedBackModel(
        id: data["id"],
        timestamp: data["timestamp"],
        reason: data["reason"],
        feedback: data["feedback"],
        user: data["user"]);
  }

  static FeedBackModel fromJson(Map<String, dynamic> json) => FeedBackModel(
      id: json['id'],
      timestamp: json['timestamp'],
      reason: json['reason'],
      feedback: json['feedback'],
      user: json['user']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "timestamp": timestamp,
        "reason": reason,
        "feedback": feedback,
        "user": user
      };
}
