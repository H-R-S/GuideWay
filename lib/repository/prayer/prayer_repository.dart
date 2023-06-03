import 'package:intl/intl.dart';
import '../../data/network/base_api_service.dart';
import '../../data/network/network_api_service.dart';
import '../../models/prayer/prayer_model.dart';
import '../../resources/url/app_url.dart';

class PrayerRepository {
  BaseApiServices apiServices = NetworkApiService();

  Future<PrayerModel> getPrayerTimingsApi(num latitude, longitude) async {
    try {
      final currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

      dynamic response = await apiServices.getApiResponse(
          "${AppURL.getPrayerTimingsEndPoint}/$currentDate?latitude=$latitude&longitude=$longitude");

      return response = PrayerModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
