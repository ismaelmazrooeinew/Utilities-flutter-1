part of '../utilities.dart';

Widget button({
  required String title,
  VoidCallback? onTap,
  Widget? trailing,
  Widget? leading,
  Color? color,
  Color? textColor,
  double fontSize = 14,
  double width = 72,
  double height = 37,
  double borderRadius = 25,
  Color borderColor = Colors.transparent,
  EdgeInsets margin = EdgeInsets.zero,
  EdgeInsets padding = const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: padding,
        constraints: BoxConstraints(minWidth: width, minHeight: height),
        decoration: BoxDecoration(
          color: color ?? theme.primaryColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [BoxShadow(color: Color(0x0a1a1a1a), offset: Offset(-3, 3), blurRadius: 6, spreadRadius: 0)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            leading ?? SizedBox(),
            Center(
              child: Text(
                "\t$title\t",
                style: TextStyle(color: textColor, fontSize: fontSize, fontWeight: FontWeight.bold),
              ),
            ),
            trailing ?? SizedBox(),
          ],
        ),
      ),
    );
