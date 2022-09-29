import 'package:dio/dio.dart';
import 'package:utilities/data/dto/chat.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/user.dart';
import 'package:utilities/utils/dio_interceptor.dart';


class ChatDataSource2 {
  final String baseUrl;

  ChatDataSource2({required this.baseUrl});

  Future<void> create({
    required final ChatCreateDto dto,
    required final Function(GenericResponse<ChatReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpPost3(
        url: "$baseUrl/Chat",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ChatReadDto>.fromJson(response.data, fromMap: ChatReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> read({
    required final Function(GenericResponse<ChatReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet3(
        url: "$baseUrl/Chat",
        action: (Response response) => onResponse(GenericResponse<ChatReadDto>.fromJson(response.data, fromMap: ChatReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );

  Future<void> readByUserId({
    required final String userId,
    required final Function(GenericResponse<ChatReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
  }) async =>
      httpGet3(
        url: "$baseUrl/Chat/$userId",
        action: (Response response) => onResponse(GenericResponse<ChatReadDto>.fromJson(response.data, fromMap: ChatReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
      );
}