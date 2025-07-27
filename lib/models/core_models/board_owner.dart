import 'package:adblip_shared_lib/models/helper_models/uploaded_file_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BoardOwner {
  /* 
  * User Info Model
  * This model is used to store the user's extra information and settings
  * 1- uid: The user's ID that references the object's document in the database
  * 2- firstName: The user's first name
  * 3- lastName: The user's last name
  * 4- email: The user's contact email
  * 5- operatingCountryCode: The country code of Ads operations (e.g. Egypt, Saudi Arabia, UAE, etc.)
  * 6- languageCode: The user's preferred languageCode ()
  * 7- profilePictureData: An instance of UploadedFileData that contains the user's profile picture data
  * 8- isDeleted: Boolean flag to indicate if the board owner is deleted
  * 9- phoneNumber: The user's phone number
  * 10- joinDate: The date and time when the user joined the board
  * 11- isActive: Boolean flag to indicate if the board owner is active
  */
  final String uid;
  final String firstName;
  final String lastName;
  final String email;
  final String operatingCountryCode;
  final String languageCode;
  final String phonenumber;
  final Timestamp joinDate;
  final UploadedFileData? profilePictureData;
  final bool isDeleted;
  final bool isActive;

  // Model Constructor
  BoardOwner({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.operatingCountryCode,
    required this.languageCode,
    this.profilePictureData,
    required this.phonenumber,
    required this.joinDate,
    this.isDeleted = false,
    this.isActive = false,
  });

  // Model to Json
  Map<String, dynamic> toMap() => {
        'uid': uid,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'operatingCountryCode': operatingCountryCode,
        'languageCode': languageCode,
        'phoneNumber': phonenumber,
        'joinDate': joinDate,
        'profilePictureData': profilePictureData?.toMap(),
        'isDeleted': isDeleted,
        'isActive': isActive,
      };

  // Json to Model
  factory BoardOwner.fromMap(Map<String, dynamic> json) => BoardOwner(
        uid: json['uid'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        operatingCountryCode: json['operatingCountryCode'],
        languageCode: json['languageCode'],
        profilePictureData: json['profilePictureData'] != null
            ? UploadedFileData.fromMap(json['profilePictureData'])
            : null,
        phonenumber: json['phoneNumber'] as String,
        joinDate: json['joinDate'],
        isDeleted: json['isDeleted'] as bool,
        isActive: json['isActive'] as bool,
      );

  BoardOwner copyWith({
    String? uid,
    String? firstName,
    String? lastName,
    String? email,
    String? operatingCountryCode,
    String? languageCode,
    String? phonenumber,
    Timestamp? joinDate,
    UploadedFileData? profilePictureData,
    bool? isDeleted,
    bool? isActive,
  }) {
    return BoardOwner(
      uid: uid ?? this.uid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      operatingCountryCode: operatingCountryCode ?? this.operatingCountryCode,
      languageCode: languageCode ?? this.languageCode,
      phonenumber: phonenumber ?? this.phonenumber,
      joinDate: joinDate ?? this.joinDate,
      profilePictureData: profilePictureData ?? this.profilePictureData,
      isDeleted: isDeleted ?? this.isDeleted,
      isActive: isActive ?? this.isActive,
    );
  }
}
