enum CountryCodesConstants {
  //ISO codes as described in the ISO 3166 international standard.
  //https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2
  egypt("EG"),
  saudiArabia("SA"),
  uae("AE"),
  kuwait("KW");

  const CountryCodesConstants(this.code);

  final String code;

  static const List<String> allCodes = ["EG", "SA", "AE", "KW"];

  String get toName {
    switch (this) {
      case CountryCodesConstants.egypt:
        return "Egypt";
      case CountryCodesConstants.saudiArabia:
        return "Saudi Arabia";
      case CountryCodesConstants.uae:
        return "United Arab Emirates";
      case CountryCodesConstants.kuwait:
        return "Kuwait";
    }
  }

  static String? codeToCountryName(String code) {
    switch (code.toUpperCase()) {
      case "EG":
        return "Egypt";
      case "SA":
        return "Saudi Arabia";
      case "AE":
        return "United Arab Emirates";
      case "KW":
        return "Kuwait";
      default:
        return null;
    }
  }
}
