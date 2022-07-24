import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:utilities/utilities.dart';

Widget otpTextField({
  final int length = 4,
  final bool autoFocus = false,
  final TextEditingController? controller,
  final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.spaceBetween,
  final String? hintCharacter,
  final void Function(String)? onCompleted,
  final double borderRadius = 1,
  final PinCodeFieldShape shape = PinCodeFieldShape.box,
  final EdgeInsetsGeometry? fieldOuterPadding,
  final double fieldHeight = 64,
  final double fieldWidth = 60,
  final Color? activeFillColor,
  final Color? inactiveFillColor,
  final Color? selectedFillColor,
  final Color? inactiveColor,
  final Color? selectedColor,
  final Color? activeColor,
}) =>
    PinCodeTextField(
      controller: controller,
      appContext: context,
      length: length,
      autoFocus: autoFocus,
      mainAxisAlignment: mainAxisAlignment,
      hintCharacter: hintCharacter,
      pinTheme: PinTheme(
        shape: shape,
        fieldOuterPadding: fieldOuterPadding,
        borderRadius: BorderRadius.circular(borderRadius),
        fieldHeight: fieldHeight,
        fieldWidth: fieldWidth,
        activeFillColor: activeFillColor,
        inactiveFillColor: inactiveFillColor,
        selectedFillColor: selectedFillColor,
        inactiveColor: inactiveColor,
        selectedColor: selectedColor,
        activeColor: activeColor,
      ),
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      onCompleted: onCompleted,
      onChanged: (final _) {},
    );
