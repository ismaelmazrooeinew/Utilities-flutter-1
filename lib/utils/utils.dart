import 'dart:ui';

import 'package:logger/logger.dart';

Logger logger = Logger();

void delay(final int milliseconds, final VoidCallback action) async => Future<dynamic>.delayed(
      Duration(milliseconds: milliseconds),
      () async => action(),
    );
