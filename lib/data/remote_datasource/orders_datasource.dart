import 'package:dio/dio.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/orders.dart';
import 'package:utilities/data/dto/user.dart';
import 'package:utilities/utils/dio_interceptor.dart';

class OrdersDataSource {
  final String baseUrl;

  OrdersDataSource({required this.baseUrl});

  Future<void> create({
    required final OrderCreateUpdateDto dto,
    required final Function(GenericResponse<OrdersReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/Order",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<OrdersReadDto>.fromJson(response.data, fromMap: OrdersReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> read({
    required final OrdersReadDto dto,
    required final Function(GenericResponse<OrdersReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost(
        url: "$baseUrl/Order/Filter",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<OrdersReadDto>.fromJson(response.data, fromMap: OrdersReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> update({
    required final OrderCreateUpdateDto dto,
    required final Function(GenericResponse<OrdersReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPut(
        url: "$baseUrl/Content",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<OrdersReadDto>.fromJson(response.data, fromMap: OrdersReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<OrdersReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet(
        url: "$baseUrl/Order/$id",
        action: (Response response) => onResponse(GenericResponse<OrdersReadDto>.fromJson(response.data, fromMap: OrdersReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse<OrdersReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpDelete(
        url: "$baseUrl/Order/$id",
        action: (Response response) => onResponse(GenericResponse<OrdersReadDto>.fromJson(response.data, fromMap: OrdersReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );
}
