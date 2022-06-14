import 'package:utilities/utilities.dart';

enum ProductDataSourceType {

  product("product"),
  tutorial("tutorial"),
  project("project"),
  company("company"),
  tender("tender"),
  magazine("magazine"),
  ad("ad"),
  dailyPrice("dailyPrice"),
  service("service");

  final String title;

  const ProductDataSourceType(this.title);

  @override
  String toString() => name;
}

class ProductDataSource {
  final String baseUrl;
  final ProductDataSourceType type;

  ProductDataSource({required this.baseUrl, required this.type});

  Future<void> create({
    required final ProductCreateUpdateDto dto,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
       httpPost(
        url: "$baseUrl/Product/${type.title}",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<ProductReadDto>.fromJson(response.body, ProductReadDto.fromMap)),
      );

  Future<void> update({
    required final ProductCreateUpdateDto dto,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPut(
        url: "$baseUrl/Product/${type.title}",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<ProductReadDto>.fromJson(response.body, ProductReadDto.fromMap)),
      );

  Future<void> read({
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
       httpGet(
        url: "$baseUrl/Product/${type.title}",
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<ProductReadDto>.fromJson(response.body, ProductReadDto.fromMap)),
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
       httpGet(
        url: "$baseUrl/Product/${type.title}/$id",
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<ProductReadDto>.fromJson(response.body, ProductReadDto.fromMap)),
      );

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpDelete(
        url: "$baseUrl/Product/${type.title}/$id",
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<ProductReadDto>.fromJson(response.body, ProductReadDto.fromMap)),
      );

  Future<void> filter({
    required final ProductCreateUpdateDto filter,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
       httpPost(
        url: "$baseUrl/Product/${type.title}/Filter",
        body: filter,
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<ProductReadDto>.fromJson(response.body, ProductReadDto.fromMap)),
      );

  Future<void>  readMine({
    required final ProductCreateUpdateDto filter,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
       httpGet(
        url: "$baseUrl/Product/${type.title}/Mine",
        action: (Response response) => onResponse(GenericResponse<ProductReadDto>.fromJson(response.body, ProductReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<ProductReadDto>.fromJson(response.body, ProductReadDto.fromMap)),
      );
}
