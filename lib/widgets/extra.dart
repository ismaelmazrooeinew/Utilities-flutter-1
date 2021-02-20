part of '../widgets.dart';

Widget divider({double width, double height, Color color = Colors.grey, EdgeInsets padding}) => Container(
      padding: padding,
      width: width != null ? width : screenWidth,
      height: height != null ? height : 1,
      color: color,
    );
