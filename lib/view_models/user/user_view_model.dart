import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/user/user_model.dart';
import '../../routes/routes_name.dart';
import '../../view/widgets/snack_bar/my_snack_bar.dart';

class UserViewModel with ChangeNotifier {
  User? get user => FirebaseAuth.instance.currentUser;

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  num _countryId = 0;

  num get countryId => _countryId;

  setCountryId(num value) {
    _countryId = value;
    notifyListeners();
  }

  updateUserCountry(BuildContext context, int countryId) async {
    setLoading(true);
    final userCollection =
        FirebaseFirestore.instance.collection("users").doc(user!.uid);
    saveCountryId(countryId);
    setCountryId(countryId);
    await userCollection.update({"countryId": countryId}).then((value) {
      setLoading(false);
      MySnackBar(context, "Country updated");
      Navigator.pushReplacementNamed(context, RoutesName.home);
    });
  }

  updateUserInfo(BuildContext context, UserModel userModel) async {
    setLoading(true);

    final userCollection =
        FirebaseFirestore.instance.collection("users").doc(user!.uid);

    await userCollection.update({
      "fullName": userModel.fullName,
      "username": userModel.username,
      "dob": userModel.dob
    }).then((value) {
      setLoading(false);
      MySnackBar(context, "Info Updated!");
    }).onError((error, stackTrace) {
      setLoading(false);
      MySnackBar(context, error.toString());
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

  Future<int> getCountryId() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final int? countryId = sp.getInt('countryId');
    return countryId ?? 0;
  }

  Future<UserModel?> getUser() async {
    final docUser =
        FirebaseFirestore.instance.collection("users").doc(user!.uid);

    final userSnapshot = await docUser.get();

    if (userSnapshot.exists) {
      setCountryId(userSnapshot.get("countryId"));
      return UserModel.fromJson(userSnapshot.data()!);
    }
    return UserModel();
  }
}
