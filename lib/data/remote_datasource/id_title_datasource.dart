import 'package:utilities/utilities.dart';

enum IdTitleDataSourceType {
  brand("Brand"),
  category("Category"),
  reference("Reference"),
  speciality("Speciality");

  final String title;

  const IdTitleDataSourceType(this.title);

  @override
  String toString() => name;
}

class IdTitleDataSource {
  final String baseUrl;
  final IdTitleDataSourceType type;

  IdTitleDataSource({required this.baseUrl, required this.type});

  Future<void> create({
    required final IdTitleCreateUpdateDto dto,
    required final Function(GenericResponse<IdTitleReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/${type.title}",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<IdTitleReadDto>.fromJson(response.body, IdTitleReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<IdTitleReadDto>.fromJson(response.body, IdTitleReadDto.fromMap)),
      );

  Future<void> update({
    required final IdTitleCreateUpdateDto dto,
    required final Function(GenericResponse<IdTitleReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPut(
        url: "$baseUrl/${type.title}",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<IdTitleReadDto>.fromJson(response.body, IdTitleReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<IdTitleReadDto>.fromJson(response.body, IdTitleReadDto.fromMap)),
      );

  Future<void> read({
    required final Function(GenericResponse<IdTitleReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
       httpGet(
        url: "$baseUrl/${type.title}",
        action: (Response response) => onResponse(GenericResponse<IdTitleReadDto>.fromJson(response.body, IdTitleReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<IdTitleReadDto>.fromJson(response.body, IdTitleReadDto.fromMap)),
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<IdTitleReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
       httpGet(
        url: "$baseUrl/${type.title}/$id",
        action: (Response response) => onResponse(GenericResponse<IdTitleReadDto>.fromJson(response.body, IdTitleReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<IdTitleReadDto>.fromJson(response.body, IdTitleReadDto.fromMap)),
      );

  Future<void> readByUseCase({
    required final String useCase,
    required final Function(GenericResponse<IdTitleReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
       httpGet(
        url: "$baseUrl/${type.title}/$useCase",
        action: (Response response) => onResponse(GenericResponse<IdTitleReadDto>.fromJson(response.body, IdTitleReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<IdTitleReadDto>.fromJson(response.body, IdTitleReadDto.fromMap)),
      );

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpDelete(
        url: "$baseUrl/${type.title}/$id",
        action: (Response response) => onResponse(GenericResponse<IdTitleReadDto>.fromJson(response.body, IdTitleReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<IdTitleReadDto>.fromJson(response.body, IdTitleReadDto.fromMap)),
      );
}
