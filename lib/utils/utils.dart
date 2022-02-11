import 'dart:ui';

import 'package:logger/logger.dart';

Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 1,
    errorMethodCount: 4,
    lineLength: 400,
    colors: true,
    printEmojis: true,
    printTime: false,
    noBoxingByDefault: true,
  ),
);

void delay(final int milliseconds, final VoidCallback action) async => Future<dynamic>.delayed(
      Duration(milliseconds: milliseconds),
      () async => action(),
    );
