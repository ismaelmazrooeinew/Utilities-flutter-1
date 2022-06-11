import 'dart:ffi';

import 'package:utilities/utilities.dart';

class CreateUser {
  CreateUser({
    this.fullName,
    this.bio,
    this.headline,
    this.website,
    this.password,
    this.appUserName,
    this.appPhoneNumber,
    this.appEmail,
    this.id,
    this.firstName,
    this.lastName,
    this.suspend,
    this.wallet,
    this.colors,
    this.specialties,
    this.favorites,
    this.locations,
    this.birthDate,
  });

  final String? fullName;
  final String? bio;
  final String? headline;
  final String? website;
  final String? password;
  final String? appUserName;
  final String? appPhoneNumber;
  final String? appEmail;
  final String? id;
  final String? firstName;
  final String? lastName;
  final bool? suspend;
  final int? wallet;
  final List<String>? colors;
  final List<String>? specialties;
  final List<String>? favorites;
  final List<int>? locations;
  final String? birthDate;

  factory CreateUser.fromJson(String str) => CreateUser.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateUser.fromMap(Map<String, dynamic> json) => CreateUser(
    fullName: json["fullName"] == null ? null : json["fullName"],
    bio: json["bio"] == null ? null : json["bio"],
    headline: json["headline"] == null ? null : json["headline"],
    website: json["website"] == null ? null : json["website"],
    password: json["password"] == null ? null : json["password"],
    appUserName: json["appUserName"] == null ? null : json["appUserName"],
    appPhoneNumber: json["appPhoneNumber"] == null ? null : json["appPhoneNumber"],
    appEmail: json["appEmail"] == null ? null : json["appEmail"],
    id: json["id"] == null ? null : json["id"],
    firstName: json["firstName"] == null ? null : json["firstName"],
    lastName: json["lastName"] == null ? null : json["lastName"],
    suspend: json["suspend"] == null ? null : json["suspend"],
    wallet: json["wallet"] == null ? null : json["wallet"],
    colors: json["colors"] == null ? null : List<String>.from(json["colors"].map((x) => x)),
    specialties: json["specialties"] == null ? null : List<String>.from(json["specialties"].map((x) => x)),
    favorites: json["favorites"] == null ? null : List<String>.from(json["favorites"].map((x) => x)),
    locations: json["locations"] == null ? null : List<int>.from(json["locations"].map((x) => x)),
    birthDate: json["birthDate"] == null ? null :json["birthDate"],
  );

  Map<String, dynamic> toMap() => {
    "fullName": fullName == null ? null : fullName,
    "bio": bio == null ? null : bio,
    "headline": headline == null ? null : headline,
    "website": website == null ? null : website,
    "password": password == null ? null : password,
    "appUserName": appUserName == null ? null : appUserName,
    "appPhoneNumber": appPhoneNumber == null ? null : appPhoneNumber,
    "appEmail": appEmail == null ? null : appEmail,
    "id": id == null ? null : id,
    "firstName": firstName == null ? null : firstName,
    "lastName": lastName == null ? null : lastName,
    "suspend": suspend == null ? null : suspend,
    "wallet": wallet == null ? null : wallet,
    "colors": colors == null ? null : List<dynamic>.from(colors!.map((x) => x)),
    "specialties": specialties == null ? null : List<dynamic>.from(specialties!.map((x) => x)),
    "favorites": favorites == null ? null : List<dynamic>.from(favorites!.map((x) => x)),
    "locations": locations == null ? null : List<dynamic>.from(locations!.map((x) => x)),
    "birthDate": birthDate == null ? null : birthDate,
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
    this.birthDate,
    this.isAdmin,
    this.firstName,
    this.lastName,
    this.headline,
    this.website,
    this.suspend,
    this.wallet,
    this.media,
    this.colors,
    this.specialties,
    this.favorites,
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
  final String? birthDate;
  final Bool? isAdmin;
  final String? firstName;
  final String? lastName;
  final String? headline;
  final String? website;
  final Bool? suspend;
  final Int? wallet;
  final List<MediaReadDto>? media;
  final List<IdTitleReadDto>? colors;
  final List<IdTitleReadDto>? specialties;
  final List<IdTitleReadDto>? favorites;

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
    birthDate: json["birthDate"] == null ? null : json["birthDate"],
    media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].map((x) => MediaReadDto.fromMap(x))),
    colors: json["colors"] == null ? null : List<IdTitleReadDto>.from(json["colors"].map((x) => IdTitleReadDto.fromMap(x))),
    specialties: json["specialties"] == null ? null : List<IdTitleReadDto>.from(json["specialties"].map((x) => IdTitleReadDto.fromMap(x))),
    favorites: json["favorites"] == null ? null : List<IdTitleReadDto>.from(json["favorites"].map((x) => IdTitleReadDto.fromMap(x))),
    appEmail: json["appEmail"] == null ? null : json["appEmail"],
    isAdmin: json["isAdmin"] == null ? null : json["isAdmin"],
    firstName: json["firstName"] == null ? null : json["firstName"],
    lastName: json["lastName"] == null ? null : json["lastName"],
    headline: json["headline"] == null ? null : json["headline"],
    website: json["website"] == null ? null : json["website"],
    suspend: json["suspend"] == null ? null : json["suspend"],
    wallet: json["wallet"] == null ? null : json["wallet"],
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
    "birthDate": birthDate == null ? null : birthDate,
    "media": media == null ? null : List<dynamic>.from(media!.map((x) => x.toMap())),
    "colors": colors == null ? null : List<dynamic>.from(colors!.map((x) => x.toMap())),
    "specialties": specialties == null ? null : List<dynamic>.from(specialties!.map((x) => x.toMap())),
    "favorites": favorites == null ? null : List<dynamic>.from(favorites!.map((x) => x.toMap())),
    "appEmail": appEmail == null ? null : appEmail,
    "isAdmin": isAdmin == null ? null : isAdmin,
    "firstName": firstName == null ? null : firstName,
    "lastName": lastName == null ? null : lastName,
    "headline": headline == null ? null : headline,
    "website": website == null ? null : website,
    "suspend": suspend == null ? null : suspend,
    "wallet": wallet == null ? null : wallet,
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



class ProfileCreateUpdateDto {
  ProfileCreateUpdateDto({
     this.colors,
     this.specialties,
     this.favorites,
     this.fullName,
     this.bio,
     this.birthDate,
     this.userName,
     this.headline,
     this.education,
     this.degree,
     this.webSite,
     this.instagram,
     this.telegram,
     this.phoneNumber,
     this.link,
     this.publicBio,
     this.colorId,
     this.contactInformation,
  });

  final String? fullName;
  final String? bio;
  final String? birthDate;
  final String? userName;
  final String? headline;
  final String? education;
  final String? degree;
  final String? webSite;
  final String? instagram;
  final String? telegram;
  final String? phoneNumber;
  final String? link;
  final String? colorId;
  final bool? publicBio;
  final List<String>? colors;
  final List<String>? specialties;
  final List<String>? favorites;
  final List<ContactInformationCreateUpdateDto>? contactInformation;

  factory ProfileCreateUpdateDto.fromJson(String str) => ProfileCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProfileCreateUpdateDto.fromMap(Map<String, dynamic> json) => ProfileCreateUpdateDto(
    colors: json["colors"] == null ? null : List<String>.from(json["colors"].map((x) => x)),
    specialties: json["specialties"] == null ? null : List<String>.from(json["specialties"].map((x) => x)),
    favorites: json["favorites"] == null ? null : List<String>.from(json["favorites"].map((x) => x)),
    fullName: json["fullName"] == null ? null : json["fullName"],
    bio: json["bio"] == null ? null : json["bio"],
    birthDate: json["birthDate"] == null ? null : json["birthDate"],
    userName: json["userName"] == null ? null : json["userName"],
    headline: json["headline"] == null ? null : json["headline"],
    education: json["education"] == null ? null : json["education"],
    degree: json["degree"] == null ? null : json["degree"],
    webSite: json["webSite"] == null ? null : json["webSite"],
    instagram: json["instagram"] == null ? null : json["instagram"],
    telegram: json["telegram"] == null ? null : json["telegram"],
    phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
    link: json["link"] == null ? null : json["link"],
    publicBio: json["publicBio"] == null ? null : json["publicBio"],
    colorId: json["colorId"] == null ? null : json["colorId"],
    contactInformation: json["contactInformation"] == null ? null : List<ContactInformationCreateUpdateDto>.from(json["contactInformation"].map((x) => ContactInformationCreateUpdateDto.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "colors": colors == null ? null : List<dynamic>.from(colors!.map((x) => x)),
    "specialties": specialties == null ? null : List<dynamic>.from(specialties!.map((x) => x)),
    "favorites": favorites == null ? null : List<dynamic>.from(favorites!.map((x) => x)),
    "fullName": fullName == null ? null : fullName,
    "bio": bio == null ? null : bio,
    "birthDate": birthDate == null ? null : birthDate,
    "userName": userName == null ? null : userName,
    "headline": headline == null ? null : headline,
    "education": education == null ? null : education,
    "degree": degree == null ? null : degree,
    "webSite": webSite == null ? null : webSite,
    "instagram": instagram == null ? null : instagram,
    "telegram": telegram == null ? null : telegram,
    "phoneNumber": phoneNumber == null ? null : phoneNumber,
    "link": link == null ? null : link,
    "publicBio": publicBio == null ? null : publicBio,
    "colorId": colorId == null ? null : colorId,
    "contactInformation": contactInformation == null ? null : List<dynamic>.from(contactInformation!.map((x) => x.toMap())),
  };
}


