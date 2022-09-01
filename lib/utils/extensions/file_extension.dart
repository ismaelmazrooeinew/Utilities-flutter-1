import 'package:universal_io/io.dart';
import 'package:utilities/utilities.dart';

extension FileExtension on File {
  String toBase64() => base64Encode(readAsBytesSync());
}
