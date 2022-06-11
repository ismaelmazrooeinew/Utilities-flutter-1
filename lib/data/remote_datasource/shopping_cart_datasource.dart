import 'package:utilities/data/dto/shopping_cart.dart';
import 'package:utilities/utilities.dart';



class ShoppingCartDataSource {
  final String baseUrl;

  ShoppingCartDataSource({required this.baseUrl});

  Future<void> createShoppingCart({
    required final ShoppingCartReadDto dto,
    required final Function(GenericResponse<ShoppingCartReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      post(
        url: "$baseUrl/ShoppingCart",
        body: dto,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> updateShoppingCart({
    required final ShoppingCartReadDto dto,
    required final Function(GenericResponse<ShoppingCartReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      post(
        url: "$baseUrl/ShoppingCart",
        body: dto,
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> readShoppingCart({
    required final Function(GenericResponse<ShoppingCartReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      get(
        url: "$baseUrl/ShoppingCart",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> readShoppingCartById({
    required final String id,
    required final Function(GenericResponse<ShoppingCartReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      get(
        url: "$baseUrl/ShoppingCart/$id",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );

  Future<void> deleteShoppingCart({
    required final String id,
    required final String itemId,
    required final Function(GenericResponse<ShoppingCartReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      delete(
        url: "$baseUrl/ShoppingCart/$id/$itemId",
        action: (Response response) => onResponse(GenericResponse.fromMap(response.body)),
        error: (Response response) => onError(GenericResponse.fromMap(response.body)),
      );
}
