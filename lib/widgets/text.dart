part of '../utilities.dart';

Widget tag(
    String title, {
      TextStyle? textStyle,
      EdgeInsets padding = const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      EdgeInsets margin = const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      Color? color,
      double borderRadius = 100,
    }) =>
    Container(
      decoration: BoxDecoration(
        color: color ?? theme.primaryColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      margin: margin,
      padding: padding,
      child: Center(child: Text(title, style: textStyle)),
    );