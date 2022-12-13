import 'package:utilities/utilities.dart';

class ChatReadDto {
  ChatReadDto({
    this.id,
    this.userId,
    this.messageText,
    this.fullName,
    this.dateTime,
    this.profileImage,
    this.send,
    this.media,
    this.user,
    this.phoneNumber,
    this.unReadMessages,
  });

  final String? id;
  final String? userId;
  final String? messageText;
  final String? fullName;
  final String? dateTime;
  final String? profileImage;
  final String? phoneNumber;
  int? unReadMessages;
  final bool? send;
  final UserReadDto? user;
  final List<MediaReadDto>? media;

  factory ChatReadDto.fromJson(String str) => ChatReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChatReadDto.fromMap(Map<String, dynamic> json) => ChatReadDto(
        id: json["id"],
        userId: json["userId"],
        messageText: json["messageText"],
        fullName: json["fullName"],
        phoneNumber: json["phoneNumber"],
        unReadMessages: json["unReadMessages"],
        dateTime: json["dateTime"],
        profileImage: json["profileImage"],
        send: json["send"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].map((x) => MediaReadDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "userId": userId,
        "messageText": messageText,
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "unReadMessages": unReadMessages,
        "dateTime": dateTime,
        "send": send,
        "user": user == null ? null : user!.toMap(),
        "profileImage": profileImage == null ? null : profileImage,
        "media": media == null ? null : List<dynamic>.from(media!.map((x) => x.toMap())),
      };
}

class ChatCreateDto {
  ChatCreateDto({
    this.userId,
    this.messageId,
    this.messageText,
  });

  final String? userId;
  final String? messageId;
  final String? messageText;

  factory ChatCreateDto.fromJson(String str) => ChatCreateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChatCreateDto.fromMap(Map<String, dynamic> json) => ChatCreateDto(
        userId: json["userId"],
        messageId: json["messageId"],
        messageText: json["messageText"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "messageId": messageId,
        "messageText": messageText,
      };
}
