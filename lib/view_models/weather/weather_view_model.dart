import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/responses/api_response.dart';
import '../../models/country/country_model.dart';
import '../../models/weather/weather_model.dart';
import '../../repository/weather/weather_repository.dart';
import '../../resources/data/countries.dart';
import '../../resources/url/api_keys.dart';
import '../user/user_view_model.dart';

class WeatherViewModel with ChangeNotifier {
  final _weatherRepo = WeatherRepository();

  ApiResponse<WeatherModel> getWeatherDetails = ApiResponse.loading();

  setWeatherDetails(ApiResponse<WeatherModel> response) {
    getWeatherDetails = response;
    notifyListeners();
  }

  Future<void> getWeather(BuildContext context) async {
    setWeatherDetails(ApiResponse.loading());

    final userViewModel = Provider.of<UserViewModel>(context, listen: false);

    userViewModel.getUser().then((user) {
      CountryModel? userCountry =
          countries.firstWhere((country) => country.id == user!.countryId);

      final header = {"X-RapidAPI-Key": ApiKeys.rapidApiKey};

      _weatherRepo.getWeatherApi(userCountry.capital!, header).then((value) {
        setWeatherDetails(ApiResponse.completed(value));
      }).onError((error, stackTrace) {
        setWeatherDetails(ApiResponse.error(error.toString()));
      });
    });
  }
}
