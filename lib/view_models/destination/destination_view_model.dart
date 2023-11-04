import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guide_way/models/destination/destination.dart';
import 'package:guide_way/view/widgets/snack_bar/my_snack_bar.dart';

class DestinationViewModel with ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  addDestination(BuildContext context, DestinationModel destination) async {
    setLoading(true);
    await FirebaseFirestore.instance
        .collection("destinations")
        .doc()
        .set(destination.toJson())
        .then((value) {
      MySnackBar(context, "Destination Added");
      setLoading(false);
    });
  }

  Stream<List<DestinationModel>> getDestinations(num countryId) {
    final destinationsCollection = FirebaseFirestore.instance
        .collection("destinations")
        .where("countryId", isEqualTo: countryId);

    return destinationsCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs
            .map((data) => DestinationModel.fromSnapshot(data))
            .toList());
  }
}
