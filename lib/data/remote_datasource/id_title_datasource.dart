import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

enum IdTitleDataSourceType {
  brand("Brand"),
  category("Category"),
  reference("Reference");

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
      post(
        url: "$baseUrl/${type.title}",
        body: dto,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> update({
    required final IdTitleCreateUpdateDto dto,
    required final Function(GenericResponse<IdTitleReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      put(
        url: "$baseUrl/${type.title}",
        body: dto,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> read({
    required final Function(GenericResponse<List<IdTitleReadDto>>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      get(
        url: "$baseUrl/${type.title}",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<IdTitleReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      get(
        url: "$baseUrl/${type.title}/$id",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> readByUseCase({
    required final String useCase,
    required final Function(GenericResponse<List<IdTitleReadDto>>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      get(
        url: "$baseUrl/${type.title}/$useCase",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> deleteIdTitle({
    required final String id,
    required final VoidCallback onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      delete(
        url: "$baseUrl/${type.title}/$id",
        action: (Response response) => onResponse(),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );
}
