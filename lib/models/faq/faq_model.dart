import 'package:cloud_firestore/cloud_firestore.dart';

class FAQModel {
  final num? id;
  final String? question;
  final String? answer;

  FAQModel(
      {this.id,
      this.question,
      this.answer,});

  factory FAQModel.fromSnapshot(DocumentSnapshot snap) {
    var data = snap.data() as Map<String, dynamic>;

    return FAQModel(
        id: data["id"],
        question: data["question"],
        answer: data["answer"]);
  }

  static FAQModel fromJson(Map<String, dynamic> json) => FAQModel(
      id: json['id'],
      question: json['question'],
      answer: json["answer"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answer": answer
      };
}
