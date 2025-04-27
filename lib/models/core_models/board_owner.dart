class BoardOwner {
  /* 
  * User Info Model
  * This model is used to store the user's extra information and settings
  * 1- uid: The user's ID that references the object's document in the database
  * 2- firstName: The user's first name
  * 3- lastName: The user's last name
  * 4- contactMail: The user's contact email
  * 5- country: The country of Ads operations (e.g. Egypt, Saudi Arabia, UAE, etc.)
  * 6- language: The user's preferred language ()
  * 7- profilePictureUrl: The user's profile picture URL
  */
  final String uid;
  final String firstName;
  final String lastName;
  final String contactMail;
  final String country;
  final String language;
  final String profilePictureUrl;

  // Model Constructor
  BoardOwner({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.contactMail,
    required this.country,
    required this.language,
    required this.profilePictureUrl,
  });

  // Model to Json
  Map<String, dynamic> toMap() => {
        'uid': uid,
        'firstName': firstName,
        'lastName': lastName,
        'contactMail': contactMail,
        'country': country,
        'language': language,
        'profilePictureUrl': profilePictureUrl,
      };

  // Json to Model
  factory BoardOwner.fromMap(Map<String, dynamic> json) => BoardOwner(
        uid: json['uid'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        contactMail: json['contactMail'],
        country: json['country'],
        language: json['language'],
        profilePictureUrl: json['profilePictureUrl'],
      );
}
