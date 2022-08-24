import 'dart:math';

import 'package:utilities/utilities.dart';

class ProductV2DataSource {
  final String baseUrl;

  ProductV2DataSource({required this.baseUrl});

  Future<void> create({
    required final ProductCreateUpdateDto dto,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/ProductV2",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, fromMap: ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> update({
    required final ProductCreateUpdateDto dto,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPut(
        url: "$baseUrl/ProductV2",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, fromMap: ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> read({
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/ProductV2",
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, fromMap: ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/ProductV2/$id",
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, fromMap: ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpDelete(
        url: "$baseUrl/ProductV2/$id",
        action: (Response response) => onResponse(GenericResponse<dynamic>.fromJson(response.body, fromMap: ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  Future<void> filter({
    required final ProductFilterDto filter,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/ProductV2/Filter",
        body: filter,
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, fromMap: ProductReadDto.fromMap)),
        error: (Response response) {
          logger.e(response.statusCode);
          logger.e(response.statusText);
          logger.e(response.status);
        },
      );

  Future<void> readMine({
    required final ProductCreateUpdateDto filter,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/ProductV2/Mine",
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, fromMap: ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );
}
