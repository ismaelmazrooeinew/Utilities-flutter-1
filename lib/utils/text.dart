import 'package:utilities/utilities.dart';

TextDirection getDirection(final String v) {
  final String string = v.trim().replaceAll('0', '').replaceAll('1', '').replaceAll('2', '')
      .replaceAll('3', '').replaceAll('4', '').replaceAll('5', '').replaceAll('6', '').replaceAll('7', '').replaceAll('8', '')
      .replaceAll('9', '');
  const String param = 'ض ص ث ق ف غ ع ه خ ح ج چ پ ش س ی ب ل ا ت ن م ک گ ظ ط ز ر ذ د ئ و';
  if (string.isEmpty) {
    return TextDirection.RTL;
  } else {
    if (param.split(' ').contains(string[0])) {
      return TextDirection.RTL;
    } else {
      return TextDirection.LTR;
    }
  }
}