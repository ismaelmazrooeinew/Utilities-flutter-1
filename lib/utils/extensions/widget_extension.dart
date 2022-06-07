import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

extension WidgetsExtension on Widget {
  Widget withTooltip(
    final String message, {
    final Decoration? decoration,
    final double? height,
    final bool? preferBelow,
    final EdgeInsetsGeometry? padding,
    final TextStyle? textStyle,
    final Duration? waitDuration,
    final EdgeInsetsGeometry? margin,
  }) =>
      Tooltip(
        message: message,
        decoration: decoration,
        height: height,
        padding: padding,
        preferBelow: preferBelow,
        textStyle: textStyle,
        waitDuration: waitDuration,
        margin: margin,
        child: this,
      );

  Widget fit() => FittedBox(key: key, child: this, fit: BoxFit.scaleDown);

  Widget expanded({final int flex = 1}) => Expanded(flex: flex, child: this);

  Widget onTap(final GestureTapCallback? onPressed) => GestureDetector(
        onTap: onPressed,
        child: this,
      );
}
