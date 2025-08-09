//DO NOT DELETE OR MANIPULATE THIS AFTER PRODUCTION

enum SortingType {
  sortedByPriceLowToHigh,
  sortedByPriceHighToLow,
  sortedByRateHighToLow,
  sortedByRateLowToHigh;

  String toJson() => name;

  String get arabic {
    switch (this) {
      case SortingType.sortedByPriceLowToHigh:
        return "الترتيب حسب السعر: من الأقل إلى الأعلى";
      case SortingType.sortedByPriceHighToLow:
        return "الترتيب حسب السعر: من الأعلى إلى الأقل";
      case SortingType.sortedByRateHighToLow:
        return "الترتيب حسب التقييم: من الأعلى إلى الأقل";
      case SortingType.sortedByRateLowToHigh:
        return "الترتيب حسب التقييم: من الأقل إلى الأعلى";
    }
  }

  String get english {
    switch (this) {
      case SortingType.sortedByPriceLowToHigh:
        return "Sorted by Price: Low to High";
      case SortingType.sortedByPriceHighToLow:
        return "Sorted by Price: High to Low";
      case SortingType.sortedByRateHighToLow:
        return "Sorted by Rate: High to Low";
      case SortingType.sortedByRateLowToHigh:
        return "Sorted by Rate: Low to High";
    }
  }

  static SortingType fromJson(String json) {
    return SortingType.values.firstWhere(
      (e) => e.name == json,
      orElse: () => SortingType.sortedByPriceLowToHigh,
    );
  }
}

enum FormatType {
  staticImage,
  video,
  dynamic;

  String toJson() => name;

  String get arabic {
    switch (this) {
      case FormatType.staticImage:
        return "صورة ثابتة";
      case FormatType.video:
        return "فيديو";
      case FormatType.dynamic:
        return "ديناميكي";
    }
  }

  String get english {
    switch (this) {
      case FormatType.staticImage:
        return "Static Image";
      case FormatType.video:
        return "Video";
      case FormatType.dynamic:
        return "Dynamic";
    }
  }

  static FormatType fromJson(String json) {
    return FormatType.values.firstWhere(
      (e) => e.name == json,
      orElse: () => FormatType.staticImage,
    );
  }
}

enum SizeType {
  bulletIn,
  triFaced,
  posters,
  juniorPosters,
  spectaclulars,
  wallScapes;

  String toJson() => name;

  String get arabic {
    switch (this) {
      case SizeType.bulletIn:
        return "لوحة إعلانية";
      case SizeType.triFaced:
        return "ثلاثي الوجوه";
      case SizeType.posters:
        return "ملصقات";
      case SizeType.juniorPosters:
        return "ملصقات صغيرة";
      case SizeType.spectaclulars:
        return "لوحات ضخمة";
      case SizeType.wallScapes:
        return "لوحات جدارية";
    }
  }

  String get english {
    switch (this) {
      case SizeType.bulletIn:
        return "Bulletin";
      case SizeType.triFaced:
        return "Tri-Faced";
      case SizeType.posters:
        return "Posters";
      case SizeType.juniorPosters:
        return "Junior Posters";
      case SizeType.spectaclulars:
        return "Spectaculars";
      case SizeType.wallScapes:
        return "Wallscapes";
    }
  }

  static SizeType fromJson(String json) {
    return SizeType.values.firstWhere(
      (e) => e.name == json,
      orElse: () => SizeType.bulletIn,
    );
  }
}
