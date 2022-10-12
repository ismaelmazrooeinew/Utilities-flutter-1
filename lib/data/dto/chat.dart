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
        id: json["id"] == null ? null : json["id"],
        userId: json["userId"] == null ? null : json["userId"],
        messageText: json["messageText"] == null ? null : json["messageText"],
        fullName: json["fullName"] == null ? null : json["fullName"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        unReadMessages: json["unReadMessages"] == null ? null : json["unReadMessages"],
        dateTime: json["dateTime"] == null ? null : json["dateTime"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        profileImage: json["profileImage"] == null ? null : json["profileImage"],
        send: json["send"] == null ? null : json["send"],
        media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].map((x) => MediaReadDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "userId": userId == null ? null : userId,
        "messageText": messageText == null ? null : messageText,
        "fullName": fullName == null ? null : fullName,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "unReadMessages": unReadMessages == null ? null : unReadMessages,
        "dateTime": dateTime == null ? null : dateTime,
        "user": user == null ? null : user!.toMap(),
        "profileImage": profileImage == null ? null : profileImage,
        "send": send == null ? null : send,
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
        userId: json["userId"] == null ? null : json["userId"],
        messageId: json["messageId"] == null ? null : json["messageId"],
        messageText: json["messageText"] == null ? null : json["messageText"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId == null ? null : userId,
        "messageId": messageId == null ? null : messageId,
        "messageText": messageText == null ? null : messageText,
      };
}
