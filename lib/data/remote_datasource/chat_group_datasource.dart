import 'package:dio/dio.dart';
import 'package:utilities/data/dto/chat.dart';
import 'package:utilities/data/dto/chat_group.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/utils/dio_interceptor.dart';

class ChatGroupDataSource {
  final String baseUrl;

  ChatGroupDataSource({required this.baseUrl});

  Future<void> create({
    required final ChatGroupCreateUpdateDto dto,
    required final Function(GenericResponse<ChatGroupReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/Chat/CreateGroupChat",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ChatGroupReadDto>.fromJson(response.data, fromMap: ChatGroupReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> CreateMessage({
    required final CreateGroupMessage dto,
    required final Function(GenericResponse<ChatGroupReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/Chat/CreateGroupChatMessage",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ChatGroupReadDto>.fromJson(response.data, fromMap: ChatGroupReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> update({
    required final ChatGroupCreateUpdateDto dto,
    required final Function(GenericResponse<ChatGroupReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPut(
        url: "$baseUrl/Chat/UpdateGroupChat",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ChatGroupReadDto>.fromJson(response.data, fromMap: ChatGroupReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> readMyGroupChats({
    required final Function(GenericResponse<ChatGroupReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/Chat/ReadMyGroupChats",
        action: (Response response) => onResponse(GenericResponse<ChatGroupReadDto>.fromJson(response.data, fromMap: ChatGroupReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );
  Future<void> readGroupChatById({
    required String id,
    required final Function(GenericResponse<ChatGroupReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/Chat/ReadGroupChatById/$id",
        action: (Response response) => onResponse(GenericResponse<ChatGroupReadDto>.fromJson(response.data, fromMap: ChatGroupReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> readGroupChatMessages({
    required String id,
    required final Function(GenericResponse<ChatGroupMessageReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/Chat/ReadGroupChatMessages/$id",
        action: (Response response) => onResponse(GenericResponse<ChatGroupMessageReadDto>.fromJson(response.data, fromMap: ChatGroupMessageReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> readByUserId({
    required final String userId,
    required final Function(GenericResponse<ChatReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/Chat/$userId",
        action: (Response response) => onResponse(GenericResponse<ChatReadDto>.fromJson(response.data, fromMap: ChatReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> delete({
    required final String chatId,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpDelete(
        url: "$baseUrl/Chat?id=$chatId",
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.data, fromMap: ChatReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );
}
