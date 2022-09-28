import 'package:dio/dio.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/shopping_cart.dart';
import 'package:utilities/data/dto/user.dart';
import 'package:utilities/utils/dio_interceptor.dart';


class ShoppingCartDataSource2 {
  final String baseUrl;

  ShoppingCartDataSource2({required this.baseUrl});

  Future<void> create({
    required final ShoppingCartReadDto dto,
    required final Function(GenericResponse<ShoppingCartReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost3(
        url: "$baseUrl/ShoppingCart",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ShoppingCartReadDto>.fromJson(response.data, fromMap: ShoppingCartReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> update({
    required final ShoppingCartReadDto dto,
    required final Function(GenericResponse<ShoppingCartReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPut3(
        url: "$baseUrl/ShoppingCart",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ShoppingCartReadDto>.fromJson(response.data, fromMap: ShoppingCartReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> read({
    required final Function(GenericResponse<ShoppingCartReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet3(
        url: "$baseUrl/ShoppingCart",
        action: (Response response) => onResponse(GenericResponse<ShoppingCartReadDto>.fromJson(response.data, fromMap: ShoppingCartReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<ShoppingCartReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet3(
        url: "$baseUrl/ShoppingCart/$id",
        action: (Response response) => onResponse(GenericResponse<ShoppingCartReadDto>.fromJson(response.data, fromMap: ShoppingCartReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> delete({
    required final String id,
    required final String itemId,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpDelete3(
        url: "$baseUrl/ShoppingCart/$id/$itemId",
        action: (Response response) => onResponse(GenericResponse<ShoppingCartReadDto>.fromJson(response.data, fromMap: ShoppingCartReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );
}
