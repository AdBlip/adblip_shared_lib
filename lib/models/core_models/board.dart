// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:adblip_shared_lib/models/consts/sorting_type.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import '../helper_models/uploaded_file_data.dart';
import 'address.dart';

class Board {
  String id;
  String customId;
  String boardOwnerId;
  int? maxMediaUploadSizeInMb;
  String countryCode; //ISO 3166-1 alpha-2 code
  bool isAvailable;
  String title;
  String description;
  bool isDeleted;
  List<UploadedFileData>? imagesData;
  int widthInCm;
  int heightInCm;
  bool isDigitalAd;
  double dailyPriceAfterDiscount;
  double dailyPriceBeforeDiscount;
  String priceUnit;
  FormatType formatType;
  SizeType sizeType;
  int preparationDays; //default is 1 working day (Sunday to Thursday)
  double latitude;
  double longitude;
  Address address;
  Timestamp timeOfCreation;
  Map<int, int>? rating;
  double? weightedRating;
  int minimumRentDurationInDays;
  int? maximumRentDurationInDays;
  String resolutionInPixels;
  int totalDurationOfRenting;
  int bookedThisManyTimes;
  int numOfViews;
  String ratio;
  bool? isOutdoor;

  GeoFirePoint geoFirePoint;

  Board(
      {required this.id,
      required this.customId,
      required this.boardOwnerId,
      required this.countryCode,
      required this.isAvailable,
      this.maxMediaUploadSizeInMb,
      required this.isDeleted,
      required this.title,
      required this.description,
      this.imagesData,
      this.weightedRating,
      required this.widthInCm,
      required this.heightInCm,
      required this.isDigitalAd,
      required this.dailyPriceAfterDiscount,
      required this.dailyPriceBeforeDiscount,
      required this.priceUnit,
      required this.preparationDays,
      required this.latitude,
      required this.longitude,
      required this.address,
      required this.bookedThisManyTimes,
      required this.timeOfCreation,
      this.rating,
      required this.minimumRentDurationInDays,
      this.maximumRentDurationInDays,
      required this.resolutionInPixels,
      required this.totalDurationOfRenting,
      required this.ratio,
      required this.numOfViews,
      required this.formatType,
      required this.sizeType,
      this.isOutdoor,
      required this.geoFirePoint});

  Board copyWith(
      {String? id,
      String? customId,
      String? boardOwnerId,
      String? countryCode,
      bool? isAvailable,
      int? maxMediaUploadSizeInMb,
      bool? isDeleted,
      String? title,
      String? description,
      List<UploadedFileData>? imagesData,
      int? widthInCm,
      int? heightInCm,
      bool? isDigitalAd,
      double? dailyPriceAfterDiscount,
      double? dailyPriceBeforeDiscount,
      String? priceUnit,
      int? preparationDays,
      double? longitude,
      double? latitude,
      Address? address,
      int? bookedThisManyTimes,
      Timestamp? timeOfCreation,
      Map<int, int>? rating,
      int? minimumRentDurationInDays,
      int? maximumRentDurationInDays,
      String? resolutionInPixels,
      int? totalDurationOfRenting,
      String? ratio,
      FormatType? formatType,
      SizeType? sizeType,
      int? numOfViews,
      GeoFirePoint? geoFirePoint,
      double? weightedRating,
      bool? isOutdoor}) {
    return Board(
        id: id ?? this.id,
        customId: customId ?? this.customId,
        boardOwnerId: boardOwnerId ?? this.boardOwnerId,
        countryCode: countryCode ?? this.countryCode,
        isAvailable: isAvailable ?? this.isAvailable,
        maxMediaUploadSizeInMb:
            maxMediaUploadSizeInMb ?? this.maxMediaUploadSizeInMb,
        isDeleted: isDeleted ?? this.isDeleted,
        title: title ?? this.title,
        description: description ?? this.description,
        imagesData: imagesData ?? this.imagesData,
        widthInCm: widthInCm ?? this.widthInCm,
        heightInCm: heightInCm ?? this.heightInCm,
        isDigitalAd: isDigitalAd ?? this.isDigitalAd,
        dailyPriceAfterDiscount:
            dailyPriceAfterDiscount ?? this.dailyPriceAfterDiscount,
        dailyPriceBeforeDiscount:
            dailyPriceBeforeDiscount ?? this.dailyPriceBeforeDiscount,
        priceUnit: priceUnit ?? this.priceUnit,
        preparationDays: preparationDays ?? this.preparationDays,
        longitude: longitude ?? this.longitude,
        latitude: latitude ?? this.latitude,
        address: address ?? this.address,
        bookedThisManyTimes: bookedThisManyTimes ?? this.bookedThisManyTimes,
        timeOfCreation: timeOfCreation ?? this.timeOfCreation,
        rating: rating ?? this.rating,
        minimumRentDurationInDays:
            minimumRentDurationInDays ?? this.minimumRentDurationInDays,
        maximumRentDurationInDays:
            maximumRentDurationInDays ?? this.maximumRentDurationInDays,
        resolutionInPixels: resolutionInPixels ?? this.resolutionInPixels,
        totalDurationOfRenting:
            totalDurationOfRenting ?? this.totalDurationOfRenting,
        ratio: ratio ?? this.ratio,
        weightedRating: weightedRating ?? this.weightedRating,
        numOfViews: numOfViews ?? this.numOfViews,
        formatType: formatType ?? this.formatType,
        sizeType: sizeType ?? this.sizeType,
        isOutdoor: isOutdoor ?? this.isOutdoor,
        geoFirePoint: geoFirePoint ?? this.geoFirePoint);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'customId': customId,
      'boardOwnerId': boardOwnerId,
      'countryCode': countryCode,
      'isAvailable': isAvailable,
      'maxMediaUploadSizeInMb': maxMediaUploadSizeInMb,
      'isDeleted': isDeleted,
      'title': title,
      'description': description,
      'imagesData': imagesData?.map((x) => x.toMap()).toList(),
      'widthInCm': widthInCm,
      'heightInCm': heightInCm,
      'isDigitalAd': isDigitalAd,
      'dailyPriceAfterDiscount': dailyPriceAfterDiscount,
      'dailyPriceBeforeDiscount': dailyPriceBeforeDiscount,
      'priceUnit': priceUnit,
      'preparationDays': preparationDays,
      'latitude': latitude,
      'longitude': longitude,
      'geoFirePoint': geoFirePoint.data,
      'address': address.toMap(),
      'bookedThisManyTimes': bookedThisManyTimes,
      'timeOfCreation': timeOfCreation,
      'rating': rating?.map((key, value) => MapEntry(key.toString(), value)),
      'minimumRentDurationInDays': minimumRentDurationInDays,
      'maximumRentDurationInDays': maximumRentDurationInDays,
      'resolutionInPixels': resolutionInPixels,
      'totalDurationOfRenting': totalDurationOfRenting,
      'ratio': ratio,
      'weightedRating': weightedRating,
      'numOfViews': numOfViews,
      'formatType': formatType.toJson(),
      'sizeType': sizeType.toJson(),
      'isOutdoor': isOutdoor,
    };
  }

  factory Board.fromMap(Map<String, dynamic> map) {
    return Board(
      id: map['id'] as String,
      geoFirePoint: GeoFirePoint(GeoPoint((map['latitude'] as num).toDouble(),
          (map['longitude'] as num).toDouble())),
      customId: map['customId'] as String,
      boardOwnerId: map['boardOwnerId'] as String,
      countryCode: map['countryCode'] as String,
      isAvailable: map['isAvailable'] as bool,
      maxMediaUploadSizeInMb: map['maxMediaUploadSizeInMb'] != null
          ? map['maxMediaUploadSizeInMb'] as int
          : null,
      isDeleted: map['isDeleted'] as bool,
      title: map['title'] as String,
      description: map['description'] as String,
      imagesData: List<UploadedFileData>.from((map['imagesData'] != null
          ? (map["imagesData"] as List<dynamic>)
              .map((e) => UploadedFileData.fromMap(e))
              .toList()
          : [])),
      widthInCm: map['widthInCm'] as int,
      heightInCm: map['heightInCm'] as int,
      isDigitalAd: (map['isDigitalAd'] as bool?) ?? false,
      dailyPriceAfterDiscount:
          (map['dailyPriceAfterDiscount'] as num).toDouble(),
      dailyPriceBeforeDiscount:
          (map['dailyPriceBeforeDiscount'] as num).toDouble(),
      priceUnit: map['priceUnit'] as String,
      preparationDays: map['preparationDays'] as int,
      address: Address.fromMap(map['address']),
      bookedThisManyTimes: map['bookedThisManyTimes'] as int,
      timeOfCreation: map['timeOfCreation'] as Timestamp,
      rating: map["rating"] != null
          ? Map<int, int>.from(map["rating"]
              ?.map((key, value) => MapEntry(int.parse(key), value)))
          : null,
      minimumRentDurationInDays: map['minimumRentDurationInDays'] as int,
      maximumRentDurationInDays: map['maximumRentDurationInDays'] != null
          ? map['maximumRentDurationInDays'] as int
          : null,
      resolutionInPixels: map['resolutionInPixels'] as String,
      totalDurationOfRenting: map['totalDurationOfRenting'] as int,
      ratio: map['ratio'] as String,
      weightedRating: map['weightedRating'] != null
          ? (map['weightedRating'] as num).toDouble()
          : null,
      numOfViews: map['numOfViews'] as int,
      sizeType: SizeType.fromJson(map['sizeType'] as String),
      formatType: FormatType.fromJson(map['formatType'] as String),
      latitude: (map['latitude'] as num).toDouble(),
      longitude: (map['longitude'] as num).toDouble(),
      isOutdoor: map['isOutdoor'] != null ? map['isOutdoor'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Board.fromJson(String source) =>
      Board.fromMap(json.decode(source) as Map<String, dynamic>);
}
