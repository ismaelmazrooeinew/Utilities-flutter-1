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

  Future<void> create({
    required final ProductCreateUpdateDto dto,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
       httpPost(
        url: "$baseUrl/${type.title}",
        body: dto,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> update({
    required final ProductCreateUpdateDto dto,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPut(
        url: "$baseUrl/${type.title}",
        body: dto,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> read({
    required final Function(GenericResponse<List<ProductReadDto>>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
       httpGet(
        url: "$baseUrl/${type.title}",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
       httpGet(
        url: "$baseUrl/${type.title}/$id",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpDelete(
        url: "$baseUrl/${type.title}/$id",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> filter({
    required final ProductCreateUpdateDto filter,
    required final Function(GenericResponse<List<ProductReadDto>>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
       httpPost(
        url: "$baseUrl/${type.title}/Filter",
        body: filter,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void>  readMine({
    required final ProductCreateUpdateDto filter,
    required final Function(GenericResponse<List<ProductReadDto>>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
       httpGet(
        url: "$baseUrl/${type.title}/Mine",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );
}
