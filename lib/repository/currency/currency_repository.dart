import '../../data/network/base_api_service.dart';
import '../../data/network/network_api_service.dart';
import '../../models/convert_currency/convert_currency_model.dart';
import '../../models/currency/currency_model.dart';
import '../../resources/url/app_url.dart';

class CurrencyRepository {
  BaseApiServices apiServices = NetworkApiService();

  Future<ConvertCurrencyModel> getConvertCurrencyApi(
      String fromCurrency, toCurrency, amount, dynamic header) async {
    try {
      dynamic response = await apiServices.getApiResponseWithHeader(
          "${AppURL.getCurrencyConvertEndPoint}?from=$fromCurrency&to=$toCurrency&amount=$amount",
          header);

      return response = ConvertCurrencyModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CurrencyModel>> getCurrenciesApi(dynamic header) async {
    try {
      List<dynamic> response = await apiServices.getApiResponseWithHeader(
          AppURL.getCurrenciesEndPoint, header);

      return response =
          (response).map((e) => CurrencyModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
