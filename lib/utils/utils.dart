import 'dart:ui';

import 'package:logger/logger.dart';

Logger logger = Logger();

extension IterableExtentions on Iterable {
  Iterable<E> mapIndexed<E, T>(E Function(int index, T item) f) sync* {
    int index = 0;
    for (final item in this) {
      yield f(index, item);
      index = index + 1;
    }
  }
}

extension NullableIterableExtentions on Iterable? {
  bool isNullOrEmpty() {
    if (this == null)
      return true;
    else if (this!.length == 0) return true;
    return false;
  }
}

extension BoolExtensios on String {
  bool isTrue() => toLowerCase() == 'true';

  bool isFalse() => toLowerCase() == 'false';
}

void delay(final int milliseconds, final VoidCallback action) async => Future<dynamic>.delayed(
      Duration(milliseconds: milliseconds),
      () async => action(),
    );
