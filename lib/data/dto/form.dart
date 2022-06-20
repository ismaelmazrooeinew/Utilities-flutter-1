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
  final double? type;

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
    this.form,
  });

  final String? userId;
  final String? productId;
  final List<FormReadDto>? form;

  factory FormCreateUpdateDto.fromJson(String str) => FormCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FormCreateUpdateDto.fromMap(Map<String, dynamic> json) => FormCreateUpdateDto(
    userId: json["userId"] == null ? null : json["userId"],
    productId: json["productId"] == null ? null : json["productId"],
    form: json["form"] == null ? null : List<FormReadDto>.from(json["form"].map((x) => FormReadDto.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "userId": userId == null ? null : userId,
    "productId": productId == null ? null : productId,
    "form": form == null ? null : List<dynamic>.from(form!.map((x) => x.toMap())),
  };
}

class FormFieldCreateUpdateDto {
  FormFieldCreateUpdateDto({
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
  final bool? isRequired;
  final String? optionList;
  final double? type;
  final String? categoryId;

  factory FormFieldCreateUpdateDto.fromJson(String str) => FormFieldCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FormFieldCreateUpdateDto.fromMap(Map<String, dynamic> json) => FormFieldCreateUpdateDto(
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
