import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../models/rule/rule_model.dart';
import '../../view/widgets/snack_bar/my_snack_bar.dart';

class RuleViewModel with ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  addRules(BuildContext context, RuleModel rules) async {
    setLoading(true);
    await FirebaseFirestore.instance
        .collection("rules")
        .doc()
        .set(rules.toJson())
        .then((value) {
      MySnackBar(context, "Rules Added");
      setLoading(false);
    });
  }

  Stream<List<RuleModel>> getRules(
      BuildContext context, String title, num countryId) {
    final rulesCollection = FirebaseFirestore.instance
        .collection("rules")
        .where("countryId", isEqualTo: countryId)
        .where("title", isEqualTo: title);

    return rulesCollection.snapshots().map((querySnapshot) => querySnapshot.docs
        .map((data) => RuleModel.fromSnapshot(data))
        .toList());
  }
}
