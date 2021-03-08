part of '../widgets.dart';

Widget appTextHeadLine1(
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
      ),
    );

Widget appTextHeadLine2(
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
      ),
    );

Widget appTextHeadLine3(
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
      ),
    );

Widget appTextHeadLine4(
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
      ),
    );

Widget appTextHeadLine5(
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
      ),
    );

Widget appTextHeadLine6(
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
      ),
    );

Widget appTextSubtitle1(
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
      ),
    );

Widget appTextSubtitle2(
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
      ),
    );

Widget appTextBody1(
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
      ),
    );

Widget appTextBody2(
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
      ),
    );

Widget appTextCaption(
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
      ),
    );
