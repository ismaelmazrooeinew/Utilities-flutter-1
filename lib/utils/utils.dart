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

extension BoolParsing on String {
  bool isTrue() => this.toLowerCase() == 'true';
  bool isFalse() => this.toLowerCase() == 'false';
}

void delay(int milliseconds, action) async => Future.delayed(Duration(milliseconds: milliseconds), () async => action());
