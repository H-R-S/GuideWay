import 'package:flutter/material.dart';
import '../../data/responses/api_response.dart';
import '../../models/convert_currency/convert_currency_model.dart';
import '../../models/currency/currency_model.dart';
import '../../repository/currency/currency_repository.dart';
import '../../resources/url/api_keys.dart';

class CurrencyViewModel with ChangeNotifier {
  final _currencyRepo = CurrencyRepository();

  ApiResponse<ConvertCurrencyModel> convertCurrencyDetails =
      ApiResponse.loading();

  setConvertCurrencyDetails(ApiResponse<ConvertCurrencyModel> response) {
    convertCurrencyDetails = response;
    notifyListeners();
  }

  Future<void> getConvertCurrencyDetails(
      String fromCurrency, toCurrency, amount) async {
    setConvertCurrencyDetails(ApiResponse.loading());

    final header = {"X-RapidAPI-Key": ApiKeys.rapidApiKey};

    _currencyRepo
        .getConvertCurrencyApi(fromCurrency, toCurrency, amount, header)
        .then((value) {
      setConvertCurrencyDetails(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setConvertCurrencyDetails(ApiResponse.error(error.toString()));
    });
  }

  ApiResponse<List<CurrencyModel>> currencyList = ApiResponse.loading();

  setCurrencyList(ApiResponse<List<CurrencyModel>> response) {
    currencyList = response;
    notifyListeners();
  }

  Future<void> getCurrencyList() async {
    setCurrencyList(ApiResponse.loading());

    final header = {"X-RapidAPI-Key": ApiKeys.rapidApiKey};

    _currencyRepo.getCurrenciesApi(header).then((value) {
      setCurrencyList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setCurrencyList(ApiResponse.error(error.toString()));
    });
  }
}
