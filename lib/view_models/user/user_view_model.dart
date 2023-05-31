import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  User? get currentUser => FirebaseAuth.instance.currentUser;

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  updateUserCountry(int countryId) async {
    setLoading(true);
    final userCollection =
        FirebaseFirestore.instance.collection("users").doc(currentUser!.uid);
    saveCountryId(countryId);
    await userCollection.update({"countryId": countryId}).then((value) {
      setLoading(false);
    });
  }

  Future<bool> saveCountryId(int? countryId) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt('countryId', countryId!);
    notifyListeners();
    return true;
  }

  Future<bool> clearCountryId() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('countryId');
    notifyListeners();
    return true;
  }

  Future<int?> getCountryId() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final int? countryId = sp.getInt('countryId');
    return countryId;
  }

  Future<int?> getUserCountryId() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser!.uid)
        .get()
        .then((value) {
      return value["countryId"];
    });
    return null;
  }
}
