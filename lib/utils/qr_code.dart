import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

Widget buildQRCodeGenerator({
  required final String inputValue,
  required final double width,
  required final double height,
  final ErrorCorrectionLevel? correctionLevel,
  final QRInputMode? inputMode,
  final EdgeInsets? padding,
}) =>
    Center(
      child: SizedBox(
          height: height,
          width: width,
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: SfBarcodeGenerator(
              value: inputValue,
              textAlign: TextAlign.justify,
              textSpacing: 10,
              symbology: QRCode(
                inputMode: inputMode ?? QRInputMode.numeric,
                codeVersion: QRCodeVersion.auto,
                errorCorrectionLevel: correctionLevel ?? ErrorCorrectionLevel.high,
              ),
            ),
          )),
    );
