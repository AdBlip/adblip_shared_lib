// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../helper_models/image_data.dart';
import 'address.dart';

class BoardType {
  String id;
  String name;

  BoardType({required this.id, required this.name});

  BoardType copyWith({String? id, String? name}) {
    return BoardType(id: id ?? this.id, name: name ?? this.name);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory BoardType.fromMap(Map<String, dynamic> map) {
    return BoardType(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }
}

class Board {
  String id;
  String boardIdByCompany;
  String ownerCompanyId;

  int? maxMediaUploadSizeInMb;
  String title;
  String description;
  List<ImageData>? imagesData;
  int widthInCm;
  int heightInCm;
  bool isDigitalAd;
  double priceAfterDiscount;
  double priceBeforeDiscount;
  String priceUnit;

  int preparationDays; //default is 1 working day (Sunday to Thursday)

  LatLng latLng;
  Address address;
  Timestamp timeOfCreation;
  BoardType boardType;
  //edit
  Map<int, int>? rating;
  double? weightedRating;

  //new
  int minimumRentDuration;
  int? maximumRentDuration;

  String timeUnit;
  int resolutionInPixels;

  int totalDurationOfRenting;
  int bookedThisManyTimes;
  int numOfViews;

  String ratio;
  Board({
    required this.id,
    required this.boardIdByCompany,
    required this.ownerCompanyId,
    this.maxMediaUploadSizeInMb,
    required this.title,
    required this.description,
    this.imagesData,
    required this.boardType,
    this.weightedRating,
    required this.widthInCm,
    required this.heightInCm,
    required this.isDigitalAd,
    required this.priceAfterDiscount,
    required this.priceBeforeDiscount,
    required this.priceUnit,
    required this.preparationDays,
    required this.latLng,
    required this.address,
    required this.bookedThisManyTimes,
    required this.timeOfCreation,
    this.rating,
    required this.minimumRentDuration,
    this.maximumRentDuration,
    required this.timeUnit,
    required this.resolutionInPixels,
    required this.totalDurationOfRenting,
    required this.ratio,
    required this.numOfViews,
  });

  Board copyWith({
    String? id,
    String? boardIdByCompany,
    String? ownerCompanyId,
    int? maxMediaUploadSizeInMb,
    String? title,
    String? description,
    List<ImageData>? imagesData,
    int? widthInCm,
    int? heightInCm,
    bool? isDigitalAd,
    double? priceAfterDiscount,
    double? priceBeforeDiscount,
    String? priceUnit,
    int? preparationDays,
    LatLng? latLng,
    Address? address,
    int? bookedThisManyTimes,
    Timestamp? timeOfCreation,
    Map<int, int>? rating,
    int? minimumRentDuration,
    int? maximumRentDuration,
    String? timeUnit,
    int? resolutionInPixels,
    int? totalDurationOfRenting,
    String? ratio,
  }) {
    return Board(
      id: id ?? this.id,
      boardIdByCompany: boardIdByCompany ?? this.boardIdByCompany,
      ownerCompanyId: ownerCompanyId ?? this.ownerCompanyId,
      maxMediaUploadSizeInMb:
          maxMediaUploadSizeInMb ?? this.maxMediaUploadSizeInMb,
      title: title ?? this.title,
      description: description ?? this.description,
      imagesData: imagesData ?? this.imagesData,
      widthInCm: widthInCm ?? this.widthInCm,
      heightInCm: heightInCm ?? this.heightInCm,
      isDigitalAd: isDigitalAd ?? this.isDigitalAd,
      priceAfterDiscount: priceAfterDiscount ?? this.priceAfterDiscount,
      priceBeforeDiscount: priceBeforeDiscount ?? this.priceBeforeDiscount,
      priceUnit: priceUnit ?? this.priceUnit,
      preparationDays: preparationDays ?? this.preparationDays,
      latLng: latLng ?? this.latLng,
      address: address ?? this.address,
      bookedThisManyTimes: bookedThisManyTimes ?? this.bookedThisManyTimes,
      timeOfCreation: timeOfCreation ?? this.timeOfCreation,
      rating: rating ?? this.rating,
      minimumRentDuration: minimumRentDuration ?? this.minimumRentDuration,
      maximumRentDuration: maximumRentDuration ?? this.maximumRentDuration,
      timeUnit: timeUnit ?? this.timeUnit,
      resolutionInPixels: resolutionInPixels ?? this.resolutionInPixels,
      totalDurationOfRenting:
          totalDurationOfRenting ?? this.totalDurationOfRenting,
      ratio: ratio ?? this.ratio,
      boardType: boardType ?? this.boardType,
      weightedRating: weightedRating ?? weightedRating,
      numOfViews: numOfViews ?? numOfViews,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'boardIdByCompany': boardIdByCompany,
      'ownerCompanyId': ownerCompanyId,
      'maxMediaUploadSizeInMb': maxMediaUploadSizeInMb,
      'title': title,
      'description': description,
      'imagesData': imagesData?.map((x) => x.toMap()).toList(),
      'widthInCm': widthInCm,
      'heightInCm': heightInCm,
      'isDigitalAd': isDigitalAd,
      'priceAfterDiscount': priceAfterDiscount,
      'priceBeforeDiscount': priceBeforeDiscount,
      'priceUnit': priceUnit,
      'preparationDays': preparationDays,
      'latLng': latLng.toJson(),
      'address': address.toMap(),
      'bookedThisManyTimes': bookedThisManyTimes,
      'timeOfCreation': timeOfCreation,
      'rating': rating?.map((key, value) => MapEntry(key.toString(), value)),
      'minimumRentDuration': minimumRentDuration,
      'maximumRentDuration': maximumRentDuration,
      'timeUnit': timeUnit,
      'resolutionInPixels': resolutionInPixels,
      'totalDurationOfRenting': totalDurationOfRenting,
      'ratio': ratio,
      'boardType': boardType.toMap(),
      'weightedRating': weightedRating,
      'numOfViews': numOfViews,
    };
  }

  factory Board.fromMap(Map<String, dynamic> map) {
    return Board(
        id: map['id'] as String,
        boardIdByCompany: map['boardIdByCompany'] as String,
        ownerCompanyId: map['ownerCompanyId'] as String,
        maxMediaUploadSizeInMb: map['maxMediaUploadSizeInMb'] != null
            ? map['maxMediaUploadSizeInMb'] as int
            : null,
        title: map['title'] as String,
        description: map['description'] as String,
        imagesData: List<ImageData>.from((map['imagesData'] != null
            ? (map["imagesData"] as List<dynamic>)
                .map((e) => ImageData.fromMap(e))
                .toList()
            : [])),
        widthInCm: map['widthInCm'] as int,
        heightInCm: map['heightInCm'] as int,
        isDigitalAd: map['isDigitalAd'] as bool,
        priceAfterDiscount: (map['priceAfterDiscount'] as num).toDouble(),
        priceBeforeDiscount: (map['priceBeforeDiscount'] as num).toDouble(),
        priceUnit: map['priceUnit'] as String,
        preparationDays: map['preparationDays'] as int,
        latLng: LatLng.fromJson(map['latLng'] as Object?)!,
        address: Address.fromMap(map['address']),
        bookedThisManyTimes: map['bookedThisManyTimes'] as int,
        timeOfCreation: map['timeOfCreation'],
        rating: map["rating"] != null
            ? Map<int, int>.from(map["rating"]
                ?.map((key, value) => MapEntry(int.parse(key), value)))
            : null,
        minimumRentDuration: map['minimumRentDuration'] as int,
        maximumRentDuration: map['maximumRentDuration'] != null
            ? map['maximumRentDuration'] as int
            : null,
        timeUnit: map['timeUnit'] as String,
        resolutionInPixels: map['resolutionInPixels'] as int,
        totalDurationOfRenting: map['totalDurationOfRenting'] as int,
        ratio: map['ratio'] as String,
        boardType: BoardType.fromMap(map['boardType'] as Map<String, dynamic>),
        weightedRating: map['weightedRating'] != null
            ? (map['weightedRating'] as num).toDouble()
            : null,
        numOfViews: map['numOfViews'] as int);
  }

  String toJson() => json.encode(toMap());

  factory Board.fromJson(String source) =>
      Board.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Board(id: $id, boardIdByCompany: $boardIdByCompany, ownerCompanyId: $ownerCompanyId, maxMediaUploadSizeInMb: $maxMediaUploadSizeInMb, title: $title, description: $description, imagesData: $imagesData, widthInCm: $widthInCm, heightInCm: $heightInCm, isDigitalAd: $isDigitalAd, priceAfterDiscount: $priceAfterDiscount, priceBeforeDiscount: $priceBeforeDiscount, priceUnit: $priceUnit, preparationDays: $preparationDays, latLng: $latLng, address: $address, bookedThisManyTimes: $bookedThisManyTimes, timeOfCreation: $timeOfCreation, rating: $rating, minimumRentDuration: $minimumRentDuration, maximumRentDuration: $maximumRentDuration, timeUnit: $timeUnit, resolutionInPixels: $resolutionInPixels, totalDurationOfRenting: $totalDurationOfRenting, ratio: $ratio)';
  }

  @override
  bool operator ==(covariant Board other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.boardIdByCompany == boardIdByCompany &&
        other.ownerCompanyId == ownerCompanyId &&
        other.maxMediaUploadSizeInMb == maxMediaUploadSizeInMb &&
        other.title == title &&
        other.description == description &&
        listEquals(other.imagesData, imagesData) &&
        other.widthInCm == widthInCm &&
        other.heightInCm == heightInCm &&
        other.isDigitalAd == isDigitalAd &&
        other.priceAfterDiscount == priceAfterDiscount &&
        other.priceBeforeDiscount == priceBeforeDiscount &&
        other.priceUnit == priceUnit &&
        other.preparationDays == preparationDays &&
        other.latLng == latLng &&
        other.address == address &&
        other.bookedThisManyTimes == bookedThisManyTimes &&
        other.timeOfCreation == timeOfCreation &&
        mapEquals(other.rating, rating) &&
        other.minimumRentDuration == minimumRentDuration &&
        other.maximumRentDuration == maximumRentDuration &&
        other.timeUnit == timeUnit &&
        other.resolutionInPixels == resolutionInPixels &&
        other.totalDurationOfRenting == totalDurationOfRenting &&
        other.ratio == ratio;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        boardIdByCompany.hashCode ^
        ownerCompanyId.hashCode ^
        maxMediaUploadSizeInMb.hashCode ^
        title.hashCode ^
        description.hashCode ^
        imagesData.hashCode ^
        widthInCm.hashCode ^
        heightInCm.hashCode ^
        isDigitalAd.hashCode ^
        priceAfterDiscount.hashCode ^
        priceBeforeDiscount.hashCode ^
        priceUnit.hashCode ^
        preparationDays.hashCode ^
        latLng.hashCode ^
        address.hashCode ^
        bookedThisManyTimes.hashCode ^
        timeOfCreation.hashCode ^
        rating.hashCode ^
        minimumRentDuration.hashCode ^
        maximumRentDuration.hashCode ^
        timeUnit.hashCode ^
        resolutionInPixels.hashCode ^
        totalDurationOfRenting.hashCode ^
        ratio.hashCode;
  }
}

/*
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'imagesData': imagesData?.map((x) => x.toMap()).toList(),
      'widthInCm': widthInCm,
      'heightInCm': heightInCm,
      'isDigitalAd': isDigitalAd,
      'rating': rating,
      'dailyCostInDollars': dailyCostInDollars,
      'preparationDays': preparationDays,
      'minimumDaysToSubscribe': minimumDaysToSubscribe,
      'maximumDaysToSubscribe': maximumDaysToSubscribe,
      'latLng': latLng.toJson(),
      'address': address.toMap(),
      'bookedThisManyTimes': bookedThisManyTimes,
      'boardIdByCompany': boardIdByCompany,
      'ownerCompanyId': ownerCompanyId,
      'resolutionInPixels': resolutionInPixels,
      'maxMediaUploadSizeInMb': maxMediaUploadSizeInMb,
      'timeOfCreation': timeOfCreation,
      'boardType': boardType.toMap(),
    };
  }

  factory Board.fromMap(Map<String, dynamic> map) {
    return Board(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      imagesData: List<ImageData>.from((map['imagesData'] != null
          ? (map["imagesData"] as List<dynamic>)
              .map((e) => ImageData.fromMap(e))
              .toList()
          : [])),
      widthInCm: map['widthInCm'] as int,
      heightInCm: map['heightInCm'] as int,
      isDigitalAd: map['isDigitalAd'] as bool,
      dailyCostInDollars: map['dailyCostInDollars'] as double,
      preparationDays: map['preparationDays'] as int,
      minimumDaysToSubscribe: map['minimumDaysToSubscribe'] as int,
      maximumDaysToSubscribe: map['minimumDaysToSubscribe'] as int?,
      latLng: LatLng.fromJson(map['latLng'] as Object?)!,
      address: Address.fromMap(map['address']),
      bookedThisManyTimes: map['bookedThisManyTimes'] as int,
      ownerCompanyId: map['ownerCompanyId'] as String,
      boardIdByCompany: map['boardIdByCompany'] as String,
      resolutionInPixels: map['resolutionInPixels'] as int,
      maxMediaUploadSizeInMb: map['maxMediaUploadSizeInMb'] as int?,
      timeOfCreation: map['timeOfCreation'],
      boardType: BoardType.fromMap(map['boardType'] as Map<String, dynamic>),
      rating: null,
    );
  }




 */