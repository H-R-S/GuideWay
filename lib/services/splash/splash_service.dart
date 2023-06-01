import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guide_way/models/user/user_model.dart';
import '../../routes/routes_name.dart';
import '../../view_models/user/user_view_model.dart';

class SplashService {
  Future<UserModel?> getCountryId() => UserViewModel().getUser();

  void checkCountryId(BuildContext context) async {
    getCountryId().then((value) {
      debugPrint(value!.countryId.toString());
      if (value.countryId == null) {
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
