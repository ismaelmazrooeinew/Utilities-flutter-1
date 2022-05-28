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
    required final String url,
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

  Future<void> update({
    required final String url,
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

  Future<void> read({
    required final String url,
    required final Function(GenericResponse<List<ProductReadDto>>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      get(
        url: "$baseUrl/${type.title}",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> readById({
    required final String url,
    required final String id,
    required final Function(GenericResponse<ProductReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      get(
        url: "$baseUrl/${type.title}/$id",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );
}
