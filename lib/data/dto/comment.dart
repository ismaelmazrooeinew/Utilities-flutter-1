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
  final String? parentId;
  final bool? isLiked;
  final UserReadDto? user;
  final List<CommentReadDto>? children;

  factory CommentReadDto.fromJson(String str) => CommentReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentReadDto.fromMap(Map<String, dynamic> json) => CommentReadDto(
        id: json["id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        score: json["score"],
        comment: json["comment"],
        userId: json["userId"],
        parentId: json["parentId"],
        isLiked: json["isLiked"],
          user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        children: json["children"] == null ? null : List<CommentReadDto>.from(json["children"].map((x) => CommentReadDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "score": score,
        "comment": comment,
        "isLiked": isLiked,
        "userId": userId,
        "parentId": parentId,
        "user": user == null ? null : user!.toMap(),
        "children": children == null ? null : List<dynamic>.from(children!.map((x) => x.toMap())),
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
        parentId: json["parentId"],
        score: json["score"],
        comment: json["comment"],
        productId: json["productId"],
      );

  Map<String, dynamic> toMap() => {
        "parentId": parentId,
        "score": score,
        "comment": comment,
        "productId": productId,
      };
}
