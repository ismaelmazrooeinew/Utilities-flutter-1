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
    this.gender,
    this.categories,
    this.locations,
    this.pinterest,
    this.soundcloud,
    this.dribble,
    this.state,
    this.stateTr1,
    this.genderTr1,
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
  final String? soundcloud;
  final String? pinterest;
  final String? dribble;
  final String? password;
  final String? appUserName;
  final String? appPhoneNumber;
  final String? appEmail;
  final String? type;
  final String? region;
  final String? activity;
  final String? color;
  final String? state;
  final String? stateTr1;
  final bool? suspend;
  final double? wallet;
  final bool? showContactInfo;
  final String? birthDate;
  final String? gender;
  final String? genderTr1;
  final List<String>? categories;
  final List<int>? locations;

  factory UserCreateUpdateDto.fromJson(String str) => UserCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserCreateUpdateDto.fromMap(Map<String, dynamic> json) => UserCreateUpdateDto(
        id: json["id"],
        phoneNumber: json["phoneNumber"],
        userName: json["userName"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        fullName: json["fullName"],
        bio: json["bio"],
        headline: json["headline"],
        website: json["website"],
        instagram: json["instagram"],
        telegram: json["telegram"],
        whatsapp: json["whatsApp"],
        linkedIn: json["linkedIn"],
        soundcloud: json["soundCloud"],
        dribble: json["dribble"],
        pinterest: json["pinterest"],
        password: json["password"],
        appUserName: json["appUserName"],
        appPhoneNumber: json["appPhoneNumber"],
        appEmail: json["appEmail"],
        type: json["type"],
        state: json["state"],
        stateTr1: json["stateTr1"],
        region: json["region"],
        activity: json["activity"],
        color: json["color"],
        suspend: json["suspend"],
        wallet: json["wallet"],
        showContactInfo: json["showContactInfo"],
        birthDate: json["birthDate"],
        gender: json["gender"],
        genderTr1: json["genderTr1"],
        categories: json["categories"] == null ? null : List<String>.from(json["categories"].map((x) => x)),
        locations: json["locations"] == null ? null : List<int>.from(json["locations"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "phoneNumber": phoneNumber,
        "userName": userName,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "fullName": fullName,
        "bio": bio,
        "headline": headline,
        "website": website,
        "instagram": instagram,
        "telegram": telegram,
        "whatsApp": whatsapp,
        "linkedIn": linkedIn,
        "soundCloud": soundcloud,
        "pinterest": pinterest,
        "dribble": dribble,
        "password": password,
        "appUserName": appUserName,
        "appPhoneNumber": appPhoneNumber,
        "appEmail": appEmail,
        "type": type,
        "state": state,
        "stateTr1": stateTr1,
        "region": region,
        "activity": activity,
        "color": color,
        "suspend": suspend,
        "wallet": wallet,
        "showContactInfo": showContactInfo,
        "birthDate": birthDate,
        "gender": gender,
        "genderTr1": genderTr1,
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
    this.soundcloud,
    this.dribble,
    this.pinterest,
    this.state,
    this.countFollowing,
    this.genderTr1,
    this.stateTr1,
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
  final String? state;
  final String? stateTr1;
  final String? website;
  final String? region;
  final String? activity;
  final double? wallet;
  final double? point;
  final String? instagram;
  final String? telegram;
  final String? dribble;
  final String? soundcloud;
  final String? pinterest;
  final String? whatsapp;
  final String? linkedIn;
  final bool? showContactInfo;
  final bool? isAdmin;
  final bool? isFollowing;
  final bool? suspend;
  final String? birthDate;
  final String? gender;
  final String? genderTr1;
  final int? countFollowers;
  final int? countFollowing;
  final int? countProducts;
  final String? color;
  final GrowthRateReadDto? growthRate;
  final List<MediaReadDto>? media;
  final List<LocationReadDto>? locations;
  final List<CategoryReadDto>? categories;
  final List<ProductReadDto>? products;
  final List<BookmarkFolder>? bookmarkFolders;

  factory UserReadDto.fromJson(String str) => UserReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  ChatReadDto ff(Map<String, dynamic> _json) => ChatReadDto.fromMap(_json);

  factory UserReadDto.fromMap(Map<String, dynamic> json) => UserReadDto(
        token: json["token"],
        id: json["id"],
        fullName: json["fullName"],
        phoneNumber: json["phoneNumber"],
        userName: json["userName"],
        bio: json["bio"],
        appUserName: json["appUserName"],
        appPhoneNumber: json["appPhoneNumber"],
        appEmail: json["appEmail"],
        type: json["type"],
        firstName: json["firstName"],
        state: json["state"],
        stateTr1: json["stateTr1"],
        lastName: json["lastName"],
        headline: json["headline"],
        website: json["website"],
        instagram: json["instagram"],
        telegram: json["telegram"],
        whatsapp: json["whatsApp"],
        linkedIn: json["linkedIn"],
        soundcloud: json["soundCloud"],
        dribble: json["dribble"],
        pinterest: json["pinterest"],
        region: json["region"],
        activity: json["activity"],
        wallet: json["wallet"],
        point: json["point"],
        showContactInfo: json["showContactInfo"],
        isAdmin: json["isAdmin"],
        suspend: json["suspend"],
        birthDate: json["birthdate"],
        gender: json["gender"],
        genderTr1: json["genderTr1"],
        countFollowers: json["countFollowers"],
        countFollowing: json["countFollowing"],
        countProducts: json["countProducts"],
        color: json["color"],
        isFollowing: json["isFollowing"],
        growthRate: json["growthRate"] == null ? null : GrowthRateReadDto.fromMap(json["growthRate"]),
        media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].map((x) => MediaReadDto.fromMap(x))),
        locations: json["locations"] != null ? List<LocationReadDto>.from(json["locations"].map((x) => LocationReadDto.fromMap(x))) : null,
        categories: json["categories"] == null ? null : List<CategoryReadDto>.from(json["categories"].map((x) => CategoryReadDto.fromMap(x))),
        products: json["products"] == null ? null : List<ProductReadDto>.from(json["products"].map((x) => ProductReadDto.fromMap(x))),
        bookmarkFolders: json["bookmarkFolders"] == null ? null : List<BookmarkFolder>.from(json["bookmarkFolders"].map((x) => BookmarkFolder.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "token": token,
        "id": id,
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "userName": userName,
        "bio": bio,
        "appUserName": appUserName,
        "appPhoneNumber": appPhoneNumber,
        "appEmail": appEmail,
        "type": type,
        "firstName": firstName,
        "lastName": lastName,
        "headline": headline,
        "state": state,
        "stateTr1": stateTr1,
        "website": website,
        "region": region,
        "activity": activity,
        "wallet": wallet,
        "point": point,
        "instagram": instagram,
        "telegram": telegram,
        "whatsApp": whatsapp,
        "linkedIn": linkedIn,
        "pinterest": pinterest,
        "dribble": dribble,
        "soundCloud": soundcloud,
        "showContactInfo": showContactInfo,
        "isAdmin": isAdmin,
        "suspend": suspend,
        "birthdate": birthDate,
        "gender": gender,
        "genderTr1": genderTr1,
        "countFollowers": countFollowers,
        "countFollowing": countFollowing,
        "countProducts": countProducts,
        "color": color,
        "isFollowing": isFollowing,
        "growthRate": growthRate == null ? null : growthRate!.toMap(),
        "media": media == null ? null : List<dynamic>.from(media!.map((x) => x.toMap())),
        "locations": locations == null ? null : List<dynamic>.from(locations!.map((x) => x.toMap())),
        "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x.toMap())),
        "products": products == null ? null : List<dynamic>.from(products!.map((x) => x.toMap())),
        "bookmarkFolders": bookmarkFolders == null ? null : List<dynamic>.from(bookmarkFolders!.map((x) => x.toMap())),
      };
}

class GetMobileVerificationCodeForLoginDto {
  GetMobileVerificationCodeForLoginDto({
    this.mobile,
    this.sendSms,
    this.token,
  });

  final String? mobile;
  final String? token;
  final bool? sendSms;

  factory GetMobileVerificationCodeForLoginDto.fromJson(String str) => GetMobileVerificationCodeForLoginDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetMobileVerificationCodeForLoginDto.fromMap(Map<String, dynamic> json) => GetMobileVerificationCodeForLoginDto(
        mobile: json["mobile"],
        sendSms: json["sendSMS"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "mobile": mobile,
        "sendSMS": sendSms,
        "token": token,
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
        email: json["email"],
        password: json["password"],
        returnUrl: json["returnUrl"],
        keep: json["keep"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
        "returnUrl": returnUrl,
        "keep": keep,
      };
}

class LoginWithPassword {
  LoginWithPassword({
    this.email,
    this.userName,
    this.password,
  });

  final String? email;
  final String? password;
  final String? userName;

  factory LoginWithPassword.fromJson(String str) => LoginWithPassword.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginWithPassword.fromMap(Map<String, dynamic> json) => LoginWithPassword(
        email: json["email"],
        userName: json["userName"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "userName": userName,
        "password": password,
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
        mobile: json["mobile"],
        verificationCode: json["verificationCode"],
      );

  Map<String, dynamic> toMap() => {
        "mobile": mobile,
        "verificationCode": verificationCode,
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
        code: json["code"],
        mobile: json["mobile"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "mobile": mobile,
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
        id: json["id"],
        interActive1: json["interActive1"],
        interActive2: json["interActive2"],
        interActive3: json["interActive3"],
        interActive4: json["interActive4"],
        interActive5: json["interActive5"],
        interActive6: json["interActive6"],
        interActive7: json["interActive7"],
        feedback1: json["feedback1"],
        feedback2: json["feedback2"],
        feedback3: json["feedback3"],
        feedback4: json["feedback4"],
        feedback5: json["feedback5"],
        feedback6: json["feedback6"],
        feedback7: json["feedback7"],
        totalInterActive: json["totalInterActive"],
        totalFeedback: json["totalFeedback"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "interActive1": interActive1,
        "interActive2": interActive2,
        "interActive3": interActive3,
        "interActive4": interActive4,
        "interActive5": interActive5,
        "interActive6": interActive6,
        "interActive7": interActive7,
        "feedback1": feedback1,
        "feedback2": feedback2,
        "feedback3": feedback3,
        "feedback4": feedback4,
        "feedback5": feedback5,
        "feedback6": feedback6,
        "feedback7": feedback7,
        "totalInterActive": totalInterActive,
        "totalFeedback": totalFeedback,
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
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
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
        userId: json["userId"],
        userName: json["userName"],
        showGender: json["showGender"],
        showMedia: json["showMedia"],
        showCategories: json["showCategories"],
        showLocations: json["showLocations"],
        showForms: json["showForms"],
        showProducts: json["showProducts"],
        showTransactions: json["showTransactions"],
        showFollowings: json["showFollowings"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "userName": userName,
        "showGender": showGender,
        "showMedia": showMedia,
        "showCategories": showCategories,
        "showLocations": showLocations,
        "showForms": showForms,
        "showProducts": showProducts,
        "showTransactions": showTransactions,
        "showFollowings": showFollowings,
      };
}
