import 'package:utilities/utilities.dart';

class FormDataSource {
  final String baseUrl;

  FormDataSource({required this.baseUrl});

  Future<void> create({
    required final IdTitleCreateUpdateDto dto,
    required final Function(GenericResponse<FormReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/Form",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<FormReadDto>.fromJson(response.body, FormReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );

  Future<void> readByCategoryId({
    required final String categoryId,
    required final Function(GenericResponse<FormReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Form/$categoryId",
        action: (Response response) => onResponse(GenericResponse<FormReadDto>.fromJson(response.body, FormReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpDelete(
        url: "$baseUrl/DeleteFormField/$id",
        action: (Response response) => onResponse(GenericResponse<FormReadDto>.fromJson(response.body, FormReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );

  Future<void> createFormField({
    required final IdTitleCreateUpdateDto dto,
    required final Function(GenericResponse<FormReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/Form/CreateFormField",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<FormReadDto>.fromJson(response.body, FormReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );

  Future<void> updateFormField({
    required final IdTitleCreateUpdateDto dto,
    required final Function(GenericResponse<FormReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPut(
        url: "$baseUrl/Form/UpdateFormField",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<FormReadDto>.fromJson(response.body, FormReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );

  Future<void> deleteFormField({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpDelete(
        url: "$baseUrl/DeleteFormField/$id",
        action: (Response response) => onResponse(GenericResponse<FormReadDto>.fromJson(response.body, FormReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, UserReadDto.fromMap)),
      );
}
