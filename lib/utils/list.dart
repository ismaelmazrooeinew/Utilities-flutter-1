import 'package:utilities/utils/utils.dart';

extension IterableExtension<T> on Iterable<T> {
  Iterable<T> takeIfPossible(final int range) {
    if (range < length)
      return take(length);
    else
      return take(range);
  }

  T? getFirstIfExist() {
    if (isNullOrEmpty())
      return null;
    else
      return first;
  }
}