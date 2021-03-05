part of '../widgets.dart';

Widget divider({double width, double height = 0.6, Color color = Colors.grey, EdgeInsets padding}) => Container(
      margin: padding,
      width: width != null ? width : screenWidth,
      height: height,
      color: color,
    );
