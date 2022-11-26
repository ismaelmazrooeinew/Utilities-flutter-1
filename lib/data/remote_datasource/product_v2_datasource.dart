import 'package:dio/dio.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/product.dart';
import 'package:utilities/utils/dio_interceptor.dart';


class ProductV2DataSource {
  final String baseUrl;

  ProductV2DataSource({required this.baseUrl});

  Future<void> create({
    required final ProductCreateUpdateDto dto,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/ProductV2",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.data, fromMap: ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure:failure!,
      );

  Future<void> update({
    required final ProductCreateUpdateDto dto,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function? failure,
  }) async =>
      httpPut(
        url: "$baseUrl/ProductV2",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.data, fromMap: ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure:failure!,
      );

  Future<void> read({
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/ProductV2",
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.data, fromMap: ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure:failure!,
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/ProductV2/$id",
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.data, fromMap: ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure:failure!,
      );

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
    final Function? failure,
  }) async =>
      httpDelete(
        url: "$baseUrl/ProductV2/$id",
        action: (Response response) => onResponse(GenericResponse<dynamic>.fromJson(response.data, fromMap: ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<dynamic>.fromJson(response.data)),
        failure:failure!,
      );

  Future<void> filter({
    required final ProductFilterDto filter,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/ProductV2/Filter",
        body: filter,
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.data, fromMap: ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure:failure!,
      );

  Future<void> readMine({
    required final ProductCreateUpdateDto filter,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/ProductV2/Mine",
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.data, fromMap: ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure:failure!,
      );
}
