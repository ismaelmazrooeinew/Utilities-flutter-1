import 'package:utilities/data/models/params/contact_information_params.dart';
import 'package:utilities/utilities.dart';

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
