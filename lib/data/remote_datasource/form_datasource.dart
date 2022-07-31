import 'package:utilities/data/dto/form_filed.dart';
import 'package:utilities/utilities.dart';

class FormDataSource {
  final String baseUrl;

  FormDataSource({required this.baseUrl});

  Future<void> create({
    required final FormCreateUpdateDto dto,
    required final Function(GenericResponse<FormReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/Form",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<FormReadDto>.fromJson(response.body, fromMap: FormReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> readByCategoryId({
    required final String categoryId,
    required final Function(GenericResponse<FormFieldReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Form/$categoryId",
        action: (Response response) => onResponse(GenericResponse<FormFieldReadDto>.fromJson(response.body, fromMap: FormFieldReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpDelete(
        url: "$baseUrl/Form/$id",
        action: (Response response) => onResponse(GenericResponse<FormReadDto>.fromJson(response.body, fromMap: FormReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> createFormField({
    required final FormFieldCreateUpdateDto dto,
    required final Function(GenericResponse<FormReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/Form/CreateFormField",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<FormReadDto>.fromJson(response.body, fromMap: FormReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> updateFormField({
    required final FormFieldCreateUpdateDto dto,
    required final Function(GenericResponse<FormReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPut(
        url: "$baseUrl/Form/UpdateFormField",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<FormReadDto>.fromJson(response.body, fromMap: FormReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> deleteFormField({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpDelete(
        url: "$baseUrl/DeleteFormField/$id",
        action: (Response response) => onResponse(GenericResponse<FormReadDto>.fromJson(response.body, fromMap: FormReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );
}
