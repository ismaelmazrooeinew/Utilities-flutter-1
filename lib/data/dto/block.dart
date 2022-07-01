import 'package:utilities/utilities.dart';

class BlockReadDto {
  BlockReadDto({
    this.blocks,
  });

  final List<UserReadDto>? blocks;

  factory BlockReadDto.fromJson(String str) => BlockReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BlockReadDto.fromMap(Map<String, dynamic> json) => BlockReadDto(
    blocks: json["blocks"] == null ? null : List<UserReadDto>.from(json["blocks"].map((x) => UserReadDto.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "blocks": blocks == null ? null : List<dynamic>.from(blocks!.map((x) => x.toMap())),
  };
}

class BlockCreateUpdateDto {
  BlockCreateUpdateDto({
    this.userId,
  });

  final String? userId;

  factory BlockCreateUpdateDto.fromJson(String str) => BlockCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BlockCreateUpdateDto.fromMap(Map<String, dynamic> json) => BlockCreateUpdateDto(
    userId: json["userId"] == null ? null : json["userId"],
  );

  Map<String, dynamic> toMap() => {
    "userId": userId == null ? null : userId,
  };
}
