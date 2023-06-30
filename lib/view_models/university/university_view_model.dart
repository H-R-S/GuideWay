import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guide_way/view/widgets/snack_bar/my_snack_bar.dart';
import '../../models/university/university_model.dart';

class UniversityViewModel with ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  addUniversity(BuildContext context, UniversityModel university) async {
    setLoading(true);
    await FirebaseFirestore.instance
        .collection("universities")
        .doc()
        .set(university.toJson())
        .then((value) {
      MySnackBar(context, "University Added");
      setLoading(false);
    });
  }

  Stream<List<UniversityModel>> getUniversities() {
    final universitiesCollection =
        FirebaseFirestore.instance.collection("universities");

    return universitiesCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs
            .map((data) => UniversityModel.fromSnapshot(data))
            .toList());
  }
}
