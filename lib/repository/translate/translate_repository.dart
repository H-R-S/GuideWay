import '../../data/network/base_api_service.dart';
import '../../data/network/network_api_service.dart';
import '../../models/language/language_model.dart';
import '../../models/translate/translate_model.dart';
import '../../resources/url/app_url.dart';

class TranslateRepository {
  BaseApiServices apiServices = NetworkApiService();

  Future<LanguageModel> getLanguagesApi(dynamic header) async {
    try {
      dynamic response = await apiServices.getApiResponseWithHeader(
          AppURL.getLanguagesEndPoint, header);

      return LanguageModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<TranslateModel> translateApi(dynamic header, dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponseWithHeader(
          AppURL.getTranslationEndPoint, header, data);

      return response = TranslateModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
