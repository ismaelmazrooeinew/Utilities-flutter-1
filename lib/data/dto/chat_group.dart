import 'package:utilities/utilities.dart';

class ChatGroupReadDto {
  ChatGroupReadDto({
    this.id,
    this.creatorUserId,
    this.title,
    this.description,
    this.users,
    this.media,
    this.products,
    this.createdAt,
    this.updatedAt,
  });

  final String? id;
  final String? creatorUserId;
  final String? title;
  final String? description;
  final List<UserReadDto>? users;
  final List<MediaReadDto>? media;
  final List<ProductReadDto>? products;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory ChatGroupReadDto.fromJson(String str) => ChatGroupReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChatGroupReadDto.fromMap(Map<String, dynamic> json) => ChatGroupReadDto(
        id: json["id"],
        creatorUserId: json["creatorUserId"],
        title: json["title"],
        description: json["description"],
        users: json["users"] == null ? [] : List<UserReadDto>.from(json["users"]!.map((x) => UserReadDto.fromMap(x))),
        media: json["media"] == null ? [] : List<MediaReadDto>.from(json["media"]!.map((x) => MediaReadDto.fromMap(x))),
        products: json["products"] == null ? [] : List<ProductReadDto>.from(json["products"]!.map((x) => ProductReadDto.fromMap(x))),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "creatorUserId": creatorUserId,
        "title": title,
        "description": description,
        "users": users == null ? [] : List<UserReadDto>.from(users!.map((x) => x.toMap())),
        "media": media == null ? [] : List<MediaReadDto>.from(media!.map((x) => x.toMap())),
        "products": products == null ? [] : List<ProductReadDto>.from(products!.map((x) => x.toMap())),
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
    this.id,
    this.message,
    this.products,
    this.type,
    this.parentId,
    this.useCase,
    this.groupChatId,
  });

  final String? id;
  final String? message;
  final String? type;
  final String? useCase;
  final String? parentId;
  final String? groupChatId;
  final List<String>? products;

  factory CreateGroupMessage.fromJson(String str) => CreateGroupMessage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateGroupMessage.fromMap(Map<String, dynamic> json) => CreateGroupMessage(
        id: json["id"],
        message: json["message"],
        type: json["type"],
        useCase: json["useCase"],
        parentId: json["parentId"],
        products: json["products"],
        groupChatId: json["groupChatId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "message": message,
        "type": type,
        "useCase": useCase,
        "parentId": parentId,
        "products": products,
        "groupChatId": groupChatId,
      };
}

class ChatGroupMessageReadDto {
  ChatGroupMessageReadDto({
    this.message,
    this.groupChatId,
    this.user,
    this.userId,
    this.media,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.products,
    this.parentId,
    this.parent,
  });

  final String? message;
  final String? groupChatId;
  final UserReadDto? user;
  final String? userId;
  final List<MediaReadDto>? media;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? parentId;
  final ChatGroupMessageReadDto? parent;
  final List<ProductReadDto>? products;

  factory ChatGroupMessageReadDto.fromJson(String str) => ChatGroupMessageReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChatGroupMessageReadDto.fromMap(Map<String, dynamic> json) => ChatGroupMessageReadDto(
        message: json["message"],
        groupChatId: json["groupChatId"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        media: json["media"] == null ? [] : List<MediaReadDto>.from(json["media"]!.map((x) => MediaReadDto.fromMap(x))),
        userId: json["userId"],
        parentId: json["parentId"],
        id: json["id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        parent: json["parent"] == null ? null : ChatGroupMessageReadDto.fromMap(json["parent"]),
        products: json["products"] == null ? null : List<ProductReadDto>.from(json["products"].map((x) => ProductReadDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "groupChatId": groupChatId,
        "user": user?.toMap(),
        "userId": userId,
        "media": media == null ? [] : List<MediaReadDto>.from(media!.map((x) => x)),
        "id": id,
        "parentId": parentId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "parent": parent == null ? null : parent!.toMap(),
        "products": products == null ? null : List<dynamic>.from(products!.map((x) => x.toMap())),
      };
}
