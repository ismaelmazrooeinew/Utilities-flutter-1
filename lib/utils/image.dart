part of '../utilities.dart';

extension FileExtension on File {
  String toBase64() => base64Encode(this.readAsBytesSync());
}
