import '../../data/network/base_api_service.dart';
import '../../data/network/network_api_service.dart';
import '../../models/weather/weather_model.dart';
import '../../resources/url/app_url.dart';

class WeatherRepository {
  BaseApiServices apiServices = NetworkApiService();

  Future<WeatherModel> getWeatherApi(String city, dynamic header) async {
    try {
      dynamic response = await apiServices.getApiResponseWithHeader(
          "${AppURL.getWeatherEndPoint}?q=$city&days=3", header);

      return response = WeatherModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
