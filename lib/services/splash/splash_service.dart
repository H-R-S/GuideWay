import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../routes/routes_name.dart';
import '../../view_models/user/user_view_model.dart';

class SplashService {
  Future<int?> getCountryId() => UserViewModel().getUserCountryId();

  void checkCountryId(BuildContext context) async {
    getCountryId().then((value) {
      if (value == null) {
        return Navigator.of(context, rootNavigator: true)
            .pushReplacementNamed(RoutesName.country);
      } else {
        return Navigator.of(context, rootNavigator: true)
            .pushReplacementNamed(RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
      return null;
    });
  }
}
