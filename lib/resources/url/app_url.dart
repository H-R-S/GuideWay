class AppURL {
  
  // Translate API's
  static var baseTranslateUrl = "https://text-translator2.p.rapidapi.com";

  static var getLanguagesEndPoint = "$baseTranslateUrl/getLanguages";
  static var getTranslationEndPoint = "$baseTranslateUrl/translate";

  // Currency API's 
  static var baseCurrencyUrl = "https://currency-converter-pro1.p.rapidapi.com";

  static var getCurrenciesEndPoint = "$baseCurrencyUrl/currencies";
  static var getCurrencyConvertEndPoint = "$baseCurrencyUrl/convert";

  // Prayer's Timing API
  static var basePrayerUrl = "https://api.aladhan.com";

  static var getPrayerTimingsEndPoint = "$basePrayerUrl/v1/timings";
}