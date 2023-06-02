import 'package:flutter/foundation.dart';
import '../../data/responses/api_response.dart';
import '../../models/language/language_model.dart';
import '../../models/translate/translate_model.dart';
import '../../repository/translate/translate_repository.dart';
import '../../resources/url/api_keys.dart';

class TranslateViewModel with ChangeNotifier {
  
  final _translateRepo = TranslateRepository();
  
  ApiResponse<List<Languages>> languages = ApiResponse.loading();

  setLanguages(ApiResponse<List<Languages>> response) {
    languages = response;
    notifyListeners();
  }

  Future<void> getLanguages() async {
    setLanguages(ApiResponse.loading());

    _translateRepo.getLanguagesApi(
        {"X-RapidAPI-Key": ApiKeys.translateApiKey}).then((value) {
      setLanguages(ApiResponse.completed(value.data!.languages));
    }).onError((error, stackTrace) {
      setLanguages(ApiResponse.error(error.toString()));
    });
  }

  ApiResponse<TranslateModel> translation = ApiResponse.loading();

  setTranslation(ApiResponse<TranslateModel> response) {
    translation = response;
    notifyListeners();
  }

  Future<void> getTranslation(
      String targetLanguage, text,{ String? sourceLanguage}) async {
    setTranslation(ApiResponse.loading());

    _translateRepo.translateApi({
      "X-RapidAPI-Key": ApiKeys.translateApiKey,
      'Content-Type': 'application/x-www-form-urlencoded'
    }, {
      'target_language': targetLanguage,
      'text': text
    }).then((value) {
      setTranslation(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setTranslation(ApiResponse.error(error.toString()));
    });
  }
}
