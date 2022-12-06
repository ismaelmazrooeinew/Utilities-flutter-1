import 'package:flutter/material.dart';
import 'package:utilities/components/dotted_border.dart';
import 'package:utilities/utils/get.dart';
Widget dottedBorder({
  required final Widget child,
  final EdgeInsetsGeometry? margin,
  final EdgeInsetsGeometry? padding,
  final EdgeInsetsGeometry? paddingDottedBorder,
  final double? borderRadius,
  final Color? foregroundColor,
  final Color? backgroundColor,
  final Color? dottedBorderColor,
}) =>
    Container(
        margin: margin ?? const EdgeInsets.only(top: 16),
        padding: padding ?? const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 6),
          color: foregroundColor ?? Color(0xffFFFFFF),
        ),
        child: DottedBorder(
          color: dottedBorderColor ?? Color(0xff0E4CD5).withOpacity(0.3),
          strokeWidth: 2,
          child: Container(
            width: screenWidth,
            color: backgroundColor ?? Color(0xffe7eefb),
            padding: paddingDottedBorder ?? const EdgeInsets.all(8),
            child: child,
          ),
        ));