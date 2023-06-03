import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/responses/api_response.dart';
import '../../models/country/country_model.dart';
import '../../models/prayer/prayer_model.dart';
import '../../repository/prayer/prayer_repository.dart';
import '../../resources/data/countries.dart';
import '../user/user_view_model.dart';

class PrayerViewModel with ChangeNotifier {
  final _prayerRepo = PrayerRepository();

  ApiResponse<PrayerModel> prayerDetails = ApiResponse.loading();

  setPrayerDetails(ApiResponse<PrayerModel> response) {
    prayerDetails = response;
    notifyListeners();
  }

  Future<void> getPrayerDetails(BuildContext context) async {
    setPrayerDetails(ApiResponse.loading());

    final userViewModel = Provider.of<UserViewModel>(context, listen: false);

    userViewModel.getUser().then((user) {
      CountryModel? userCountry =
          countries.firstWhere((country) => country.id == user!.countryId);

      _prayerRepo
          .getPrayerTimingsApi(userCountry.latitude!, userCountry.longitude)
          .then((value) {
        setPrayerDetails(ApiResponse.completed(value));
      }).onError((error, stackTrace) {
        setPrayerDetails(ApiResponse.error(error.toString()));
      });
    });
  }
}
