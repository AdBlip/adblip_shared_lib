// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:adblip_shared_lib/models/enums/sorting_type.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import '../helper_models/uploaded_file_data.dart';
import 'address.dart';

class Board {
  String id;
  String boardOwnerId;
  int? maxMediaUploadSizeInMb;
  String title;
  String description;
  List<UploadedFileData>? imagesData;
  int widthInCm;
  int heightInCm;
  bool isDigitalAd;
  double dailyPriceAfterDiscount;
  double dailyPriceBeforeDiscount;
  String priceUnit;
  SortingType sortingType;
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
  int resolutionInPixels;
  int totalDurationOfRenting;
  int bookedThisManyTimes;
  int numOfViews;
  String ratio;

  GeoFirePoint geoFirePoint;

  Board(
      {required this.id,
      required this.boardOwnerId,
      this.maxMediaUploadSizeInMb,
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
      required this.sortingType,
      required this.geoFirePoint
      // required this.isAvailable
      // required this.bookedTimeSpans
      });

  Board copyWith(
      {String? id,
      String? boardOwnerId,
      int? maxMediaUploadSizeInMb,
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
      int? resolutionInPixels,
      int? totalDurationOfRenting,
      String? ratio,
      FormatType? formatType,
      SortingType? sortingType,
      SizeType? sizeType,
      int? numOfViews,
      GeoFirePoint? geoFirePoint,
      double? weightedRating}) {
    return Board(
        id: id ?? this.id,
        boardOwnerId: boardOwnerId ?? this.boardOwnerId,
        maxMediaUploadSizeInMb:
            maxMediaUploadSizeInMb ?? this.maxMediaUploadSizeInMb,
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
        sortingType: sortingType ?? this.sortingType,
        formatType: formatType ?? this.formatType,
        sizeType: sizeType ?? this.sizeType,
        geoFirePoint: geoFirePoint ?? this.geoFirePoint
        // isAvailable: isAvailable ?? this.isAvailable,
        // bookedTimeSpans: bookedTimeSpans ?? this.bookedTimeSpans,
        );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'boardOwnerId': boardOwnerId,
      'maxMediaUploadSizeInMb': maxMediaUploadSizeInMb,
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
      'timeOfCreation': timeOfCreation.toDate().toIso8601String(),
      'rating': rating?.map((key, value) => MapEntry(key.toString(), value)),
      'minimumRentDurationInDays': minimumRentDurationInDays,
      'maximumRentDurationInDays': maximumRentDurationInDays,
      'resolutionInPixels': resolutionInPixels,
      'totalDurationOfRenting': totalDurationOfRenting,
      'ratio': ratio,
      'weightedRating': weightedRating,
      'numOfViews': numOfViews,
      'sortingType': sortingType.index,
      'formatType': formatType.index,
      'sizeType': sizeType.index,
      // 'isAvailable': isAvailable,
      // 'bookedTimeSpans': bookedTimeSpans.map((x) => x.toMap()).toList(),
    };
  }

  factory Board.fromMap(Map<String, dynamic> map) {
    final timeOfCreation = map['timeOfCreation'] is Timestamp
        ? (map['timeOfCreation'] as Timestamp)
        : Timestamp.fromDate(DateTime.parse(map['timeOfCreation'] as String));

    return Board(
      id: map['id'] as String,
      geoFirePoint: GeoFirePoint(
          GeoPoint(map['latitude'] as double, map['longitude'] as double)),
      boardOwnerId: map['boardOwnerId'] as String,
      maxMediaUploadSizeInMb: map['maxMediaUploadSizeInMb'] != null
          ? map['maxMediaUploadSizeInMb'] as int
          : null,
      title: map['title'] as String,
      description: map['description'] as String,
      imagesData: List<UploadedFileData>.from((map['imagesData'] != null
          ? (map["imagesData"] as List<dynamic>)
              .map((e) => UploadedFileData.fromMap(e))
              .toList()
          : [])),
      widthInCm: map['widthInCm'] as int,
      heightInCm: map['heightInCm'] as int,
      isDigitalAd:
          (map['isDigitalAd'] as bool?) ?? false, // Provide default if null
      dailyPriceAfterDiscount:
          (map['dailyPriceAfterDiscount'] as num).toDouble(),
      // isDigitalAd: map['isDigitalAd'] as bool,
      // dailyPriceAfterDiscount: (map['dailyPriceAfterDiscount'] as num).toDouble(),
      dailyPriceBeforeDiscount:
          (map['dailyPriceBeforeDiscount'] as num).toDouble(),
      priceUnit: map['priceUnit'] as String,
      preparationDays: map['preparationDays'] as int,
      // latLng: LatLng(
      //   (map['latLng']['latitude'] as num).toDouble(),
      //   (map['latLng']['longitude'] as num).toDouble(),
      // ),

      address: Address.fromMap(map['address']),
      bookedThisManyTimes: map['bookedThisManyTimes'] as int,
      timeOfCreation: timeOfCreation,
      rating: map["rating"] != null
          ? Map<int, int>.from(map["rating"]
              ?.map((key, value) => MapEntry(int.parse(key), value)))
          : null,
      minimumRentDurationInDays: map['minimumRentDurationInDays'] as int,
      maximumRentDurationInDays: map['maximumRentDurationInDays'] != null
          ? map['maximumRentDurationInDays'] as int
          : null,
      resolutionInPixels: map['resolutionInPixels'] as int,
      totalDurationOfRenting: map['totalDurationOfRenting'] as int,
      ratio: map['ratio'] as String,
      weightedRating: map['weightedRating'] != null
          ? (map['weightedRating'] as num).toDouble()
          : null,
      numOfViews: map['numOfViews'] as int,
      sizeType: SizeType.values[map['sizeType'] as int],
      formatType: FormatType.values[map['formatType'] as int],
      sortingType: SortingType.values[map['sortingType'] as int],
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      // isAvailable:
      //     (map['isAvailable'] as bool?) ?? true, // Provide default if null
      // bookedTimeSpans: List<BookedTimeSpan>.from(
      //     (map['bookedTimeSpans'] ?? []).map((x) => BookedTimeSpan.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Board.fromJson(String source) =>
      Board.fromMap(json.decode(source) as Map<String, dynamic>);
}
