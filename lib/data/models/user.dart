import 'package:utilities/utilities.dart';

class GetMobileVerificationCodeForLoginDto {
  GetMobileVerificationCodeForLoginDto({
    required this.mobile,
    required this.sendSms,
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
    required this.mobile,
    required this.verificationCode,
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

class UserReadDto {
  UserReadDto({
    required this.token,
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.userName,
    required this.bio,
    required this.appUserName,
    required this.appPhoneNumber,
    required this.birthDate,
    required this.media,
    required this.colors,
    required this.specialties,
    required this.favorites,
  });

  final String? token;
  final String? id;
  final String? fullName;
  final String? phoneNumber;
  final String? userName;
  final String? bio;
  final String? appUserName;
  final String? appPhoneNumber;
  final String? birthDate;
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
      };
}

class UpdateProfileParams {
  UpdateProfileParams({
    required this.colors,
    required this.specialties,
    required this.favorites,
    required this.fullName,
    required this.bio,
    required this.birthDate,
    required this.userName,
    required this.headline,
    required this.education,
    required this.degree,
    required this.webSite,
    required this.instagram,
    required this.telegram,
    required this.phoneNumber,
    required this.link,
    required this.publicBio,
    required this.colorId,
    required this.contactInformation,
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
  final List<ContactInformationParams>? contactInformation;

  factory UpdateProfileParams.fromJson(String str) => UpdateProfileParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdateProfileParams.fromMap(Map<String, dynamic> json) => UpdateProfileParams(
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
    contactInformation: json["contactInformation"] == null ? null : List<ContactInformationParams>.from(json["contactInformation"].map((x) => ContactInformationParams.fromMap(x))),
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
