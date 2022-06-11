import 'package:utilities/utilities.dart';

enum ProductDataSourceType {
  products("Products"),
  tutorials("Tutorials"),
  projects("Projects"),
  companies("Companies"),
  tenders("Tenders"),
  magazine("Magazine"),
  ads("Ads"),
  dailyPrice("DailyPrice"),
  job("Job");

  final String title;

  const ProductDataSourceType(this.title);

  @override
  String toString() => name;
}

class ProductDataSource {
  final String baseUrl;
  final ProductDataSourceType type;

  ProductDataSource({required this.baseUrl, required this.type});

  Future<void> createProduct({
    required final ProductCreateUpdateDto dto,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      post(
        url: "$baseUrl/${type.title}",
        body: dto,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> updateProduct({
    required final ProductCreateUpdateDto dto,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      put(
        url: "$baseUrl/${type.title}",
        body: dto,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> readProduct({
    required final Function(GenericResponse<List<ProductReadDto>>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      get(
        url: "$baseUrl/${type.title}",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> readProductById({
    required final String id,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      get(
        url: "$baseUrl/${type.title}/$id",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> deleteProduct({
    required final String id,
    required final Function(GenericResponse<String>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      delete(
        url: "$baseUrl/${type.title}/$id",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> filterProduct({
    required final ProductCreateUpdateDto filter,
    required final Function(GenericResponse<List<ProductReadDto>>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      post(
        url: "$baseUrl/${type.title}/Filter",
        body: filter,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> getProductMine({
    required final ProductCreateUpdateDto filter,
    required final Function(GenericResponse<List<ProductReadDto>>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      get(
        url: "$baseUrl/${type.title}/Mine",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );
}
