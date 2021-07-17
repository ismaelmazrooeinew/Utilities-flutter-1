part of '../utilities.dart';

Widget divider({double? width, double height = 0.6, Color color = Colors.grey, EdgeInsets? padding}) => Container(
      margin: padding,
      width: width != null ? width : screenWidth,
      height: height,
      color: color,
    );

Widget dashedDivider() => Row(
      children: [
        for (int i = 0; i < 40; i++)
          Expanded(
            child: Row(children: [Expanded(child: Divider(thickness: 1)), Expanded(child: Container())]),
          ),
      ],
    );
