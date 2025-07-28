enum LanguageCodesConstants {
  //ISO codes as described in the ISO 639-1 international standard.
  //https://en.wikipedia.org/wiki/ISO_639-1
  arabic("ar"),
  english("en");

  const LanguageCodesConstants(this.code);
  final String code;

  String get toName {
    switch (this) {
      case LanguageCodesConstants.arabic:
        return "Arabic";
      case LanguageCodesConstants.english:
        return "English";
    }
  }

  static String? codeToLanguageName(String code) {
    switch (code.toUpperCase()) {
      case "AR":
        return "Arabic";
      case "EN":
        return "English";
    }
  }
}
