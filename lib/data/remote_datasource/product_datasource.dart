import 'package:utilities/utilities.dart';

class ProductDataSource {
  final String baseUrl;

  ProductDataSource({required this.baseUrl});

  Future<void> create({
    required final ProductCreateUpdateDto dto,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/Product",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, ProductReadDto.fromMap)),
      );

  Future<void> update({
    required final ProductCreateUpdateDto dto,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPut(
        url: "$baseUrl/Product",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, ProductReadDto.fromMap)),
      );

  Future<void> read({
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Product",
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, ProductReadDto.fromMap)),
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Product/$id",
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, ProductReadDto.fromMap)),
      );

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpDelete(
        url: "$baseUrl/Product/$id",
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, ProductReadDto.fromMap)),
      );

  Future<void> filter({
    required final ProductFilterDto filter,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/Product/Filter",
        body: filter,
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, ProductReadDto.fromMap)),
        error: (Response response) {
          print(response.body);
          print(response.statusCode);
          print(response.statusText);
        },
      );

  Future<void> readMine({
    required final ProductCreateUpdateDto filter,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Product/Mine",
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<String>.fromJson(response.body, ProductReadDto.fromMap)),
      );
}
