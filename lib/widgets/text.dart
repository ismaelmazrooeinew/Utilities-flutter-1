part of '../widgets.dart';

Widget textHeadLine1(
  String text, {
  int? maxLines,
  TextOverflow? textOverflow,
  TextStyle? style,
  TextAlign textAlign = TextAlign.justify,
  EdgeInsets padding: const EdgeInsets.all(0),
}) =>
    Padding(
        padding: padding,
        child: Text(text,
            style: style == null ? theme.textTheme.headline1 : style,
            textAlign: textAlign,
            maxLines: maxLines,
            overflow: maxLines == null
                ? null
                : textOverflow == null
                    ? TextOverflow.ellipsis
                    : textOverflow));

Widget textHeadLine2(
  String text, {
  int? maxLines,
  TextOverflow? textOverflow,
  TextStyle? style,
  TextAlign textAlign = TextAlign.justify,
  EdgeInsets padding: const EdgeInsets.all(0),
}) =>
    Padding(
        padding: padding,
        child: Text(text,
            style: style == null ? theme.textTheme.headline2 : style,
            textAlign: textAlign,
            maxLines: maxLines,
            overflow: maxLines == null
                ? null
                : textOverflow == null
                    ? TextOverflow.ellipsis
                    : textOverflow));

Widget textHeadLine3(
  String text, {
  int? maxLines,
  TextOverflow? textOverflow,
  TextStyle? style,
  TextAlign textAlign = TextAlign.justify,
  EdgeInsets padding: const EdgeInsets.all(0),
}) =>
    Padding(
        padding: padding,
        child: Text(text,
            style: style == null ? theme.textTheme.headline3 : style,
            textAlign: textAlign,
            maxLines: maxLines,
            overflow: maxLines == null
                ? null
                : textOverflow == null
                    ? TextOverflow.ellipsis
                    : textOverflow));

Widget textHeadLine4(
  String text, {
  int? maxLines,
  TextOverflow? textOverflow,
  TextStyle? style,
  TextAlign textAlign = TextAlign.justify,
  EdgeInsets padding: const EdgeInsets.all(0),
}) =>
    Padding(
        padding: padding,
        child: Text(text,
            style: style == null ? theme.textTheme.headline4 : style,
            textAlign: textAlign,
            maxLines: maxLines,
            overflow: maxLines == null
                ? null
                : textOverflow == null
                    ? TextOverflow.ellipsis
                    : textOverflow));

Widget textHeadLine5(
  String text, {
  int? maxLines,
  TextOverflow? textOverflow,
  TextStyle? style,
  TextAlign textAlign = TextAlign.justify,
  EdgeInsets padding: const EdgeInsets.all(0),
}) =>
    Padding(
        padding: padding,
        child: Text(text,
            style: style == null ? theme.textTheme.headline5 : style,
            textAlign: textAlign,
            maxLines: maxLines,
            overflow: maxLines == null
                ? null
                : textOverflow == null
                    ? TextOverflow.ellipsis
                    : textOverflow));

Widget textHeadLine6(
  String text, {
  int? maxLines,
  TextOverflow? textOverflow,
  TextStyle? style,
  TextAlign textAlign = TextAlign.justify,
  EdgeInsets padding: const EdgeInsets.all(0),
}) =>
    Padding(
        padding: padding,
        child: Text(text,
            style: style == null ? theme.textTheme.headline6 : style,
            textAlign: textAlign,
            maxLines: maxLines,
            overflow: maxLines == null
                ? null
                : textOverflow == null
                    ? TextOverflow.ellipsis
                    : textOverflow));

Widget textSubtitle1(
  String text, {
  int? maxLines,
  TextOverflow? textOverflow,
  TextStyle? style,
  TextAlign textAlign = TextAlign.justify,
  EdgeInsets padding: const EdgeInsets.all(0),
}) =>
    Padding(
        padding: padding,
        child: Text(text,
            style: style == null ? theme.textTheme.subtitle1 : style,
            textAlign: textAlign,
            maxLines: maxLines,
            overflow: maxLines == null
                ? null
                : textOverflow == null
                    ? TextOverflow.ellipsis
                    : textOverflow));

Widget textSubtitle2(
  String text, {
  int? maxLines,
  TextOverflow? textOverflow,
  TextStyle? style,
  TextAlign textAlign = TextAlign.justify,
  EdgeInsets padding: const EdgeInsets.all(0),
}) =>
    Padding(
        padding: padding,
        child: Text(text,
            style: style == null ? theme.textTheme.subtitle2 : style,
            textAlign: textAlign,
            maxLines: maxLines,
            overflow: maxLines == null
                ? null
                : textOverflow == null
                    ? TextOverflow.ellipsis
                    : textOverflow));

Widget textBody1(
  String text, {
  int? maxLines,
  TextOverflow? textOverflow,
  TextStyle? style,
  TextAlign textAlign = TextAlign.justify,
  EdgeInsets padding: const EdgeInsets.all(0),
}) =>
    Padding(
        padding: padding,
        child: Text(text,
            style: style == null ? theme.textTheme.bodyText1 : style,
            textAlign: textAlign,
            maxLines: maxLines,
            overflow: maxLines == null
                ? null
                : textOverflow == null
                    ? TextOverflow.ellipsis
                    : textOverflow));

Widget textBody2(
  String text, {
  int? maxLines,
  TextOverflow? textOverflow,
  TextStyle? style,
  TextAlign textAlign = TextAlign.justify,
  EdgeInsets padding: const EdgeInsets.all(0),
}) =>
    Padding(
        padding: padding,
        child: Text(text,
            style: style == null ? theme.textTheme.bodyText2 : style,
            textAlign: textAlign,
            maxLines: maxLines,
            overflow: maxLines == null
                ? null
                : textOverflow == null
                    ? TextOverflow.ellipsis
                    : textOverflow));

Widget textCaption(
  String text, {
  int? maxLines,
  TextOverflow? textOverflow,
  TextStyle? style,
  TextAlign textAlign = TextAlign.justify,
  EdgeInsets padding: const EdgeInsets.all(0),
}) =>
    Padding(
        padding: padding,
        child: Text(text,
            style: style == null ? theme.textTheme.caption : style,
            textAlign: textAlign,
            maxLines: maxLines,
            overflow: maxLines == null
                ? null
                : textOverflow == null
                    ? TextOverflow.ellipsis
                    : textOverflow));
