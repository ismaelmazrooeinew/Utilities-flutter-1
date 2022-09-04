import 'package:intl/intl.dart';
import 'package:utilities/utils/extensions/string_extension.dart';

extension DateTimeExtensions on DateTime {
  String formatDate(final String dateFormat) => DateFormat(dateFormat).format(this);

  String toTimeAgo({final bool numericDates = false, final bool persian = false}) {
    try {
      final Duration difference = DateTime.now().difference(this);
      if (difference.inDays > 8)
        return this.toIso8601String().substring(0, 10);
      else if ((difference.inDays / 7).floor() >= 1)
        return persian
            ? numericDates
                ? '۱ هفته پیش'
                : 'هفته پیش'
            : numericDates
                ? '1w'
                : 'Last week';
      else if (difference.inDays >= 2)
        return persian ? '${difference.inDays.toString().persianNumber()} روز پیش' : '${difference.inDays}d';
      else if (difference.inDays >= 1)
        return persian
            ? numericDates
                ? '۱ روز پیش'
                : 'دیروز'
            : numericDates
                ? '1d'
                : 'Yesterday';
      else if (difference.inHours >= 2)
        return persian ? '${difference.inHours.toString().persianNumber()} ساعت پیش' : '${difference.inHours}h';
      else if (difference.inHours >= 1)
        return persian
            ? numericDates
                ? '۱ ساعت پیش'
                : 'یک ساعت پیش'
            : numericDates
                ? '1h'
                : 'An hour ago';
      else if (difference.inMinutes >= 2)
        return persian ? '${difference.inMinutes.toString().persianNumber()} دقیقه پیش' : '${difference.inMinutes}m';
      else if (difference.inMinutes >= 1)
        return persian
            ? numericDates
                ? '۱ دقیقه پیش'
                : 'یک دقیقه پیش'
            : numericDates
                ? '1m'
                : 'A minute ago';
      else if (difference.inSeconds >= 3)
        return persian ? '${difference.inSeconds.toString().persianNumber()} ثانیه پیش' : '${difference.inSeconds}s';
      else
        return persian ? 'همین الان' : 'Just now';
    } catch (e) {
      return this.toIso8601String();
    }
  }
}
