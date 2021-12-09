import 'dart:ui';

// extension IterableExtentions on Iterable {
//   Iterable<E> mapIndexed<E, T>(E Function(int index, T item) f) sync* {
//     int index = 0;
//     for (final item in this) {
//       yield f(index, item);
//       index = index + 1;
//     }
//   }
// }

extension BoolExtensios on String {
  bool isTrue() => toLowerCase() == 'true';

  bool isFalse() => toLowerCase() == 'false';
}

void delay(final int milliseconds, final VoidCallback action) async => Future<dynamic>.delayed(
      Duration(milliseconds: milliseconds),
      () async => action(),
    );
