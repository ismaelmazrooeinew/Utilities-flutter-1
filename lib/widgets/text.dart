part of '../widgets.dart';

Widget textHeadLine1(
  String text, {
  Color color,
  double fontSize,
  FontWeight fontWeight,
  TextAlign textAlign = TextAlign.justify,
  EdgeInsets padding: const EdgeInsets.all(0),
}) =>
    Padding(
        padding: padding,
        child: Text(
          text,
          style: theme.textTheme.headline1.copyWith(fontSize: fontSize, color: color, fontWeight: fontWeight),
          textAlign: textAlign,
        ));

Widget textHeadLine2(
  String text, {
  Color color,
  double fontSize,
  FontWeight fontWeight,
  TextAlign textAlign = TextAlign.justify,
  EdgeInsets padding: const EdgeInsets.all(0),
}) =>
    Padding(
        padding: padding,
        child: Text(
          text,
          style: theme.textTheme.headline2.copyWith(fontSize: fontSize, color: color, fontWeight: fontWeight),
          textAlign: textAlign,
        ));

Widget textHeadLine3(
  String text, {
  Color color,
  double fontSize,
  FontWeight fontWeight,
  TextAlign textAlign = TextAlign.justify,
  EdgeInsets padding: const EdgeInsets.all(0),
}) =>
    Padding(
        padding: padding,
        child: Text(
          text,
          style: theme.textTheme.headline3.copyWith(fontSize: fontSize, color: color, fontWeight: fontWeight),
          textAlign: textAlign,
        ));

Widget textHeadLine4(
  String text, {
  Color color,
  double fontSize,
  FontWeight fontWeight,
  TextAlign textAlign = TextAlign.justify,
  EdgeInsets padding: const EdgeInsets.all(0),
}) =>
    Padding(
        padding: padding,
        child: Text(
          text,
          style: theme.textTheme.headline4.copyWith(fontSize: fontSize, color: color, fontWeight: fontWeight),
          textAlign: textAlign,
        ));

Widget textHeadLine5(
  String text, {
  Color color,
  double fontSize,
  FontWeight fontWeight,
  TextAlign textAlign = TextAlign.justify,
  EdgeInsets padding: const EdgeInsets.all(0),
}) =>
    Padding(
        padding: padding,
        child: Text(
          text,
          style: theme.textTheme.headline5.copyWith(fontSize: fontSize, color: color, fontWeight: fontWeight),
          textAlign: textAlign,
        ));

Widget textHeadLine6(
  String text, {
  Color color,
  double fontSize,
  FontWeight fontWeight,
  TextAlign textAlign = TextAlign.justify,
  EdgeInsets padding: const EdgeInsets.all(0),
}) =>
    Padding(
        padding: padding,
        child: Text(
          text,
          style: theme.textTheme.headline6.copyWith(fontSize: fontSize, color: color, fontWeight: fontWeight),
          textAlign: textAlign,
        ));

Widget textSubtitle1(
  String text, {
  Color color,
  double fontSize,
  FontWeight fontWeight,
  TextAlign textAlign = TextAlign.justify,
  EdgeInsets padding: const EdgeInsets.all(0),
}) =>
    Padding(
        padding: padding,
        child: Text(
          text,
          style: theme.textTheme.subtitle1.copyWith(fontSize: fontSize, color: color, fontWeight: fontWeight),
          textAlign: textAlign,
        ));

Widget textSubtitle2(
  String text, {
  Color color,
  double fontSize,
  FontWeight fontWeight,
  TextAlign textAlign = TextAlign.justify,
  EdgeInsets padding: const EdgeInsets.all(0),
}) =>
    Padding(
        padding: padding,
        child: Text(
          text,
          style: theme.textTheme.subtitle2.copyWith(fontSize: fontSize, color: color, fontWeight: fontWeight),
          textAlign: textAlign,
        ));

Widget textBody1(
  String text, {
  Color color,
  double fontSize,
  FontWeight fontWeight,
  TextAlign textAlign = TextAlign.justify,
  EdgeInsets padding: const EdgeInsets.all(0),
  int maxLines,
}) =>
    Padding(
        padding: padding,
        child: Text(
          text,
          style: theme.textTheme.bodyText1.copyWith(color: color, fontSize: fontSize, fontWeight: fontWeight),
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
        ));

Widget textBody2(
  String text, {
  Color color,
  double fontSize,
  FontWeight fontWeight,
  TextAlign textAlign = TextAlign.justify,
  EdgeInsets padding: const EdgeInsets.all(0),
}) =>
    Padding(
        padding: padding,
        child: Text(
          text,
          style: theme.textTheme.bodyText2.copyWith(color: color, fontSize: fontSize, fontWeight: fontWeight),
          textAlign: textAlign,
        ));

Widget textCaption(
  String text, {
  Color color,
  double fontSize,
  int maxLines,
  FontWeight fontWeight,
  TextAlign textAlign = TextAlign.justify,
  EdgeInsets padding: const EdgeInsets.all(0),
}) =>
    Padding(
        padding: padding,
        child: Text(
          text,
          style: theme.textTheme.caption.copyWith(color: color, fontSize: fontSize, fontWeight: fontWeight),
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: maxLines == null ? null : TextOverflow.ellipsis,
        ));
