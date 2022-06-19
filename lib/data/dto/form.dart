import 'package:utilities/utilities.dart';

class FormReadDto {
  FormReadDto({
    this.id,
    this.label,
    this.title,
    this.isRequired,
    this.optionList,
    this.type,
    this.categoryId,
  });

  final String? id;
  final String? label;
  final String? title;
  final String? optionList;
  final String? categoryId;
  final bool? isRequired;
  final int? type;

  factory FormReadDto.fromJson(String str) => FormReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FormReadDto.fromMap(Map<String, dynamic> json) => FormReadDto(
        id: json["id"] == null ? null : json["id"],
        label: json["label"] == null ? null : json["label"],
        title: json["title"] == null ? null : json["title"],
        isRequired: json["isRequired"] == null ? null : json["isRequired"],
        optionList: json["optionList"] == null ? null : json["optionList"],
        type: json["type"] == null ? null : json["type"],
        categoryId: json["categoryId"] == null ? null : json["categoryId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "label": label == null ? null : label,
        "title": title == null ? null : title,
        "isRequired": isRequired == null ? null : isRequired,
        "optionList": optionList == null ? null : optionList,
        "type": type == null ? null : type,
        "categoryId": categoryId == null ? null : categoryId,
      };
}

class FormCreateUpdateDto {
  FormCreateUpdateDto({
    this.userId,
    this.productId,
    this.projectId,
    this.tutorialId,
    this.eventId,
    this.adId,
    this.companyId,
    this.tenderId,
    this.serviceId,
    this.magazineId,
    this.form,
  });

  final String? userId;
  final String? productId;
  final String? projectId;
  final String? tutorialId;
  final String? eventId;
  final String? adId;
  final String? companyId;
  final String? tenderId;
  final String? serviceId;
  final String? magazineId;
  final List<FormDto>? form;

  factory FormCreateUpdateDto.fromJson(String str) => FormCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FormCreateUpdateDto.fromMap(Map<String, dynamic> json) => FormCreateUpdateDto(
        userId: json["userId"] == null ? null : json["userId"],
        productId: json["productId"] == null ? null : json["productId"],
        projectId: json["projectId"] == null ? null : json["projectId"],
        tutorialId: json["tutorialId"] == null ? null : json["tutorialId"],
        eventId: json["eventId"] == null ? null : json["eventId"],
        adId: json["adId"] == null ? null : json["adId"],
        companyId: json["companyId"] == null ? null : json["companyId"],
        tenderId: json["tenderId"] == null ? null : json["tenderId"],
        serviceId: json["serviceId"] == null ? null : json["serviceId"],
        magazineId: json["magazineId"] == null ? null : json["magazineId"],
        form: json["form"] == null ? null : List<FormDto>.from(json["form"].map((x) => FormDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "userId": userId == null ? null : userId,
        "productId": productId == null ? null : productId,
        "projectId": projectId == null ? null : projectId,
        "tutorialId": tutorialId == null ? null : tutorialId,
        "eventId": eventId == null ? null : eventId,
        "adId": adId == null ? null : adId,
        "companyId": companyId == null ? null : companyId,
        "tenderId": tenderId == null ? null : tenderId,
        "serviceId": serviceId == null ? null : serviceId,
        "magazineId": magazineId == null ? null : magazineId,
        "form": form == null ? null : List<dynamic>.from(form!.map((x) => x.toMap())),
      };
}

class FormDto {
  FormDto({
    required this.id,
    required this.title,
    required this.formRead,
  });

  final String? id;
  final String? title;
  final FormReadDto? formRead;

  factory FormDto.fromJson(String str) => FormDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FormDto.fromMap(Map<String, dynamic> json) => FormDto(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        formRead: json["formRead"] == null ? null : FormReadDto.fromMap(json["formRead"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "formRead": formRead == null ? null : formRead!.toMap(),
      };
}
