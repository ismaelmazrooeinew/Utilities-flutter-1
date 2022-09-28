import 'package:dio/dio.dart';
import 'package:utilities/data/dto/category.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/user.dart';
import 'package:utilities/utils/dio_interceptor.dart';


class CategoryDataSource2 {
  final String baseUrl;

  CategoryDataSource2({required this.baseUrl});

  Future<void> create({
    required final CategoryCreateUpdateDto dto,
    required final Function(GenericResponse<CategoryReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost3(
        url: "$baseUrl/Category",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<CategoryReadDto>.fromJson(response.data, fromMap: CategoryReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> update({
    required final CategoryCreateUpdateDto dto,
    required final Function(GenericResponse<CategoryReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(GenericResponse response)? unAuthorize,
  }) async =>
      httpPut3(
        url: "$baseUrl/Category",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<CategoryReadDto>.fromJson(response.data, fromMap: CategoryReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> read({
    required final Function(GenericResponse<CategoryReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(GenericResponse response)? unAuthorize,
  }) async =>
      httpGet3(
        url: "$baseUrl/Category",
        action: (Response response) => onResponse(GenericResponse<CategoryReadDto>.fromJson(response.data, fromMap: CategoryReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpDelete3(
        url: "$baseUrl/Category/$id",
        action: (Response response) => onResponse(GenericResponse<CategoryReadDto>.fromJson(response.data, fromMap: CategoryReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );
}
