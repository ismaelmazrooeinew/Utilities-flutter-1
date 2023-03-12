import 'package:utilities/utilities.dart';

class ChatGroupReadDto {
  ChatGroupReadDto({
    this.title,
    this.description,
    this.users,
    this.media,
    this.products,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  final String? title;
  final String? description;
  final List<UserReadDto>? users;
  final List<MediaReadDto>? media;
  final List<String>? products;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory ChatGroupReadDto.fromJson(String str) => ChatGroupReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChatGroupReadDto.fromMap(Map<String, dynamic> json) => ChatGroupReadDto(
        title: json["title"],
        description: json["description"],
        users: json["users"] == null ? [] : List<UserReadDto>.from(json["users"]!.map((x) => UserReadDto.fromMap(x))),
        media: json["media"] == null ? [] : List<MediaReadDto>.from(json["media"]!.map((x) => MediaReadDto.fromMap(x))),
        products: json["products"] == null ? [] : List<String>.from(json["products"]!.map((x) => x)),
        id: json["id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "description": description,
        "users": users == null ? [] : List<String>.from(users!.map((x) => x.toMap())),
        "products": products == null ? [] : List<String>.from(products!.map((x) => x)),
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class ChatGroupCreateUpdateDto {
  ChatGroupCreateUpdateDto({
    this.id,
    this.title,
    this.description,
    this.value,
    this.type,
    this.useCase,
    this.department,
    this.readIfExist,
    this.chatStatus,
    this.priority,
    this.userIds,
    this.productIds,
  });

  final String? id;
  final String? title;
  final String? description;
  final String? value;
  final String? type;
  final String? useCase;
  final String? department;
  final bool? readIfExist;
  final int? chatStatus;
  final int? priority;
  final List<String>? userIds;
  final List<String>? productIds;

  factory ChatGroupCreateUpdateDto.fromJson(String str) => ChatGroupCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChatGroupCreateUpdateDto.fromMap(Map<String, dynamic> json) => ChatGroupCreateUpdateDto(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        value: json["value"],
        type: json["type"],
        useCase: json["useCase"],
        department: json["department"],
        readIfExist: json["readIfExist"],
        chatStatus: json["chatStatus"],
        priority: json["priority"],
        userIds: json["userIds"] == null ? [] : List<String>.from(json["userIds"]!.map((x) => x)),
        productIds: json["productIds"] == null ? [] : List<String>.from(json["productIds"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "value": value,
        "type": type,
        "useCase": useCase,
        "department": department,
        "readIfExist": readIfExist,
        "chatStatus": chatStatus,
        "priority": priority,
        "userIds": userIds == null ? [] : List<String>.from(userIds!.map((x) => x)),
        "productIds": productIds == null ? [] : List<String>.from(productIds!.map((x) => x)),
      };
}


class CreateGroupMessage {
  CreateGroupMessage({
    this.message,
    this.type,
    this.useCase,
    this.groupChatId,
  });

  final String? message;
  final String? type;
  final String? useCase;
  final String? groupChatId;

  factory CreateGroupMessage.fromJson(String str) => CreateGroupMessage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateGroupMessage.fromMap(Map<String, dynamic> json) => CreateGroupMessage(
    message: json["message"],
    type: json["type"],
    useCase: json["useCase"],
    groupChatId: json["groupChatId"],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "type": type,
    "useCase": useCase,
    "groupChatId": groupChatId,
  };
}

