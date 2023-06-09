import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../models/faq/faq_model.dart';

class FAQViewModel with ChangeNotifier {
  Stream<List<FAQModel>> getFAQs() {
    final faqCollection = FirebaseFirestore.instance.collection("faqs");

    return faqCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((data) => FAQModel.fromSnapshot(data)).toList());
  }

  // bool _loading = false;

  // bool get loading => _loading;

  // setLoading(bool value) {
  //   _loading = value;
  //   notifyListeners();
  // }

  // addFAQ(String question, answer) async {
  //   setLoading(true);
  //   await FirebaseFirestore.instance
  //       .collection("faqs")
  //       .doc()
  //       .set({
  //         "id": Timestamp.now().microsecondsSinceEpoch,
  //         "question": question,
  //         "answer": answer
  //       }).then((value) {
  //         setLoading(false);
  //       });
  // }
}
