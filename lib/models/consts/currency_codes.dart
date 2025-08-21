enum CurrencyCodesConstants {
  //ISO codes as described in the ISO 4217 international standard.
  //https://en.wikipedia.org/wiki/ISO_4217
  //Country codes follow ISO 3166-1 alpha-2 standard

  egypt("EGP", "EG", "Egyptian Pound", "الجنيه المصري"),
  saudiArabia("SAR", "SA", "Saudi Riyal", "الريال السعودي"),
  uae("AED", "AE", "UAE Dirham", "درهم الإمارات"),
  kuwait("KWD", "KW", "Kuwaiti Dinar", "دينار كويتي");

  const CurrencyCodesConstants(
      this.currencyCode, this.countryCode, this.englishName, this.arabicName);

  final String currencyCode; // ISO 4217 currency code
  final String countryCode; // ISO 3166-1 alpha-2 country code
  final String englishName; // English name
  final String arabicName; // Arabic name

  static const List<String> allCurrencyCodes = ["EGP", "SAR", "AED", "KWD"];
  static const List<String> allCountryCodes = ["EG", "SA", "AE", "KW"];

  String get toName => englishName;
  String get toArabicName => arabicName;
  String get toCountryCode => countryCode;

  toJson() => countryCode;

  static String? codeToCurrencyName(String code) {
    try {
      return CurrencyCodesConstants.values
          .firstWhere((currency) => currency.currencyCode == code.toUpperCase())
          .englishName;
    } catch (e) {
      return null;
    }
  }

  static String? codeToArabicName(String code) {
    try {
      return CurrencyCodesConstants.values
          .firstWhere((currency) => currency.currencyCode == code.toUpperCase())
          .arabicName;
    } catch (e) {
      return null;
    }
  }

  static String? codeToCountryCode(String code) {
    try {
      return CurrencyCodesConstants.values
          .firstWhere((currency) => currency.currencyCode == code.toUpperCase())
          .countryCode;
    } catch (e) {
      return null;
    }
  }

  static CurrencyCodesConstants? fromCode(String code) {
    try {
      return CurrencyCodesConstants.values.firstWhere(
          (currency) => currency.currencyCode == code.toUpperCase());
    } catch (e) {
      return null;
    }
  }

  static CurrencyCodesConstants? fromCountryCode(String countryCode) {
    try {
      return CurrencyCodesConstants.values.firstWhere(
          (currency) => currency.countryCode == countryCode.toUpperCase());
    } catch (e) {
      return null;
    }
  }
}
