enum LanguageCodesConstants {
  //ISO codes as described in the ISO 639-1 international standard.
  //https://en.wikipedia.org/wiki/ISO_639-1
  arabic("ar"),
  english("en");

  const LanguageCodesConstants(this.value);
  final String value;

  static String? codeToLanguageName(String code) {
    switch (code.toUpperCase()) {
      case "AR":
        return "Arabic";
      case "EN":
        return "English";
    }
  }
}
