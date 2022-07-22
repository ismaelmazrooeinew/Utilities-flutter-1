import 'package:utilities/utilities.dart';

class CommentReadDto {
  CommentReadDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.score,
    this.comment,
    this.userId,
    this.user,
    this.children,
    this.parentId,
    this.isLiked,
  });

  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final double? score;
  final String? comment;
  final String? userId;
  final UserReadDto? user;
  final List<CommentReadDto>? children;
  final String? parentId;
  final bool? isLiked;

  factory CommentReadDto.fromJson(String str) => CommentReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentReadDto.fromMap(Map<String, dynamic> json) => CommentReadDto(
        id: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        score: json["score"] == null ? null : json["score"],
        comment: json["comment"] == null ? null : json["comment"],
        userId: json["userId"] == null ? null : json["userId"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        children: json["children"] == null ? null : List<CommentReadDto>.from(json["children"].map((x) => CommentReadDto.fromMap(x))),
        parentId: json["parentId"] == null ? null : json["parentId"],
        isLiked: json["isLiked"] == null ? null : json["isLiked"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt,
        "updatedAt": updatedAt == null ? null : updatedAt,
        "score": score == null ? null : score,
        "comment": comment == null ? null : comment,
        "isLiked": isLiked == null ? null : isLiked,
        "userId": userId == null ? null : userId,
        "user": user == null ? null : user!.toMap(),
        "children": children == null ? null : List<dynamic>.from(children!.map((x) => x.toMap())),
        "parentId": parentId == null ? null : parentId,
      };
}

class CommentCreateUpdateDto {
  CommentCreateUpdateDto({
    this.parentId,
    this.score,
    this.comment,
    this.productId,
  });

  final String? parentId;
  final double? score;
  final String? comment;
  final String? productId;

  factory CommentCreateUpdateDto.fromJson(String? str) => CommentCreateUpdateDto.fromMap(json.decode(str!));

  String? toJson() => json.encode(toMap());

  factory CommentCreateUpdateDto.fromMap(Map<String, dynamic> json) => CommentCreateUpdateDto(
        parentId: json["parentId"] == null ? null : json["parentId"],
        score: json["score"] == null ? null : json["score"],
        comment: json["comment"] == null ? null : json["comment"],
        productId: json["productId"] == null ? null : json["productId"],
      );

  Map<String, dynamic> toMap() => {
        "parentId": parentId == null ? null : parentId,
        "score": score == null ? null : score,
        "comment": comment == null ? null : comment,
        "productId": productId == null ? null : productId,
      };
}
