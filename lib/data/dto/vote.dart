import 'package:utilities/utilities.dart';

class VoteCreateUpdateDto {
  VoteCreateUpdateDto({
    this.productId,
    this.votes,
  });

  final String? productId;
  final List<Vote>? votes;

  factory VoteCreateUpdateDto.fromJson(String str) => VoteCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VoteCreateUpdateDto.fromMap(Map<String, dynamic> json) => VoteCreateUpdateDto(
        productId: json["productId"],
        votes: json["votes"] == null ? null : List<Vote>.from(json["votes"].map((x) => Vote.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "productId": productId,
        "votes": votes == null ? null : List<dynamic>.from(votes!.map((x) => x.toMap())),
      };
}

class Vote {
  Vote({
    this.score,
    this.voteFieldId,
  });

  final double? score;
  final String? voteFieldId;

  factory Vote.fromJson(String str) => Vote.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Vote.fromMap(Map<String, dynamic> json) => Vote(
        score: json["score"],
        voteFieldId: json["voteFieldId"],
      );

  Map<String, dynamic> toMap() => {
        "score": score,
        "voteFieldId": voteFieldId,
      };
}

class VoteFieldCreateUpdateDto {
  VoteFieldCreateUpdateDto({
    this.voteFields,
    this.productId,
  });

  final List<VoteField>? voteFields;
  final String? productId;

  factory VoteFieldCreateUpdateDto.fromJson(String str) => VoteFieldCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VoteFieldCreateUpdateDto.fromMap(Map<String, dynamic> json) => VoteFieldCreateUpdateDto(
        productId: json["productId"],
        voteFields: json["voteFields"] == null ? null : List<VoteField>.from(json["voteFields"].map((x) => VoteField.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "voteFields": voteFields == null ? null : List<dynamic>.from(voteFields!.map((x) => x.toMap())),
        "productId": productId,
      };
}

class VoteField {
  VoteField({
    this.id,
    this.title,
    this.createdAt,
    this.productId,
    this.updatedAt,
    this.votes,
  });

  final String? id;
  final String? title;
  final String? productId;
  final String? createdAt;
  final String? updatedAt;
  final List<VoteReadDto>? votes;

  factory VoteField.fromJson(String str) => VoteField.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VoteField.fromMap(Map<String, dynamic> json) => VoteField(
        id: json["id"],
        title: json["title"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        productId: json["productId"],
        votes: json["votes"] == null ? null : List<VoteReadDto>.from(json["votes"].map((x) => VoteReadDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "productId": productId,
        "votes": votes == null ? null : List<dynamic>.from(votes!.map((x) => x.toMap())),
      };
}

class VoteReadDto {
  VoteReadDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.productId,
    this.score,
    this.userId,
    this.voteFieldId,
    this.voteField,
  });

  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? productId;
  final String? voteFieldId;
  final String? userId;
  final double? score;
  final VoteField? voteField;

  factory VoteReadDto.fromJson(String str) => VoteReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VoteReadDto.fromMap(Map<String, dynamic> json) => VoteReadDto(
        id: json["id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        productId: json["productId"],
        score: json["score"],
        userId: json["userId"],
        voteFieldId: json["voteFieldId"],
        voteField: json["voteField"] == null ? null : VoteField.fromMap(json["voteField"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "productId": productId,
        "score": score,
        "userId": userId,
        "voteFieldId": voteFieldId,
        "voteField": voteField == null ? null : voteField!.toMap(),
      };
}
