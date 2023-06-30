import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guide_way/view/widgets/snack_bar/my_snack_bar.dart';
import 'package:provider/provider.dart';
import '../../models/feedback/feedback_model.dart';
import '../user/user_view_model.dart';

class FeedBackViewModel with ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  addFeedBack(BuildContext context, String reason, feedBack) async {
    setLoading(true);

    final userViewModel = Provider.of<UserViewModel>(context, listen: false);

    userViewModel.getUser().then((user) async {
      setLoading(true);
      await FirebaseFirestore.instance.collection("feedBacks").doc().set({
        "id": Timestamp.now().microsecondsSinceEpoch,
        "timestamp": Timestamp.now(),
        "reason": reason,
        "feedback": feedBack,
        "user": user!.toJson()
      }).then((value) {
        setLoading(false);
        Navigator.pop(context);
        MySnackBar(context, "FeedBack added");
      }).onError((error, stackTrace) {
        setLoading(false);
        Navigator.pop(context);
        MySnackBar(context, error.toString());
      });
    });
  }

  Stream<List<FeedBackModel>> getFeedBacks() {
    final faqCollection = FirebaseFirestore.instance.collection("feedBacks");

    return faqCollection.snapshots().map((querySnapshot) => querySnapshot.docs
        .map((data) => FeedBackModel.fromSnapshot(data))
        .toList());
  }
}
