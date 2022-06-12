import 'package:utilities/utilities.dart';

class CommentReadDto {
  CommentReadDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.score,
    this.comment,
    this.parentId,
    this.userId,
  });

  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final int? score;
  final String? comment;
  final String? parentId;
  final String? userId;

  factory CommentReadDto.fromJson(String str) => CommentReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentReadDto.fromMap(Map<String, dynamic> json) => CommentReadDto(
    id: json["id"] == null ? null : json["id"],
    createdAt: json["createdAt"] == null ? null :  json["createdAt"],
    updatedAt: json["updatedAt"] == null ? null :  json["updatedAt"],
    deletedAt: json["deletedAt"] == null ? null :  json["deletedAt"],
    score: json["score"] == null ? null : json["score"],
    comment: json["comment"] == null ? null : json["comment"],
    parentId: json["parentId"] == null ? null : json["parentId"],
    userId: json["userId"] == null ? null : json["userId"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "createdAt": createdAt == null ? null : createdAt,
    "updatedAt": updatedAt == null ? null : updatedAt,
    "deletedAt": deletedAt == null ? null : deletedAt,
    "score": score == null ? null : score,
    "comment": comment == null ? null : comment,
    "parentId": parentId == null ? null : parentId,
    "userId": userId == null ? null : userId,
  };
}

class CommentCreateUpdateDto {
  CommentCreateUpdateDto({
    this.parentId,
    this.score,
    this.comment,
    this.userId,
    this.productId,
    this.dailyPriceId,
    this.projectId,
    this.tutorialId,
    this.eventId,
    this.adId,
    this.companyId,
    this.tenderId,
    this.serviceId,
    this.magazineId,
  });

  final String? parentId;
  final int? score;
  final  String? comment;
  final  String? userId;
  final  String? productId;
  final  String? dailyPriceId;
  final  String? projectId;
  final  String? tutorialId;
  final  String? eventId;
  final  String? adId;
  final  String? companyId;
  final  String? tenderId;
  final  String? serviceId;
  final  String? magazineId;

  factory CommentCreateUpdateDto.fromJson( String? str) => CommentCreateUpdateDto.fromMap(json.decode(str!));

   String? toJson() => json.encode(toMap());

  factory CommentCreateUpdateDto.fromMap(Map<String, dynamic> json) => CommentCreateUpdateDto(
    parentId: json["parentId"] == null ? null : json["parentId"],
    score: json["score"] == null ? null : json["score"],
    comment: json["comment"] == null ? null : json["comment"],
    userId: json["userId"] == null ? null : json["userId"],
    productId: json["productId"] == null ? null : json["productId"],
    dailyPriceId: json["dailyPriceId"] == null ? null : json["dailyPriceId"],
    projectId: json["projectId"] == null ? null : json["projectId"],
    tutorialId: json["tutorialId"] == null ? null : json["tutorialId"],
    eventId: json["eventId"] == null ? null : json["eventId"],
    adId: json["adId"] == null ? null : json["adId"],
    companyId: json["companyId"] == null ? null : json["companyId"],
    tenderId: json["tenderId"] == null ? null : json["tenderId"],
    serviceId: json["serviceId"] == null ? null : json["serviceId"],
    magazineId: json["magazineId"] == null ? null : json["magazineId"],
  );

  Map<String, dynamic> toMap() => {
    "parentId": parentId == null ? null : parentId,
    "score": score == null ? null : score,
    "comment": comment == null ? null : comment,
    "userId": userId == null ? null : userId,
    "productId": productId == null ? null : productId,
    "dailyPriceId": dailyPriceId == null ? null : dailyPriceId,
    "projectId": projectId == null ? null : projectId,
    "tutorialId": tutorialId == null ? null : tutorialId,
    "eventId": eventId == null ? null : eventId,
    "adId": adId == null ? null : adId,
    "companyId": companyId == null ? null : companyId,
    "tenderId": tenderId == null ? null : tenderId,
    "serviceId": serviceId == null ? null : serviceId,
    "magazineId": magazineId == null ? null : magazineId,
  };
}
