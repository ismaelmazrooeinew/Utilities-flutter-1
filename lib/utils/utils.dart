import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:utilities/utilities.dart';

export 'constants.dart';
export 'extensions/align_extension.dart';
export 'extensions/date_extension.dart';
export 'extensions/extension.dart';
export 'extensions/file_extension.dart';
export 'extensions/iterable_extension.dart';
export 'extensions/number_extension.dart';
export 'extensions/shimmer_extension.dart';
export 'extensions/string_extension.dart';
export 'extensions/text_extension.dart';
export 'extensions/widget_extension.dart';
export 'flutter_switch/flutter_switch.dart';
export 'flip_cart/flip_card.dart';
export 'flip_cart/flip_card_controller.dart';
export 'file.dart';
export 'enums.dart';
export 'get.dart';
export 'dio_interceptor.dart';
export 'launch.dart';
export 'local_storage.dart';
export 'share.dart';

void delay(final int milliseconds, final VoidCallback action) async => Future<dynamic>.delayed(
      Duration(milliseconds: milliseconds),
      () async => action(),
    );

Future<File> getCompressImageFile({required final File file, final int quality = 70}) async {
  final Directory dir = Directory.systemTemp;
  final String targetPath = "${dir.absolute.path}/temp.jpg";
  final File? result = await FlutterImageCompress.compressAndGetFile(
    file.absolute.path,
    targetPath,
    quality: quality,
  );

  return result ?? File("--");
}

Color hexStringToColor(final String hexString) {
  if (hexString.isEmpty) return Colors.transparent;
  final StringBuffer buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

String stringToHexColor(final Color color) => '#${color.value.toRadixString(16)}';
