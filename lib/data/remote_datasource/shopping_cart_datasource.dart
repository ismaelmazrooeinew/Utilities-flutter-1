import 'package:utilities/data/dto/shopping_cart.dart';
import 'package:utilities/utilities.dart';

class ShoppingCartDataSource {
  final String baseUrl;

  ShoppingCartDataSource({required this.baseUrl});

  Future<void> create({
    required final ShoppingCartReadDto dto,
    required final Function(GenericResponse<ShoppingCartReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
       httpPost(
        url: "$baseUrl/ShoppingCart",
        body: dto,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> update({
    required final ShoppingCartReadDto dto,
    required final Function(GenericResponse<ShoppingCartReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPut(
        url: "$baseUrl/ShoppingCart",
        body: dto,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> read({
    required final Function(GenericResponse<List<ShoppingCartReadDto>>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
       httpGet(
        url: "$baseUrl/ShoppingCart",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<ShoppingCartReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
       httpGet(
        url: "$baseUrl/ShoppingCart/$id",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> delete({
    required final String id,
    required final String itemId,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpDelete(
        url: "$baseUrl/ShoppingCart/$id/$itemId",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );
}
