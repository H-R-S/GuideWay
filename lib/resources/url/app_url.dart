class AppURL {
  
  // Translate API's
  static var baseTranslateUrl = "https://text-translator2.p.rapidapi.com";

  static var getLanguagesEndPoint = "$baseTranslateUrl/getLanguages";
  static var getTranslationEndPoint = "$baseTranslateUrl/translate";

  // Currency API's 
  static var baseCurrencyUrl = "https://currency-converter18.p.rapidapi.com";

  static var getCurrenciesEndPoint = "$baseCurrencyUrl/api/v1/supportedCurrencies";
  static var getCurrencyConvertEndPoint = "$baseCurrencyUrl/api/v1/convert";

  // Prayer's Timing API
  static var basePrayerUrl = "https://api.aladhan.com";

  static var getPrayerTimingsEndPoint = "$basePrayerUrl/v1/timings";

  // Weather API
  static var baseWeatherUrl = "https://weatherapi-com.p.rapidapi.com";

  static var getWeatherEndPoint = "$baseWeatherUrl/forecast.json";
}