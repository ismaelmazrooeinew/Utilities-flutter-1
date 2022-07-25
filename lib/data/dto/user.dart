import 'package:utilities/utilities.dart';

class UserCreateUpdateDto {
  UserCreateUpdateDto({
    this.id,
    this.phoneNumber,
    this.userName,
    this.email,
    this.firstName,
    this.lastName,
    this.fullName,
    this.bio,
    this.headline,
    this.website,
    this.instagram,
    this.telegram,
    this.whatsapp,
    this.linkedIn,
    this.password,
    this.appUserName,
    this.appPhoneNumber,
    this.appEmail,
    this.type,
    this.region,
    this.activity,
    this.color,
    this.suspend,
    this.wallet,
    this.showContactInfo,
    this.birthDate,
    this.genderId,
    this.categories,
    this.locations,
  });

  final String? id;
  final String? phoneNumber;
  final String? userName;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? bio;
  final String? headline;
  final String? website;
  final String? instagram;
  final String? telegram;
  final String? whatsapp;
  final String? linkedIn;
  final String? password;
  final String? appUserName;
  final String? appPhoneNumber;
  final String? appEmail;
  final String? type;
  final String? region;
  final String? activity;
  final String? color;
  final bool? suspend;
  final double? wallet;
  final bool? showContactInfo;
  final String? birthDate;
  final int? genderId;
  final List<String>? categories;
  final List<int>? locations;

  factory UserCreateUpdateDto.fromJson(String str) => UserCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserCreateUpdateDto.fromMap(Map<String, dynamic> json) => UserCreateUpdateDto(
        id: json["id"] == null ? null : json["id"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        userName: json["userName"] == null ? null : json["userName"],
        email: json["email"] == null ? null : json["email"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        fullName: json["fullName"] == null ? null : json["fullName"],
        bio: json["bio"] == null ? null : json["bio"],
        headline: json["headline"] == null ? null : json["headline"],
        website: json["website"] == null ? null : json["website"],
        instagram: json["instagram"] == null ? null : json["instagram"],
        telegram: json["telegram"] == null ? null : json["telegram"],
        whatsapp: json["whatsapp"] == null ? null : json["whatsapp"],
        linkedIn: json["linkedIn"] == null ? null : json["linkedIn"],
        password: json["password"] == null ? null : json["password"],
        appUserName: json["appUserName"] == null ? null : json["appUserName"],
        appPhoneNumber: json["appPhoneNumber"] == null ? null : json["appPhoneNumber"],
        appEmail: json["appEmail"] == null ? null : json["appEmail"],
        type: json["type"] == null ? null : json["type"],
        region: json["region"] == null ? null : json["region"],
        activity: json["activity"] == null ? null : json["activity"],
        color: json["color"] == null ? null : json["color"],
        suspend: json["suspend"] == null ? null : json["suspend"],
        wallet: json["wallet"] == null ? null : json["wallet"],
        showContactInfo: json["showContactInfo"] == null ? null : json["showContactInfo"],
        birthDate: json["birthDate"] == null ? null : json["birthDate"],
        genderId: json["genderId"] == null ? null : json["genderId"],
        categories: json["categories"] == null ? null : List<String>.from(json["categories"].map((x) => x)),
        locations: json["locations"] == null ? null : List<int>.from(json["locations"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "userName": userName == null ? null : userName,
        "email": email == null ? null : email,
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "fullName": fullName == null ? null : fullName,
        "bio": bio == null ? null : bio,
        "headline": headline == null ? null : headline,
        "website": website == null ? null : website,
        "instagram": instagram == null ? null : instagram,
        "telegram": telegram == null ? null : telegram,
        "whatsapp": whatsapp == null ? null : whatsapp,
        "linkedIn": linkedIn == null ? null : linkedIn,
        "password": password == null ? null : password,
        "appUserName": appUserName == null ? null : appUserName,
        "appPhoneNumber": appPhoneNumber == null ? null : appPhoneNumber,
        "appEmail": appEmail == null ? null : appEmail,
        "type": type == null ? null : type,
        "region": region == null ? null : region,
        "activity": activity == null ? null : activity,
        "color": color == null ? null : color,
        "suspend": suspend == null ? null : suspend,
        "wallet": wallet == null ? null : wallet,
        "showContactInfo": showContactInfo == null ? null : showContactInfo,
        "birthDate": birthDate == null ? null : birthDate,
        "genderId": genderId == null ? null : genderId,
        "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x)),
        "locations": locations == null ? null : List<dynamic>.from(locations!.map((x) => x)),
      };
}

class UserReadDto {
  UserReadDto({
    this.token,
    this.id,
    this.fullName,
    this.phoneNumber,
    this.userName,
    this.bio,
    this.appUserName,
    this.appPhoneNumber,
    this.appEmail,
    this.type,
    this.firstName,
    this.lastName,
    this.headline,
    this.website,
    this.region,
    this.activity,
    this.wallet,
    this.point,
    this.instagram,
    this.telegram,
    this.whatsapp,
    this.linkedIn,
    this.showContactInfo,
    this.isAdmin,
    this.suspend,
    this.birthDate,
    this.gender,
    this.media,
    this.locations,
    this.categories,
    this.products,
    this.countFollowers,
    this.countProducts,
    this.color,
    this.bookmarkFolders,
    this.growthRate,
    this.isFollowing,
  });

  final String? token;
  final String? id;
  final String? fullName;
  final String? phoneNumber;
  final String? userName;
  final String? bio;
  final String? appUserName;
  final String? appPhoneNumber;
  final String? appEmail;
  final String? type;
  final String? firstName;
  final String? lastName;
  final String? headline;
  final String? website;
  final String? region;
  final String? activity;
  final double? wallet;
  final double? point;
  final String? instagram;
  final String? telegram;
  final String? whatsapp;
  final String? linkedIn;
  final bool? showContactInfo;
  final bool? isAdmin;
  final bool? isFollowing;
  final bool? suspend;
  final String? birthDate;
  final Gender? gender;
  final GrowthRateReadDto? growthRate;
  final List<MediaReadDto>? media;
  final List<LocationReadDto>? locations;
  final List<CategoryReadDto>? categories;
  final List<ProductReadDto>? products;
  final int? countFollowers;
  final int? countProducts;
  final String? color;
  final List<BookmarkFolder>? bookmarkFolders;

  factory UserReadDto.fromJson(String str) => UserReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserReadDto.fromMap(Map<String, dynamic> json) => UserReadDto(
        token: json["token"] == null ? null : json["token"],
        id: json["id"] == null ? null : json["id"],
        fullName: json["fullName"] == null ? null : json["fullName"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        userName: json["userName"] == null ? null : json["userName"],
        bio: json["bio"] == null ? null : json["bio"],
        appUserName: json["appUserName"] == null ? null : json["appUserName"],
        appPhoneNumber: json["appPhoneNumber"] == null ? null : json["appPhoneNumber"],
        appEmail: json["appEmail"] == null ? null : json["appEmail"],
        type: json["type"] == null ? null : json["type"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        headline: json["headline"] == null ? null : json["headline"],
        website: json["website"] == null ? null : json["website"],
        instagram: json["instagram"] == null ? null : json["instagram"],
        telegram: json["telegram"] == null ? null : json["telegram"],
        whatsapp: json["whatsapp"] == null ? null : json["whatsapp"],
        linkedIn: json["linkedIn"] == null ? null : json["linkedIn"],
        region: json["region"] == null ? null : json["region"],
        activity: json["activity"] == null ? null : json["activity"],
        wallet: json["wallet"] == null ? null : json["wallet"],
        point: json["point"] == null ? null : json["point"],
        showContactInfo: json["showContactInfo"] == null ? null : json["showContactInfo"],
        isAdmin: json["isAdmin"] == null ? null : json["isAdmin"],
        suspend: json["suspend"] == null ? null : json["suspend"],
        birthDate: json["birthDate"] == null ? null : json["birthDate"],
        gender: json["gender"] == null ? null : Gender.fromMap(json["gender"]),
        growthRate: json["growthRate"] == null ? null : GrowthRateReadDto.fromMap(json["growthRate"]),
        media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].map((x) => MediaReadDto.fromMap(x))),
        locations: json["locations"] == null ? null : List<LocationReadDto>.from(json["locations"].map((x) => LocationReadDto.fromMap(x))),
        categories: json["categories"] == null ? null : List<CategoryReadDto>.from(json["categories"].map((x) => CategoryReadDto.fromMap(x))),
        products: json["products"] == null ? null : List<ProductReadDto>.from(json["products"].map((x) => ProductReadDto.fromMap(x))),
        countFollowers: json["countFollowers"] == null ? null : json["countFollowers"],
        countProducts: json["countProducts"] == null ? null : json["countProducts"],
        color: json["color"] == null ? null : json["color"],
        isFollowing: json["isFollowing"] == null ? null : json["isFollowing"],
        bookmarkFolders: json["bookmarkFolders"] == null ? null : List<BookmarkFolder>.from(json["bookmarkFolders"].map((x) => BookmarkFolder.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "token": token == null ? null : token,
        "id": id == null ? null : id,
        "fullName": fullName == null ? null : fullName,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "userName": userName == null ? null : userName,
        "bio": bio == null ? null : bio,
        "appUserName": appUserName == null ? null : appUserName,
        "appPhoneNumber": appPhoneNumber == null ? null : appPhoneNumber,
        "appEmail": appEmail == null ? null : appEmail,
        "type": type == null ? null : type,
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "headline": headline == null ? null : headline,
        "website": website == null ? null : website,
        "region": region == null ? null : region,
        "activity": activity == null ? null : activity,
        "wallet": wallet == null ? null : wallet,
        "point": wallet == null ? null : point,
        "instagram": instagram == null ? null : instagram,
        "telegram": telegram == null ? null : telegram,
        "whatsapp": whatsapp == null ? null : whatsapp,
        "linkedIn": linkedIn == null ? null : linkedIn,
        "showContactInfo": showContactInfo == null ? null : showContactInfo,
        "isAdmin": isAdmin == null ? null : isAdmin,
        "suspend": suspend == null ? null : suspend,
        "birthDate": birthDate == null ? null : birthDate,
        "gender.dart": gender == null ? null : gender!.toMap(),
        "media": media == null ? null : List<dynamic>.from(media!.map((x) => x.toMap())),
        "locations": locations == null ? null : List<dynamic>.from(locations!.map((x) => x.toMap())),
        "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x.toMap())),
        "products": products == null ? null : List<dynamic>.from(products!.map((x) => x.toMap())),
        "countFollowers": countFollowers == null ? null : countFollowers,
        "countProducts": countProducts == null ? null : countProducts,
        "color": color == null ? null : color,
        "isFollowing": isFollowing == null ? null : isFollowing,
        "bookmarkFolders": bookmarkFolders == null ? null : List<dynamic>.from(bookmarkFolders!.map((x) => x.toMap())),
      };
}

class GetMobileVerificationCodeForLoginDto {
  GetMobileVerificationCodeForLoginDto({
    this.mobile,
    this.sendSms,
  });

  final String? mobile;
  final bool? sendSms;

  factory GetMobileVerificationCodeForLoginDto.fromJson(String str) => GetMobileVerificationCodeForLoginDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetMobileVerificationCodeForLoginDto.fromMap(Map<String, dynamic> json) => GetMobileVerificationCodeForLoginDto(
        mobile: json["mobile"] == null ? null : json["mobile"],
        sendSms: json["sendSMS"] == null ? null : json["sendSMS"],
      );

  Map<String, dynamic> toMap() => {
        "mobile": mobile == null ? null : mobile,
        "sendSMS": sendSms == null ? null : sendSms,
      };
}

class LoginWithEmail {
  LoginWithEmail({
    this.email,
    this.password,
    this.returnUrl,
    this.keep,
  });

  final String? email;
  final String? password;
  final String? returnUrl;
  final bool? keep;

  factory LoginWithEmail.fromJson(String str) => LoginWithEmail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginWithEmail.fromMap(Map<String, dynamic> json) => LoginWithEmail(
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        returnUrl: json["returnUrl"] == null ? null : json["returnUrl"],
        keep: json["keep"] == null ? null : json["keep"],
      );

  Map<String, dynamic> toMap() => {
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "returnUrl": returnUrl == null ? null : returnUrl,
        "keep": keep == null ? null : keep,
      };
}

class VerifyMobileForLoginDto {
  VerifyMobileForLoginDto({
    this.mobile,
    this.verificationCode,
  });

  final String? mobile;
  final String? verificationCode;

  factory VerifyMobileForLoginDto.fromJson(String str) => VerifyMobileForLoginDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VerifyMobileForLoginDto.fromMap(Map<String, dynamic> json) => VerifyMobileForLoginDto(
        mobile: json["mobile"] == null ? null : json["mobile"],
        verificationCode: json["verificationCode"] == null ? null : json["verificationCode"],
      );

  Map<String, dynamic> toMap() => {
        "mobile": mobile == null ? null : mobile,
        "verificationCode": verificationCode == null ? null : verificationCode,
      };
}

class ActiveMobileDto {
  ActiveMobileDto({
    this.code,
    this.mobile,
  });

  final String? code;
  final String? mobile;

  factory ActiveMobileDto.fromJson(String str) => ActiveMobileDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ActiveMobileDto.fromMap(Map<String, dynamic> json) => ActiveMobileDto(
        code: json["code"] == null ? null : json["code"],
        mobile: json["mobile"] == null ? null : json["mobile"],
      );

  Map<String, dynamic> toMap() => {
        "code": code == null ? null : code,
        "mobile": mobile == null ? null : mobile,
      };
}

class GrowthRateReadDto {
  GrowthRateReadDto({
    this.id,
    this.interActive1,
    this.interActive2,
    this.interActive3,
    this.interActive4,
    this.interActive5,
    this.interActive6,
    this.interActive7,
    this.feedback1,
    this.feedback2,
    this.feedback3,
    this.feedback4,
    this.feedback5,
    this.feedback6,
    this.feedback7,
    this.totalInterActive,
    this.totalFeedback,
  });

  final String? id;
  final double? interActive1;
  final double? interActive2;
  final double? interActive3;
  final double? interActive4;
  final double? interActive5;
  final double? interActive6;
  final double? interActive7;
  final double? feedback1;
  final double? feedback2;
  final double? feedback3;
  final double? feedback4;
  final double? feedback5;
  final double? feedback6;
  final double? feedback7;
  final double? totalInterActive;
  final double? totalFeedback;

  factory GrowthRateReadDto.fromJson(String str) => GrowthRateReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GrowthRateReadDto.fromMap(Map<String, dynamic> json) => GrowthRateReadDto(
        id: json["id"] == null ? null : json["id"],
        interActive1: json["interActive1"] == null ? null : json["interActive1"],
        interActive2: json["interActive2"] == null ? null : json["interActive2"],
        interActive3: json["interActive3"] == null ? null : json["interActive3"],
        interActive4: json["interActive4"] == null ? null : json["interActive4"],
        interActive5: json["interActive5"] == null ? null : json["interActive5"],
        interActive6: json["interActive6"] == null ? null : json["interActive6"],
        interActive7: json["interActive7"] == null ? null : json["interActive7"],
        feedback1: json["feedback1"] == null ? null : json["feedback1"],
        feedback2: json["feedback2"] == null ? null : json["feedback2"],
        feedback3: json["feedback3"] == null ? null : json["feedback3"],
        feedback4: json["feedback4"] == null ? null : json["feedback4"],
        feedback5: json["feedback5"] == null ? null : json["feedback5"],
        feedback6: json["feedback6"] == null ? null : json["feedback6"],
        feedback7: json["feedback7"] == null ? null : json["feedback7"],
        totalInterActive: json["totalInterActive"] == null ? null : json["totalInterActive"],
        totalFeedback: json["totalFeedback"] == null ? null : json["totalFeedback"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "interActive1": interActive1 == null ? null : interActive1,
        "interActive2": interActive2 == null ? null : interActive2,
        "interActive3": interActive3 == null ? null : interActive3,
        "interActive4": interActive4 == null ? null : interActive4,
        "interActive5": interActive5 == null ? null : interActive5,
        "interActive6": interActive6 == null ? null : interActive6,
        "interActive7": interActive7 == null ? null : interActive7,
        "feedback1": feedback1 == null ? null : feedback1,
        "feedback2": feedback2 == null ? null : feedback2,
        "feedback3": feedback3 == null ? null : feedback3,
        "feedback4": feedback4 == null ? null : feedback4,
        "feedback5": feedback5 == null ? null : feedback5,
        "feedback6": feedback6 == null ? null : feedback6,
        "feedback7": feedback7 == null ? null : feedback7,
        "totalInterActive": totalInterActive == null ? null : totalInterActive,
        "totalFeedback": totalFeedback == null ? null : totalFeedback,
      };
}

class BookmarkFolder {
  BookmarkFolder({
    this.id,
    this.title,
  });

  final String? id;
  final String? title;

  factory BookmarkFolder.fromJson(String str) => BookmarkFolder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BookmarkFolder.fromMap(Map<String, dynamic> json) => BookmarkFolder(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
      };
}

class UserFilterDto {
  UserFilterDto({
    this.userId,
    this.userName,
    this.showCategories,
    this.showFollowings,
    this.showForms,
    this.showGender,
    this.showLocations,
    this.showMedia,
    this.showProducts,
    this.showTransactions,
  });

  final String? userId;
  final String? userName;
  final bool? showGender;
  final bool? showMedia;
  final bool? showCategories;
  final bool? showLocations;
  final bool? showForms;
  final bool? showProducts;
  final bool? showTransactions;
  final bool? showFollowings;

  factory UserFilterDto.fromJson(String str) => UserFilterDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserFilterDto.fromMap(Map<String, dynamic> json) => UserFilterDto(
        userId: json["userId"] == null ? null : json["userId"],
        userName: json["userName"] == null ? null : json["userName"],
        showGender: json["showGender"] == null ? null : json["showGender"],
        showMedia: json["showMedia"] == null ? null : json["showMedia"],
        showCategories: json["showCategories"] == null ? null : json["showCategories"],
        showLocations: json["showLocations"] == null ? null : json["showLocations"],
        showForms: json["showForms"] == null ? null : json["showForms"],
        showProducts: json["showProducts"] == null ? null : json["showProducts"],
        showTransactions: json["showTransactions"] == null ? null : json["showTransactions"],
        showFollowings: json["showFollowings"] == null ? null : json["showFollowings"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId == null ? null : userId,
        "userName": userName == null ? null : userName,
        "showGender": showGender == null ? null : showGender,
        "showMedia": showMedia == null ? null : showMedia,
        "showCategories": showCategories == null ? null : showCategories,
        "showLocations": showLocations == null ? null : showLocations,
        "showForms": showForms == null ? null : showForms,
        "showProducts": showProducts == null ? null : showProducts,
        "showTransactions": showTransactions == null ? null : showTransactions,
        "showFollowings": showFollowings == null ? null : showFollowings,
      };
}
