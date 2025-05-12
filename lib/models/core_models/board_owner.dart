import 'package:adblip_shared_lib/models/helper_models/uploaded_file_data.dart';

class BoardOwner {
  /* 
  * User Info Model
  * This model is used to store the user's extra information and settings
  * 1- uid: The user's ID that references the object's document in the database
  * 2- firstName: The user's first name
  * 3- lastName: The user's last name
  * 4- contactMail: The user's contact email
  * 5- countryCode: The country code of Ads operations (e.g. Egypt, Saudi Arabia, UAE, etc.)
  * 6- language: The user's preferred language ()
  * 7- profilePictureData: An instance of UploadedFileData that contains the user's profile picture data
  * 8- isDeleted: Boolean flag to indicate if the board owner is deleted
  * 9- phoneNumber: The user's phone number
  * 10- joinDate: The date and time when the user joined the board
  */
  final String uid;
  final String firstName;
  final String lastName;
  final String contactMail;
  final String countryCode;
  final String language;
  final String? contactPhoneNumber;
  final DateTime? joinDate;
  final UploadedFileData profilePictureData;
  final bool isDeleted;

  // Model Constructor
  BoardOwner({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.contactMail,
    required this.countryCode,
    required this.language,
    required this.profilePictureData,
    this.contactPhoneNumber,
    this.joinDate,
    this.isDeleted = false,
  });

  // Model to Json
  Map<String, dynamic> toMap() => {
        'uid': uid,
        'firstName': firstName,
        'lastName': lastName,
        'contactMail': contactMail,
        'countryCode': countryCode,
        'language': language,
        'phoneNumber': contactPhoneNumber,
        'joinDate': joinDate.toString(),
        'profilePictureData': profilePictureData.toMap(),
        'isDeleted': isDeleted,
      };

  // Json to Model
  factory BoardOwner.fromMap(Map<String, dynamic> json) => BoardOwner(
        uid: json['uid'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        contactMail: json['contactMail'],
        countryCode: json['countryCode'],
        language: json['language'],
        profilePictureData:
            UploadedFileData.fromMap(json['profilePictureData']),
        contactPhoneNumber: json['phoneNumber'],
        joinDate:
            json['joinDate'] != null ? DateTime.parse(json['joinDate']) : null,
        isDeleted: json['isDeleted'] ?? false,
      );

  // Create a copy of the current instance with optional field modifications
  BoardOwner copyWith({
    String? uid,
    String? firstName,
    String? lastName,
    String? contactMail,
    String? countryCode,
    String? language,
    UploadedFileData? profilePictureData,
    String? phoneNumber,
    DateTime? joinDate,
    bool? isDeleted,
  }) {
    return BoardOwner(
      uid: uid ?? this.uid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      contactMail: contactMail ?? this.contactMail,
      countryCode: countryCode ?? this.countryCode,
      language: language ?? this.language,
      profilePictureData: profilePictureData ?? this.profilePictureData,
      contactPhoneNumber: phoneNumber ?? this.contactPhoneNumber,
      joinDate: joinDate ?? this.joinDate,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}
