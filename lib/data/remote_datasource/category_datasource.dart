import 'package:utilities/data/dto/category.dart';
import 'package:utilities/utilities.dart';


class CategoryDataSource {
  final String baseUrl;

  CategoryDataSource({required this.baseUrl});

  Future<void> create({
    required final CategoryCreateUpdateDto dto,
    required final Function(GenericResponse<CategoryReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/Category",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<CategoryReadDto>.fromJson(response.body, CategoryReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );

  Future<void> update({
    required final CategoryCreateUpdateDto dto,
    required final Function(GenericResponse<CategoryReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPut(
        url: "$baseUrl/Category",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<CategoryReadDto>.fromJson(response.body, CategoryReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );

  Future<void> read({
    required final Function(GenericResponse<CategoryReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Category",
        action: (Response response) => onResponse(GenericResponse<CategoryReadDto>.fromJson(response.body, CategoryReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpDelete(
        url: "$baseUrl/Category/$id",
        action: (Response response) => onResponse(GenericResponse<CategoryReadDto>.fromJson(response.body, CategoryReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );
}