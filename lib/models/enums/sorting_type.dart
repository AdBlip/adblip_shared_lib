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

const Map<SortingType, String> sortingTypeArabic = {
  SortingType.sortedByPriceLowToHigh: "الترتيب حسب السعر: من الأقل إلى الأعلى",
  SortingType.sortedByPriceHighToLow: "الترتيب حسب السعر: من الأعلى إلى الأقل",
  SortingType.sortedByRateHighToLow: "الترتيب حسب التقييم: من الأعلى إلى الأقل",
  SortingType.sortedByRateLowToHigh: "الترتيب حسب التقييم: من الأقل إلى الأعلى",
};

const Map<SortingType, String> sortingTypeEnglish = {
  SortingType.sortedByPriceLowToHigh: "Sorted by Price: Low to High",
  SortingType.sortedByPriceHighToLow: "Sorted by Price: High to Low",
  SortingType.sortedByRateHighToLow: "Sorted by Rate: High to Low",
  SortingType.sortedByRateLowToHigh: "Sorted by Rate: Low to High",
};

const Map<FormatType, String> formatTypeArabic = {
  FormatType.staticImage: "صورة ثابتة",
  FormatType.digitalImage: "صورة رقمية",
  FormatType.video: "فيديو",
  FormatType.dynamic: "ديناميكي",
  FormatType.indoor: "داخلي",
  FormatType.outdoor: "خارجي",
};

const Map<FormatType, String> formatTypeEnglish = {
  FormatType.staticImage: "Static Image",
  FormatType.digitalImage: "Digital Image",
  FormatType.video: "Video",
  FormatType.dynamic: "Dynamic",
  FormatType.indoor: "Indoor",
  FormatType.outdoor: "Outdoor",
};

const Map<SizeType, String> sizeTypeArabic = {
  SizeType.bulletIn: "لوحة إعلانية",
  SizeType.triFaced: "ثلاثي الوجوه",
  SizeType.posters: "ملصقات",
  SizeType.juniorPosters: "ملصقات صغيرة",
  SizeType.spectaclulars: "لوحات ضخمة",
  SizeType.wallScapes: "لوحات جدارية",
};

const Map<SizeType, String> sizeTypeEnglish = {
  SizeType.bulletIn: "Bulletin",
  SizeType.triFaced: "Tri-Faced",
  SizeType.posters: "Posters",
  SizeType.juniorPosters: "Junior Posters",
  SizeType.spectaclulars: "Spectaculars",
  SizeType.wallScapes: "Wallscapes",
};
