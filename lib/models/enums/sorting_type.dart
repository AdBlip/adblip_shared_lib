//DO NOT DELETE OR MANIPULATE THIS AFTER PRODUCTION

enum SortingType {
  sortedByPriceLowToHigh,
  sortedByPriceHighToLow,
  sortedByRateHighToLow,
  sortedByRateLowToHigh
}

enum FormatType { staticImage, digitalImage, video, dynamic, indoor, outdoor }

enum SizeType {
  bulletIn,
  triFaced,
  posters,
  juniorPosters,
  spectaclulars,
  wallScapes
}

Map<int, String> sortingTypeArabic = {
  SortingType.sortedByPriceLowToHigh.index:
      "الترتيب حسب السعر: من الأقل إلى الأعلى",
  SortingType.sortedByPriceHighToLow.index:
      "الترتيب حسب السعر: من الأعلى إلى الأقل",
  SortingType.sortedByRateHighToLow.index:
      "الترتيب حسب التقييم: من الأعلى إلى الأقل",
  SortingType.sortedByRateLowToHigh.index:
      "الترتيب حسب التقييم: من الأقل إلى الأعلى",
};

Map<int, String> sortingTypeEnglish = {
  SortingType.sortedByPriceLowToHigh.index: "Sorted by Price: Low to High",
  SortingType.sortedByPriceHighToLow.index: "Sorted by Price: High to Low",
  SortingType.sortedByRateHighToLow.index: "Sorted by Rate: High to Low",
  SortingType.sortedByRateLowToHigh.index: "Sorted by Rate: Low to High",
};

Map<int, String> formatTypeArabic = {
  FormatType.staticImage.index: "صورة ثابتة",
  FormatType.digitalImage.index: "صورة رقمية",
  FormatType.video.index: "فيديو",
  FormatType.dynamic.index: "ديناميكي",
  FormatType.indoor.index: "داخلي",
  FormatType.outdoor.index: "خارجي",
};

Map<int, String> formatTypeEnglish = {
  FormatType.staticImage.index: "Static Image",
  FormatType.digitalImage.index: "Digital Image",
  FormatType.video.index: "Video",
  FormatType.dynamic.index: "Dynamic",
  FormatType.indoor.index: "Indoor",
  FormatType.outdoor.index: "Outdoor",
};

Map<int, String> sizeTypeArabic = {
  SizeType.bulletIn.index: "لوحة إعلانية",
  SizeType.triFaced.index: "ثلاثي الوجوه",
  SizeType.posters.index: "ملصقات",
  SizeType.juniorPosters.index: "ملصقات صغيرة",
  SizeType.spectaclulars.index: "لوحات ضخمة",
  SizeType.wallScapes.index: "لوحات جدارية",
};

Map<int, String> sizeTypeEnglish = {
  SizeType.bulletIn.index: "Bulletin",
  SizeType.triFaced.index: "Tri-Faced",
  SizeType.posters.index: "Posters",
  SizeType.juniorPosters.index: "Junior Posters",
  SizeType.spectaclulars.index: "Spectaculars",
  SizeType.wallScapes.index: "Wallscapes",
};
