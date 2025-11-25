# adblip_shared_lib – Shared Library Technical Documentation

## 1. Project Overview & Purpose

**`adblip_shared_lib`** is a pure Dart package that serves as the single source of truth for all shared logic, data models, constants, and utilities used across the entire AdBlip ecosystem. This library is imported by four dependent projects:

- **Mobile App** (Flutter mobile application for clients and board owners)
- **Media Owner Portal** (Web/Flutter application for board owners to manage their listings)
- **Admin Dashboard** (Administrative interface for managing the platform)
- **Landing Page** (Public-facing website)

### Why This Package Exists

The AdBlip platform is a billboard/advertising board rental marketplace where:
- Companies can search and book advertising boards for their campaigns
- Board owners can list their physical and digital advertising spaces
- The platform manages bookings, payments, ratings, and location-based searches

By centralizing all shared code in this library, we ensure:
- **Consistency**: All four apps use identical data models and business logic
- **Maintainability**: Changes to models or constants happen in one place
- **Type Safety**: Shared enums and constants prevent magic strings across projects
- **Reduced Duplication**: No need to copy-paste model classes or constants

### Single-Source-of-Truth Philosophy

When you need to:
- Add a new field to the `Board` model → Update it here, all apps get it
- Change a Firestore collection name → Update `FirestoreCollectionNames`, all apps reflect it
- Add a new country code → Update `CountryCodesConstants`, all apps can use it
- Modify booking state logic → Update `BookingState` enum, all apps stay in sync

**Important**: This library does NOT contain any platform-specific code (no Flutter widgets, no web-specific code). It's pure Dart, making it compatible with any Dart/Flutter project.

---

## 2. High-Level Architecture

The shared library provides a layered architecture that dependent projects import:

```
┌─────────────────────────────────────────────────────────────┐
│                    Dependent Projects                        │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐  │
│  │  Mobile  │  │  Portal  │  │  Admin   │  │ Landing  │  │
│  │   App    │  │          │  │ Dashboard│  │   Page   │  │
│  └────┬─────┘  └────┬─────┘  └────┬─────┘  └────┬─────┘  │
└───────┼─────────────┼─────────────┼─────────────┼────────┘
        │             │             │             │
        └─────────────┴─────────────┴─────────────┘
                      │
                      ▼
        ┌─────────────────────────────┐
        │   adblip_shared_lib          │
        │   (Pure Dart Package)        │
        ├─────────────────────────────┤
        │                             │
        │  ┌───────────────────────┐  │
        │  │  Data Models Layer    │  │
        │  │  - Board, Booking     │  │
        │  │  - AppUser, BoardOwner│  │
        │  │  - Address, FAQ, etc. │  │
        │  └───────────────────────┘  │
        │                             │
        │  ┌───────────────────────┐  │
        │  │  Constants Layer      │  │
        │  │  - Firestore Collections│ │
        │  │  - Country/Currency   │  │
        │  │  - Language Codes     │  │
        │  │  - Sorting Types      │  │
        │  └───────────────────────┘  │
        │                             │
        │  ┌───────────────────────┐  │
        │  │  Utilities Layer      │  │
        │  │  - LatLngMapper       │  │
        │  │  - Model Helpers      │  │
        │  └───────────────────────┘  │
        └─────────────────────────────┘
```

### Layer Breakdown

1. **Data Models Layer**: All domain entities (Board, Booking, User, etc.) with serialization
2. **Constants Layer**: Enums and static constants for collections, codes, and types
3. **Utilities Layer**: Helper classes and mappers for common operations
4. **Endpoints Layer**: Firestore collection name constants

**Note**: Currently, the library does NOT include:
- Extensions (String, DateTime, etc.) - these may be added in the future
- Shared Widgets - these remain in each app
- Failure classes - error handling is app-specific
- Theming constants - styling is app-specific

---

## 3. Tech Stack & Exact Versions

### Core Environment

```yaml
Dart SDK: ^3.5.0
```

### Production Dependencies

```yaml
cloud_firestore: ^5.6.5      # Firebase Firestore for data persistence
google_maps_flutter: ^2.9.0   # Google Maps integration for location features
geoflutterfire_plus: ^0.0.32 # Geospatial queries for location-based board searches
```

### Development Dependencies

```yaml
lints: ^4.0.0    # Dart linting rules (recommended set)
test: ^1.24.0    # Unit testing framework
```

### Why These Versions?

- **`cloud_firestore: ^5.6.5`**: Latest stable version with Firestore 3.x API support, required for `Timestamp` and `GeoPoint` types used in models
- **`google_maps_flutter: ^2.9.0`**: Provides `LatLng` type used in `LatLngMapper` utility
- **`geoflutterfire_plus: ^0.0.32`**: Provides `GeoFirePoint` for geospatial queries on board locations
- **`lints: ^4.0.0`**: Standard Dart linting rules for code quality

### Serialization Approach

**Important**: This library uses **manual serialization** (not code generation). Models implement:
- `toMap()` / `fromMap()` for Firestore/document conversion
- `toJson()` / `fromJson()` for JSON string conversion
- Manual `copyWith()` methods
- Manual `==` and `hashCode` overrides

**No code generation tools are used** (no `freezed`, `json_serializable`, or `build_runner`).

---

## 4. Project Structure – Folder-by-Folder Explanation

```
adblip_shared_lib/
├── lib/
│   ├── adblip_shared_lib.dart          # Main library export file
│   ├── src/
│   │   └── adblip_shared_lib_base.dart # Base file (currently placeholder)
│   ├── models/
│   │   ├── core_models/                # Main domain entities
│   │   │   ├── address.dart
│   │   │   ├── app_user.dart
│   │   │   ├── board.dart
│   │   │   ├── board_in_action_model.dart
│   │   │   ├── board_owner.dart
│   │   │   ├── booking.dart
│   │   │   ├── faq.dart
│   │   │   ├── feedback.dart
│   │   │   ├── my_app_notification.dart
│   │   │   └── searched_place.dart
│   │   ├── helper_models/               # Supporting data structures
│   │   │   └── uploaded_file_data.dart
│   │   ├── consts/                     # Enums and constants
│   │   │   ├── country_codes.dart
│   │   │   ├── currency_codes.dart
│   │   │   ├── language_codes.dart
│   │   │   └── sorting_type.dart
│   │   └── model_helper_utils/         # Model-related utilities
│   │       └── latling_mapper.dart
│   └── end_points/                     # API/Service constants
│       └── firebase_collections_names.dart
├── test/
│   └── adblip_shared_lib_test.dart     # Unit tests (currently placeholder)
├── example/
│   └── adblip_shared_lib_example.dart  # Usage examples
├── pubspec.yaml                        # Package dependencies
├── analysis_options.yaml               # Linting configuration
├── CHANGELOG.md                        # Version history
└── README.md                           # Package documentation
```

### Directory Details

#### `lib/models/core_models/`
Contains all primary domain models representing business entities:
- **`board.dart`**: Advertising board/billboard listing with location, pricing, specs
- **`booking.dart`**: Booking/reservation record with state, dates, payment info
- **`app_user.dart`**: Company/client user profile with business documents
- **`board_owner.dart`**: Board owner profile and settings
- **`address.dart`**: Structured address with multiple administrative levels
- **`faq.dart`**: Frequently asked questions (bilingual)
- **`feedback.dart`**: User feedback/ratings for boards
- **`my_app_notification.dart`**: In-app notification model
- **`searched_place.dart`**: Tracks popular search locations
- **`board_in_action_model.dart`**: Currently displayed ads on boards

#### `lib/models/helper_models/`
Supporting models used by core models:
- **`uploaded_file_data.dart`**: Represents uploaded files with path and URL

#### `lib/models/consts/`
Enums and constant definitions:
- **`country_codes.dart`**: ISO 3166-1 alpha-2 country codes (EG, SA, AE, KW)
- **`currency_codes.dart`**: ISO 4217 currency codes with bilingual names
- **`language_codes.dart`**: ISO 639-1 language codes (ar, en)
- **`sorting_type.dart`**: Sorting enums (price, rating) with FormatType and SizeType

#### `lib/models/model_helper_utils/`
Utility classes for model operations:
- **`latling_mapper.dart`**: Converts between various LatLng formats (Map, List, Google Maps LatLng)

#### `lib/end_points/`
Service endpoint and collection name constants:
- **`firebase_collections_names.dart`**: Centralized Firestore collection names

#### `lib/src/`
Currently contains placeholder code. This is where the main library exports should be organized.

**⚠️ Current Issue**: The main `adblip_shared_lib.dart` file only exports `src/adblip_shared_lib_base.dart`, which contains placeholder code. The actual models and constants are NOT currently exported. This needs to be fixed for dependent projects to use the library.

---

## 5. Publishing & Versioning

### Current Publishing Method

Based on the project structure, this library is likely used via **path dependency** in a monorepo setup. Dependent projects reference it like:

```yaml
dependencies:
  adblip_shared_lib:
    path: ../adblip_shared_lib
```

### Alternative Publishing Methods

If published to a private repository:

```yaml
dependencies:
  adblip_shared_lib:
    git:
      url: https://github.com/your-org/adblip_shared_lib.git
      ref: master  # or specific tag/commit
```

Or if using a private pub server (Verdaccio, etc.):

```yaml
dependencies:
  adblip_shared_lib: ^1.0.0
```

### Version Management

- **Current Version**: `1.0.0` (as per `pubspec.yaml`)
- **Version Format**: Semantic versioning (MAJOR.MINOR.PATCH)
- **Version Bump Policy**: See Section 18 for breaking changes policy

### How Dependent Projects Reference It

After adding the dependency, projects import like:

```dart
import 'package:adblip_shared_lib/models/core_models/board.dart';
import 'package:adblip_shared_lib/models/consts/country_codes.dart';
import 'package:adblip_shared_lib/end_points/firebase_collections_names.dart';
```

**Note**: Once the export structure is fixed (see Section 4), imports may be simplified to:

```dart
import 'package:adblip_shared_lib/adblip_shared_lib.dart';
```

---

## 6. How to Add or Update the Shared Library

### Step-by-Step Workflow

#### Adding a New Model

1. **Create the model file** in `lib/models/core_models/` or `lib/models/helper_models/`
2. **Implement serialization**:
   ```dart
   class MyModel {
     // Fields
     Map<String, dynamic> toMap() { /* ... */ }
     factory MyModel.fromMap(Map<String, dynamic> map) { /* ... */ }
     String toJson() => json.encode(toMap());
     factory MyModel.fromJson(String source) => MyModel.fromMap(json.decode(source));
     MyModel copyWith({ /* ... */ }) { /* ... */ }
     @override bool operator ==(covariant MyModel other) { /* ... */ }
     @override int get hashCode { /* ... */ }
   }
   ```
3. **Export it** in `lib/adblip_shared_lib.dart` (once export structure is fixed)
4. **Bump version** in `pubspec.yaml` (patch for additions, minor for new features)
5. **Commit and push**:
   ```bash
   git add .
   git commit -m "feat: add MyModel to shared library"
   git push
   ```
6. **Update dependent projects**:
   ```bash
   cd ../mobile_app  # or other project
   flutter pub get
   ```

#### Updating an Existing Model

1. **Modify the model file** (add/remove/change fields)
2. **Update `toMap()` and `fromMap()`** to handle new/removed fields
3. **Update `copyWith()`** if needed
4. **Update `==` and `hashCode`** if fields changed
5. **Bump version**:
   - **PATCH** (1.0.0 → 1.0.1): Adding optional fields, bug fixes
   - **MINOR** (1.0.0 → 1.1.0): Adding required fields with defaults, new methods
   - **MAJOR** (1.0.0 → 2.0.0): Removing fields, changing field types, breaking changes
6. **Update CHANGELOG.md** with changes
7. **Commit, push, and update dependent projects**

#### Adding a New Constant/Enum

1. **Create or update** the constant file in `lib/models/consts/`
2. **Bump version** (usually PATCH for new enum values, MINOR for new enums)
3. **Commit, push, update dependent projects**

### Example: Adding a Field to Board Model

```dart
// lib/models/core_models/board.dart

class Board {
  // ... existing fields ...
  String? newOptionalField;  // NEW FIELD

  Board({
    // ... existing parameters ...
    this.newOptionalField,  // Add to constructor
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // ... existing fields ...
      'newOptionalField': newOptionalField,  // ADD THIS
    };
  }

  factory Board.fromMap(Map<String, dynamic> map) {
    return Board(
      // ... existing fields ...
      newOptionalField: map['newOptionalField'] as String?,  // ADD THIS
    );
  }

  Board copyWith({
    // ... existing parameters ...
    String? newOptionalField,  // ADD THIS
  }) {
    return Board(
      // ... existing fields ...
      newOptionalField: newOptionalField ?? this.newOptionalField,  // ADD THIS
    );
  }
}
```

Then:
1. Update `pubspec.yaml`: `version: 1.0.1` (PATCH bump for optional field)
2. Update `CHANGELOG.md`
3. Commit and push
4. Run `flutter pub get` in dependent projects

---

## 7. Key Packages & Why They Were Chosen

### `cloud_firestore: ^5.6.5`

**Why**: Core dependency for Firestore integration. Models use:
- `Timestamp` for date/time fields (e.g., `Booking.startDate`, `Board.timeOfCreation`)
- `GeoPoint` indirectly through `geoflutterfire_plus` for location data
- Firestore document conversion via `toMap()` / `fromMap()`

**Usage Example**:
```dart
// In Board model
Timestamp timeOfCreation;
// In Booking model
Timestamp startDate;
Timestamp endDate;
```

### `google_maps_flutter: ^2.9.0`

**Why**: Provides `LatLng` type used in `LatLngMapper` utility for converting between different coordinate formats. Also used by dependent apps for map displays.

**Usage Example**:
```dart
// In LatLngMapper
import 'package:google_maps_flutter/google_maps_flutter.dart';

static LatLng fromMap(dynamic value) {
  // Converts Map/List to LatLng
}
```

### `geoflutterfire_plus: ^0.0.32`

**Why**: Enables geospatial queries on board locations. The `Board` model includes `GeoFirePoint` for location-based searches (e.g., "find boards within 5km of this location").

**Usage Example**:
```dart
// In Board model
GeoFirePoint geoFirePoint;

// In toMap()
'geoFirePoint': geoFirePoint.data,
```

### Manual Serialization (No `freezed` or `json_serializable`)

**Why Manual Approach?**
- **Simplicity**: No build_runner setup, no generated files to manage
- **Control**: Full control over serialization logic, especially for Firestore `Timestamp` and nested models
- **Flexibility**: Easy to handle nullable fields, custom conversions, and Firestore-specific types
- **Learning Curve**: Junior developers can understand and modify serialization without learning code generation

**Trade-offs**:
- More boilerplate code (manual `toMap`, `fromMap`, `copyWith`, `==`, `hashCode`)
- Risk of forgetting to update serialization when fields change
- No compile-time safety for missing fields (runtime errors instead)

**Future Consideration**: If the codebase grows significantly, consider migrating to `freezed` for:
- Automatic `copyWith`, `==`, `hashCode`
- Immutability guarantees
- Union types for state management
- Reduced boilerplate

---

## 8. Data Models

All models follow a consistent pattern:
- Manual `toMap()` / `fromMap()` for Firestore/document conversion
- `toJson()` / `fromJson()` for JSON string conversion
- `copyWith()` for immutable updates
- `==` and `hashCode` for value equality
- `toString()` for debugging

### Core Models

#### `Board` (`lib/models/core_models/board.dart`)

Represents an advertising board/billboard listing.

**Key Fields**:
```dart
String id;
String customId;
String boardOwnerId;
String countryCode;  // ISO 3166-1 alpha-2
bool isAvailable;
String title;
String description;
int widthInCm;
int heightInCm;
bool isDigitalAd;
double dailyPriceAfterDiscount;
double dailyPriceBeforeDiscount;
String priceUnit;
FormatType formatType;  // staticImage, video, videoOrImage
SizeType sizeType;      // bulletIn, triFaced, posters, etc.
double latitude;
double longitude;
Address address;
GeoFirePoint geoFirePoint;
Timestamp timeOfCreation;
Map<int, int>? rating;  // Rating distribution (1-5 stars)
double? weightedRating;
int minimumRentDurationInDays;
int? maximumRentDurationInDays;
int bookedThisManyTimes;
int numOfViews;
```

**JSON Example**:
```json
{
  "id": "board_123",
  "customId": "BD-2024-001",
  "boardOwnerId": "owner_456",
  "countryCode": "EG",
  "isAvailable": true,
  "title": "Premium Billboard - Tahrir Square",
  "description": "High-traffic location in downtown Cairo",
  "widthInCm": 600,
  "heightInCm": 300,
  "isDigitalAd": false,
  "dailyPriceAfterDiscount": 500.0,
  "dailyPriceBeforeDiscount": 600.0,
  "priceUnit": "EGP",
  "formatType": "staticImage",
  "sizeType": "bulletIn",
  "latitude": 30.0444,
  "longitude": 31.2357,
  "address": { /* Address object */ },
  "geoFirePoint": { /* GeoFirePoint data */ },
  "timeOfCreation": { "seconds": 1704067200, "nanoseconds": 0 },
  "rating": { "5": 10, "4": 5, "3": 2 },
  "weightedRating": 4.5,
  "minimumRentDurationInDays": 7,
  "maximumRentDurationInDays": 30,
  "bookedThisManyTimes": 15,
  "numOfViews": 250
}
```

#### `Booking` (`lib/models/core_models/booking.dart`)

Represents a booking/reservation for an advertising board.

**Key Fields**:
```dart
String id;
String boardId;
String boardOwnerId;
String clientId;
BookingState bookingState;  // pending, approved, rejected, canceled
Timestamp startDate;
Timestamp endDate;
double totalPrice;
bool hasPaid;
String currency;
UploadedFileData adData;  // The ad media to display
bool isUnAvailablePeriod;
String? reasonForUnAvailablePeriod;
```

**JSON Example**:
```json
{
  "id": "booking_789",
  "boardId": "board_123",
  "boardOwnerId": "owner_456",
  "clientId": "user_999",
  "bookingState": "approved",
  "startDate": { "seconds": 1704153600, "nanoseconds": 0 },
  "endDate": { "seconds": 1704240000, "nanoseconds": 0 },
  "totalPrice": 3500.0,
  "hasPaid": true,
  "currency": "EGP",
  "adData": {
    "path": "ads/booking_789/ad.jpg",
    "url": "https://storage.googleapis.com/..."
  },
  "isUnAvailablePeriod": false
}
```

#### `AppUser` (`lib/models/core_models/app_user.dart`)

Represents a company/client user profile.

**Key Fields**:
```dart
String id;
String companyName;
String companyEmail;
String companyBaseCountryCode;
String companyPhoneNumber;
String companyOperatingCountry;
DateTime joinDate;
UploadedFileData? representativeNationalID;
UploadedFileData? companyBusinessActivityLicenseImageLink;
UploadedFileData? companyCommercialRegisterImageLink;
UploadedFileData? logoImageLink;
List<String> favouriteBoardsIds;
List<String> recentSearchedPlaceIds;
String? fcmToken;
bool isDeleted;
```

**JSON Example**:
```json
{
  "id": "user_999",
  "companyName": "Acme Advertising Co.",
  "companyEmail": "contact@acme.com",
  "companyBaseCountryCode": "EG",
  "companyPhoneNumber": "+201234567890",
  "companyOperatingCountry": "Egypt",
  "joinDate": 1700000000000,
  "representativeNationalID": {
    "path": "users/user_999/national_id.pdf",
    "url": "https://storage.googleapis.com/..."
  },
  "favouriteBoardsIds": ["board_123", "board_456"],
  "recentSearchedPlaceIds": ["place_1", "place_2"],
  "fcmToken": "fcm_token_here",
  "isDeleted": false
}
```

#### `BoardOwner` (`lib/models/core_models/board_owner.dart`)

Represents a board owner's profile.

**Key Fields**:
```dart
String uid;
String firstName;
String lastName;
String email;
String operatingCountryCode;
String languageCode;
String phonenumber;
Timestamp joinDate;
UploadedFileData? profilePictureData;
bool isDeleted;
bool isActive;
```

#### `Address` (`lib/models/core_models/address.dart`)

Structured address with multiple administrative levels.

**Key Fields**:
```dart
String? street;
String? locality;
String? country;
String? neighborhood;
String? buildingNumber;
String? postalCode;
String? administrativeAreaLevel1;  // State/Province
String? administrativeAreaLevel2;  // County/District
String? administrativeAreaLevel3;  // Sub-district
String? formattedAddress;
```

**Helper Methods**:
- `toStringNarrowToWide()`: Building → Street → Neighborhood → ... → Country
- `toStringWideToNarrow()`: Country → ... → Building
- `Address.empty()`: Factory for empty address

#### `FAQ` (`lib/models/core_models/faq.dart`)

Frequently asked questions with bilingual support.

**Key Fields**:
```dart
String id;
String questionTextInEnglish;
String answerTextInEnglish;
String questionTextInArabic;
String answerTextInArabic;
int order;
```

#### `BillboardFeedback` (`lib/models/core_models/feedback.dart`)

User feedback/ratings for boards.

**Key Fields**:
```dart
String id;
String userId;
String userName;
String userProfileImageUrl;
double rating;  // 1.0 to 5.0
String billboardId;
DateTime createdAt;
String? comment;
```

#### `MyAppNotification` (`lib/models/core_models/my_app_notification.dart`)

In-app notification model.

**Key Fields**:
```dart
String id;
String title;
String body;
String imageUrl;
Timestamp creationTime;
bool isRead;
```

#### `SearchedPlace` (`lib/models/core_models/searched_place.dart`)

Tracks popular search locations.

**Key Fields**:
```dart
String placeId;
int numberOfSearches;
String countryNameInEnglish;
```

#### `BoardInActionModel` (`lib/models/core_models/board_in_action_model.dart`)

Represents currently displayed ads on boards.

**Key Fields**:
```dart
String id;
String mediaUrl;
String boardId;
```

### Helper Models

#### `UploadedFileData` (`lib/models/helper_models/uploaded_file_data.dart`)

Represents an uploaded file with storage path and public URL.

**Key Fields**:
```dart
String path;  // Storage path
String url;   // Public URL
```

**Usage**: Used in `AppUser` for document images, `Board` for board images, `Booking` for ad media.

---

## 9. Enums & Constants

### Enums

#### `SortingType` (`lib/models/consts/sorting_type.dart`)

Sorting options for board listings with bilingual support.

**Values**:
- `sortedByPriceLowToHigh`
- `sortedByPriceHighToLow`
- `sortedByRateHighToLow`
- `sortedByRateLowToHigh`

**Methods**:
- `toJson()`: Returns enum name as string
- `arabic`: Returns Arabic display name
- `english`: Returns English display name
- `fromJson(String)`: Converts string to enum

**Usage Example**:
```dart
SortingType type = SortingType.sortedByPriceLowToHigh;
print(type.english);  // "Sorted by Price: Low to High"
print(type.arabic);    // "الترتيب حسب السعر: من الأقل إلى الأعلى"
```

#### `FormatType` (`lib/models/consts/sorting_type.dart`)

Board ad format types.

**Values**:
- `staticImage`
- `video`
- `videoOrImage`

**Methods**: Same as `SortingType` (toJson, arabic, english, fromJson)

#### `SizeType` (`lib/models/consts/sorting_type.dart`)

Board size categories.

**Values**:
- `bulletIn` (لوحة إعلانية)
- `triFaced` (ثلاثي الوجوه)
- `posters` (ملصقات)
- `juniorPosters` (ملصقات صغيرة)
- `spectaclulars` (لوحات ضخمة)
- `wallScapes` (لوحات جدارية)

**Methods**: Same as `SortingType`

#### `BookingState` (`lib/models/core_models/booking.dart`)

Booking status enum.

**Values**:
- `pending`
- `approved`
- `rejected`
- `canceled`

**Methods**: `toJson()`, `fromJson(String)`

### Constants

#### `CountryCodesConstants` (`lib/models/consts/country_codes.dart`)

ISO 3166-1 alpha-2 country codes.

**Values**:
- `egypt("EG")`
- `saudiArabia("SA")`
- `uae("AE")`
- `kuwait("KW")`

**Methods**:
- `code`: Get ISO code
- `toName`: Get English country name
- `codeToCountryName(String)`: Static method to convert code to name
- `allCodes`: List of all supported codes

**Usage Example**:
```dart
CountryCodesConstants country = CountryCodesConstants.egypt;
print(country.code);  // "EG"
print(country.toName); // "Egypt"

String? name = CountryCodesConstants.codeToCountryName("SA");
// Returns "Saudi Arabia"
```

#### `CurrencyCodesConstants` (`lib/models/consts/currency_codes.dart`)

ISO 4217 currency codes with bilingual names.

**Values**:
- `egypt("EGP", "EG", "Egyptian Pound", "الجنيه المصري")`
- `saudiArabia("SAR", "SA", "Saudi Riyal", "الريال السعودي")`
- `uae("AED", "AE", "UAE Dirham", "درهم الإمارات")`
- `kuwait("KWD", "KW", "Kuwaiti Dinar", "دينار كويتي")`

**Methods**:
- `currencyCode`: ISO 4217 code
- `countryCode`: ISO 3166-1 alpha-2 code
- `englishName`: English currency name
- `arabicName`: Arabic currency name
- `codeToCurrencyName(String)`: Static converter
- `codeToArabicName(String)`: Static converter
- `fromCode(String)`: Get enum from currency code
- `fromCountryCode(String)`: Get enum from country code

#### `LanguageCodesConstants` (`lib/models/consts/language_codes.dart`)

ISO 639-1 language codes.

**Values**:
- `arabic("ar")`
- `english("en")`

**Methods**:
- `code`: Get ISO code
- `toName`: Get language name
- `codeToLanguageName(String)`: Static converter

### Firestore Collection Names

#### `FirestoreCollectionNames` (`lib/end_points/firebase_collections_names.dart`)

Centralized Firestore collection name constants.

**Collections**:
```dart
static const String usersCollection = "users";
static const String boardOwnersCollection = "board_owners";
static const String boardsCollecion = "boards";
static const String companiesCollecion = "companies";
static const String bookingsCollection = "bookings";
static const String boardsInActionCollection = "boardsInAction";
static const String boardsLocationsCollecion = "boards_locations";
static const String searchedPlacesCollection = "searched_places";
static const String faqCollection = "faqs";
static const String notificationsCollection = "notifications";
static const String feedbackCollection = "feedbacks";
static const String adminsCollection = "admins";
```

**Usage Example**:
```dart
FirebaseFirestore.instance
  .collection(FirestoreCollectionNames.boardsCollecion)
  .doc(boardId)
  .get();
```

**⚠️ Note**: There are typos in some collection names (`boardsCollecion`, `companiesCollecion`, `boardsLocationsCollecion` - should be "Collection"). Consider fixing these in a future version, but be aware it's a breaking change if Firestore collections are already named this way.

---

## 10. Extensions

**Current Status**: No extensions are currently defined in the shared library.

**Future Consideration**: Common extensions that could be added:
- `StringExtensions`: Validation, formatting, localization helpers
- `DateTimeExtensions`: Firestore Timestamp conversion, formatting
- `ContextExtensions`: If Flutter widgets are added, theme/MediaQuery helpers
- `NumExtensions`: Currency formatting, percentage formatting

If extensions are added in the future, they should be placed in `lib/extensions/` and exported from the main library file.

---

## 11. Utilities & Helpers

### `LatLngMapper` (`lib/models/model_helper_utils/latling_mapper.dart`)

Utility class for converting between different `LatLng` coordinate formats.

**Methods**:

#### `toDouble(dynamic value)`
Converts various types to `double` for latitude/longitude.

```dart
static double toDouble(dynamic value) {
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0.0;
  throw FormatException('Invalid type for latitude/longitude: $value');
}
```

**Usage**: Handles Firestore data that may return coordinates as `int`, `double`, or `String`.

#### `fromMap(dynamic value)`
Converts a Map or List to `LatLng` (Google Maps type).

```dart
static LatLng fromMap(dynamic value) {
  if (value is Map<String, dynamic>) {
    return LatLng(
      toDouble(value['latitude']),
      toDouble(value['longitude']),
    );
  } else if (value is List<dynamic>) {
    if (value.length != 2) {
      throw FormatException('Expected [lat, lng], got $value');
    }
    return LatLng(
      toDouble(value[0]),
      toDouble(value[1]),
    );
  }
  throw FormatException('Expected Map or List, got ${value.runtimeType}');
}
```

**Supported Formats**:
- `Map<String, dynamic>`: `{"latitude": 30.0444, "longitude": 31.2357}`
- `List<dynamic>`: `[30.0444, 31.2357]`

#### `toMap(LatLng latLng)`
Converts `LatLng` to a Map.

```dart
static Map<String, dynamic> toMap(LatLng latLng) {
  return {
    'latitude': latLng.latitude,
    'longitude': latLng.longitude,
  };
}
```

**Usage Example**:
```dart
// From Firestore document
dynamic coordinates = doc.data()['location'];
LatLng location = LatLngMapper.fromMap(coordinates);

// To Firestore
Map<String, dynamic> locationMap = LatLngMapper.toMap(location);
```

---

## 12. Shared Widgets (if any)

**Current Status**: No shared widgets are included in this library.

**Rationale**: This is a pure Dart package with no Flutter dependencies (except for `google_maps_flutter` which is only used for the `LatLng` type, not widgets). Widgets remain in each app to allow platform-specific customization.

**Future Consideration**: If shared widgets are needed, consider:
- Creating a separate `adblip_shared_widgets` package
- Or adding Flutter as a dependency and placing widgets in `lib/widgets/`

---

## 13. Failure & Error Handling

**Current Status**: No failure classes or error handling utilities are defined in the shared library.

**Rationale**: Error handling strategies vary by app (some use `dartz`, some use `fpdart`, some use custom classes). The shared library focuses on data models and constants, not error handling patterns.

**If Needed in Future**: Consider adding a `lib/failures/` directory with:
- `Failure` base class
- `ServerFailure`, `NetworkFailure`, `ValidationFailure`, etc.
- Or use a package like `dartz` or `fpdart` for functional error handling

---

## 14. Serialization & Firestore Converters

### Serialization Pattern

All models use **manual serialization** with two conversion methods:

1. **`toMap()` / `fromMap()`**: For Firestore document conversion
2. **`toJson()` / `fromJson()`**: For JSON string conversion (uses `toMap()` internally)

### Firestore Integration

#### Converting Models to Firestore Documents

```dart
// Save a Board to Firestore
Board board = Board(/* ... */);
Map<String, dynamic> boardData = board.toMap();

await FirebaseFirestore.instance
  .collection(FirestoreCollectionNames.boardsCollecion)
  .doc(board.id)
  .set(boardData);
```

#### Reading Models from Firestore

```dart
// Read a Board from Firestore
DocumentSnapshot doc = await FirebaseFirestore.instance
  .collection(FirestoreCollectionNames.boardsCollecion)
  .doc(boardId)
  .get();

if (doc.exists) {
  Board board = Board.fromMap(doc.data() as Map<String, dynamic>);
}
```

### Special Type Handling

#### Firestore Timestamp

Models use `Timestamp` from `cloud_firestore` for date/time fields:

```dart
// In Booking model
Timestamp startDate;
Timestamp endDate;

// In toMap() - Timestamp is serialized directly
'startDate': startDate,
'endDate': endDate,

// In fromMap() - Cast directly
startDate: (map['startDate'] as Timestamp),
endDate: (map['endDate'] as Timestamp),
```

**Note**: Firestore `Timestamp` objects are automatically serialized by Firestore SDK. When converting to JSON strings, you may need to convert `Timestamp` to milliseconds or ISO string.

#### DateTime Conversion

Some models use `DateTime` (e.g., `AppUser.joinDate`):

```dart
// In AppUser model
DateTime joinDate;

// In toMap() - Convert to milliseconds
'joinDate': joinDate.millisecondsSinceEpoch,

// In fromMap() - Convert from milliseconds
joinDate: DateTime.fromMillisecondsSinceEpoch(map['joinDate'] as int),
```

#### GeoFirePoint

The `Board` model uses `GeoFirePoint` from `geoflutterfire_plus`:

```dart
// In Board model
GeoFirePoint geoFirePoint;

// In toMap() - Use .data property
'geoFirePoint': geoFirePoint.data,

// In fromMap() - Reconstruct from lat/lng
geoFirePoint: GeoFirePoint(GeoPoint(
  (map['latitude'] as num).toDouble(),
  (map['longitude'] as num).toDouble()
)),
```

#### Nested Models

Nested models are serialized recursively:

```dart
// In Board model
Address address;
List<UploadedFileData>? imagesData;

// In toMap()
'address': address.toMap(),
'imagesData': imagesData?.map((x) => x.toMap()).toList(),

// In fromMap()
address: Address.fromMap(map['address']),
imagesData: List<UploadedFileData>.from(
  (map['imagesData'] as List<dynamic>?)
    ?.map((e) => UploadedFileData.fromMap(e)) ?? []
),
```

#### Enum Serialization

Enums are serialized as strings:

```dart
// In Booking model
BookingState bookingState;

// In toMap()
'bookingState': bookingState.toJson(),  // Returns "pending", "approved", etc.

// In fromMap()
bookingState: BookingState.fromJson(map['bookingState'] as String),
```

### JSON String Conversion

For API calls or local storage, use `toJson()` / `fromJson()`:

```dart
// Convert to JSON string
Board board = Board(/* ... */);
String jsonString = board.toJson();

// Parse from JSON string
Board board = Board.fromJson(jsonString);
```

**Note**: `toJson()` uses `json.encode(toMap())`, so all Firestore-specific types (like `Timestamp`) will be serialized as their underlying representation. For API compatibility, you may need custom serialization logic.

---

## 15. Theming & Styling Constants

**Current Status**: No theming or styling constants are included in the shared library.

**Rationale**: Each app (Mobile, Portal, Admin, Landing Page) has its own design system and theme. Colors, text styles, and spacing are app-specific.

**Future Consideration**: If a shared design system is needed, consider:
- Adding a `lib/theme/` directory with:
  - `app_colors.dart`: Brand colors, semantic colors
  - `app_text_styles.dart`: Typography scale
  - `app_spacing.dart`: Spacing constants
  - `app_theme.dart`: Theme data (if Flutter widgets are added)
- Or creating a separate `adblip_design_system` package

---

## 16. Testing

### Current Test Setup

**Location**: `test/adblip_shared_lib_test.dart`

**Current Status**: Placeholder test file with example test.

**Test Framework**: `test: ^1.24.0` (Dart's standard testing package)

### Running Tests

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/adblip_shared_lib_test.dart
```

### Recommended Test Structure

For a shared library, you should test:

1. **Model Serialization**:
   ```dart
   test('Board toMap and fromMap are inverse operations', () {
     Board board = Board(/* ... */);
     Map<String, dynamic> map = board.toMap();
     Board reconstructed = Board.fromMap(map);
     expect(reconstructed, equals(board));
   });
   ```

2. **Enum Conversions**:
   ```dart
   test('SortingType toJson and fromJson are inverse', () {
     SortingType type = SortingType.sortedByPriceLowToHigh;
     String json = type.toJson();
     SortingType reconstructed = SortingType.fromJson(json);
     expect(reconstructed, equals(type));
   });
   ```

3. **Utility Functions**:
   ```dart
   test('LatLngMapper converts Map to LatLng correctly', () {
     Map<String, dynamic> map = {'latitude': 30.0, 'longitude': 31.0};
     LatLng latLng = LatLngMapper.fromMap(map);
     expect(latLng.latitude, equals(30.0));
     expect(latLng.longitude, equals(31.0));
   });
   ```

4. **Constants**:
   ```dart
   test('CountryCodesConstants codeToCountryName works', () {
     String? name = CountryCodesConstants.codeToCountryName("EG");
     expect(name, equals("Egypt"));
   });
   ```

### Test Coverage Goals

- **Models**: 80%+ coverage for serialization methods
- **Enums**: 100% coverage for conversion methods
- **Utilities**: 100% coverage for helper functions
- **Constants**: Test all static methods

---

## 17. Code Generation

**Current Status**: **No code generation is used** in this library.

All serialization, `copyWith`, `==`, and `hashCode` are implemented manually.

### If Migrating to Code Generation

If you decide to use `freezed` or `json_serializable` in the future:

#### Using `freezed`

1. **Add dependencies**:
   ```yaml
   dependencies:
     freezed_annotation: ^2.4.1
   dev_dependencies:
     build_runner: ^2.4.7
     freezed: ^2.4.6
   ```

2. **Update model**:
   ```dart
   import 'package:freezed_annotation/freezed_annotation.dart';
   
   part 'board.freezed.dart';
   part 'board.g.dart';
   
   @freezed
   class Board with _$Board {
     const factory Board({
       required String id,
       required String title,
       // ... other fields
     }) = _Board;
     
     factory Board.fromJson(Map<String, dynamic> json) =>
       _$BoardFromJson(json);
   }
   ```

3. **Run code generation**:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

#### Using `json_serializable`

1. **Add dependencies**:
   ```yaml
   dependencies:
     json_annotation: ^4.8.1
   dev_dependencies:
     build_runner: ^2.4.7
     json_serializable: ^6.7.1
   ```

2. **Update model**:
   ```dart
   import 'package:json_annotation/json_annotation.dart';
   
   part 'board.g.dart';
   
   @JsonSerializable()
   class Board {
     final String id;
     final String title;
     
     Board({required this.id, required this.title});
     
     factory Board.fromJson(Map<String, dynamic> json) =>
       _$BoardFromJson(json);
     
     Map<String, dynamic> toJson() => _$BoardToJson(this);
   }
   ```

3. **Run code generation**: Same as above.

**Note**: Firestore `Timestamp` and `GeoFirePoint` require custom converters even with code generation.

---

## 18. Version Management & Breaking Changes Policy

### Semantic Versioning

This library follows [Semantic Versioning](https://semver.org/) (MAJOR.MINOR.PATCH):

- **MAJOR** (X.0.0): Breaking changes that require dependent projects to modify code
- **MINOR** (0.X.0): New features, additions that are backward-compatible
- **PATCH** (0.0.X): Bug fixes, minor additions that don't break existing code

### What Constitutes a Breaking Change?

#### MAJOR Version Bump Required

- **Removing a field** from a model
- **Changing a field type** (e.g., `String` to `int`)
- **Making a required field optional** (changes constructor signature)
- **Removing an enum value**
- **Changing a constant value** (e.g., collection name)
- **Removing a method** or changing its signature
- **Changing serialization format** (e.g., `Timestamp` to `DateTime`)

#### MINOR Version Bump Required

- **Adding a new optional field** to a model
- **Adding a new enum value**
- **Adding a new model class**
- **Adding a new constant**
- **Adding a new utility method**
- **Adding a new optional parameter** to a method

#### PATCH Version Bump Required

- **Bug fixes** in serialization
- **Fixing typos** in comments/documentation
- **Performance improvements**
- **Adding null-safety** to existing nullable fields (if it doesn't break code)

### Version Bump Workflow

1. **Identify the change type** (MAJOR/MINOR/PATCH)
2. **Update `pubspec.yaml`**:
   ```yaml
   version: 1.1.0  # MINOR bump for new feature
   ```
3. **Update `CHANGELOG.md`**:
   ```markdown
   ## 1.1.0
   
   ### Added
   - New `promoCode` field to `Booking` model (optional)
   - New `CurrencyCodesConstants.fromCountryCode()` method
   
   ### Changed
   - Improved error handling in `LatLngMapper.fromMap()`
   ```
4. **Commit and tag**:
   ```bash
   git add .
   git commit -m "chore: bump version to 1.1.0"
   git tag v1.1.0
   git push origin master --tags
   ```
5. **Notify dependent projects** to update their `pubspec.yaml` and run `flutter pub get`

### Migration Guide Example

If a MAJOR version introduces breaking changes, provide a migration guide:

```markdown
## Migration Guide: v1.0.0 → v2.0.0

### Breaking Changes

#### `Board` Model: `priceUnit` Changed to `currency`

**Before**:
```dart
Board board = Board(
  priceUnit: "EGP",
  // ...
);
```

**After**:
```dart
Board board = Board(
  currency: CurrencyCodesConstants.egypt,
  // ...
);
```

**Migration Steps**:
1. Replace all `board.priceUnit` with `board.currency.currencyCode`
2. Update Firestore documents to use new field name
3. Run data migration script
```

---

## 19. Known Issues & Future Recommendations

### Known Issues

1. **Export Structure Not Complete**
   - **Issue**: `lib/adblip_shared_lib.dart` only exports `src/adblip_shared_lib_base.dart` (placeholder)
   - **Impact**: Dependent projects must import models directly with full paths
   - **Fix**: Add exports for all models, constants, and utilities:
     ```dart
     // lib/adblip_shared_lib.dart
     library adblip_shared_lib;
     
     // Core Models
     export 'models/core_models/board.dart';
     export 'models/core_models/booking.dart';
     // ... all other models
     
     // Constants
     export 'models/consts/country_codes.dart';
     export 'models/consts/currency_codes.dart';
     // ... all other constants
     
     // Utilities
     export 'models/model_helper_utils/latling_mapper.dart';
     
     // Endpoints
     export 'end_points/firebase_collections_names.dart';
     ```

2. **Typo in Collection Names**
   - **Issue**: `boardsCollecion`, `companiesCollecion`, `boardsLocationsCollecion` (should be "Collection")
   - **Impact**: Inconsistent naming, potential confusion
   - **Fix**: Rename in a MAJOR version (breaking change if Firestore collections are already named this way)

3. **Inconsistent DateTime Handling**
   - **Issue**: Some models use `DateTime` (e.g., `AppUser.joinDate`), others use `Timestamp` (e.g., `Booking.startDate`)
   - **Impact**: Inconsistent conversion logic
   - **Recommendation**: Standardize on `Timestamp` for all Firestore date fields, or provide conversion utilities

4. **Missing Validation**
   - **Issue**: Models don't validate data (e.g., negative prices, invalid date ranges)
   - **Impact**: Invalid data can be created
   - **Recommendation**: Add validation methods or use a validation package

5. **No Documentation Comments**
   - **Issue**: Most models lack Dartdoc comments
   - **Impact**: Poor IDE autocomplete and documentation
   - **Recommendation**: Add comprehensive Dartdoc comments for all public classes and methods

### Future Recommendations

1. **Add Extensions**
   - `StringExtensions`: Email validation, phone number formatting
   - `DateTimeExtensions`: Firestore conversion, relative time ("2 days ago")
   - `NumExtensions`: Currency formatting, percentage formatting

2. **Add Validation Utilities**
   - `lib/utils/validators.dart`: Email, phone, URL validators
   - Model-level validation methods

3. **Consider Code Generation**
   - Migrate to `freezed` for automatic `copyWith`, `==`, `hashCode`
   - Reduces boilerplate and human error

4. **Add Failure Classes**
   - If error handling becomes standardized across apps, add `lib/failures/`

5. **Improve Testing**
   - Add comprehensive unit tests for all models
   - Add integration tests for Firestore conversion
   - Aim for 80%+ code coverage

6. **Add Localization Support**
   - If apps share localization strings, add `lib/l10n/` with ARB files

7. **Version Documentation**
   - Maintain detailed `CHANGELOG.md` with migration guides
   - Consider using [Keep a Changelog](https://keepachangelog.com/) format

8. **CI/CD Pipeline**
   - Add GitHub Actions for:
     - Running tests on PR
     - Linting and formatting checks
     - Publishing to private pub server (if applicable)

---

## 20. Appendix: Useful Commands Cheat-Sheet

### Development Commands

```bash
# Install dependencies
flutter pub get

# Update dependencies
flutter pub upgrade

# Analyze code for issues
flutter analyze

# Format code
dart format .

# Run tests
flutter test

# Run tests with coverage
flutter test --coverage

# View test coverage report (requires lcov)
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

### Code Generation (if added in future)

```bash
# Generate code once
flutter pub run build_runner build

# Generate code and watch for changes
flutter pub run build_runner watch

# Generate code and delete conflicting outputs
flutter pub run build_runner build --delete-conflicting-outputs

# Clean generated files
flutter pub run build_runner clean
```

### Publishing (if using private pub server)

```bash
# Publish to private pub server
dart pub publish --server=https://your-pub-server.com

# Dry run (validate without publishing)
dart pub publish --dry-run
```

### Git Workflow

```bash
# Create a new feature branch
git checkout -b feature/add-new-model

# Commit changes
git add .
git commit -m "feat: add PromoCode model"

# Tag a release
git tag v1.1.0
git push origin master --tags
```

### Dependency Management

```bash
# Check for outdated packages
flutter pub outdated

# Update a specific package
flutter pub upgrade cloud_firestore

# Show dependency tree
flutter pub deps
```

### Linting

```bash
# Run linter
dart analyze

# Fix auto-fixable issues
dart fix --apply
```

### Documentation

```bash
# Generate API documentation
dart doc

# View documentation
open doc/api/index.html
```

---

## Conclusion

This shared library is the foundation of the AdBlip ecosystem. By maintaining consistency across all four dependent projects, it ensures that:

- Data models are identical everywhere
- Constants are centralized and easy to update
- Business logic remains synchronized
- Type safety is enforced across the platform

When making changes, always consider the impact on dependent projects and follow semantic versioning. When in doubt, bump the version conservatively (better to do a MINOR bump for a PATCH-level change than to break dependent code).

For questions or issues, refer to this documentation or contact the development team.

---

**Document Version**: 1.0  
**Last Updated**: 25 Nov 2025  
**Maintained By**: AdBlip Development Team

