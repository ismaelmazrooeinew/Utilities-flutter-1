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

  Future<void> createMessage({
    required final CreateGroupMessage dto,
    required final Function(GenericResponse<ChatGroupReadDto> response) onResponse,
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

  Future<void> updateMessage({
    required final CreateGroupMessage dto,
    required final Function(GenericResponse<ChatGroupMessageReadDto> response) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPut(
        url: "$baseUrl/Chat/UpdateGroupChatMessage",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ChatGroupMessageReadDto>.fromJson(response.data, fromMap: ChatGroupMessageReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> update({
    required final ChatGroupCreateUpdateDto dto,
    required final Function(GenericResponse<ChatGroupReadDto> response) onResponse,
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
    required final Function(GenericResponse<ChatGroupReadDto> response) onResponse,
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
    required final Function(GenericResponse<ChatGroupReadDto> response) onResponse,
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
    required final Function(GenericResponse<ChatGroupMessageReadDto> response) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/Chat/ReadGroupChatMessages/$id",
        action: (Response response) => onResponse(GenericResponse<ChatGroupMessageReadDto>.fromJson(response.data, fromMap: ChatGroupMessageReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> deleteGroupChat({
    required final String chatId,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpDelete(
        url: "$baseUrl/Chat/DeleteGroupChat/$chatId",
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.data, fromMap: ChatReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> deleteMessage({
    required final String chatId,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpDelete(
        url: "$baseUrl/Chat/DeleteGroupChatMessage?id=$chatId",
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.data, fromMap: ChatReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );
}
