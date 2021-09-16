part of '../utilities.dart';

extension IterableExtentions on Iterable {
  Iterable<E> mapIndexed<E, T>(E Function(int index, T item) f) sync* {
    var index = 0;
    for (final item in this) {
      yield f(index, item);
      index = index + 1;
    }
  }
}

Future delay(int milliseconds, action) async => Future.delayed(Duration(milliseconds: milliseconds), () async => action());
