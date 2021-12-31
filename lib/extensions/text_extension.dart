import 'package:flutter/material.dart';

extension StyledText<T extends Text> on T {
  Text copyWith({
    final String? data,
    final TextStyle? style,
    final StrutStyle? strutStyle,
    final TextAlign? textAlign,
    final Locale? locale,
    final bool? softWrap,
    final TextOverflow? overflow,
    final double? textScaleFactor,
    final int? maxLines,
    final String? semanticsLabel,
    final TextWidthBasis? textWidthBasis,
  }) =>
      Text(
        data ?? this.data ?? "",
        style: style ?? this.style,
        strutStyle: strutStyle ?? this.strutStyle,
        textAlign: textAlign ?? this.textAlign,
        locale: locale ?? this.locale,
        maxLines: maxLines ?? this.maxLines,
        overflow: overflow ?? this.overflow,
        semanticsLabel: semanticsLabel ?? this.semanticsLabel,
        softWrap: softWrap ?? this.softWrap,
        textScaleFactor: textScaleFactor ?? this.textScaleFactor,
        textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      );

  T textScale(final double scaleFactor) => copyWith(textScaleFactor: scaleFactor) as T;

  T bold() => copyWith(style: (style ?? const TextStyle()).copyWith(fontWeight: FontWeight.bold)) as T;

  T italic() => copyWith(style: (style ?? const TextStyle()).copyWith(fontStyle: FontStyle.italic)) as T;

  T fontWeight(final FontWeight fontWeight) => copyWith(
        style: (style ?? const TextStyle()).copyWith(fontWeight: fontWeight),
      ) as T;

  T fontSize(final double size) => copyWith(style: (style ?? const TextStyle()).copyWith(fontSize: size)) as T;

  T fontFamily(final String font) => copyWith(style: (style ?? const TextStyle()).copyWith(fontFamily: font)) as T;

  T letterSpacing(final double space) => copyWith(style: (style ?? const TextStyle()).copyWith(letterSpacing: space)) as T;

  T wordSpacing(final double space) => copyWith(style: (style ?? const TextStyle()).copyWith(wordSpacing: space)) as T;

  T textShadow({
    final Color color = const Color(0x34000000),
    final double blurRadius = 0.0,
    final Offset offset = Offset.zero,
  }) =>
      copyWith(
        style: (style ?? const TextStyle()).copyWith(
          shadows: <Shadow>[Shadow(color: color, blurRadius: blurRadius, offset: offset)],
        ),
      ) as T;

  T textColor(final Color color) => copyWith(style: (style ?? const TextStyle()).copyWith(color: color)) as T;

  T textAlignment(final TextAlign align) => copyWith(textAlign: align) as T;

  T textBaseline(final TextBaseline textBaseline) => copyWith(
        style: (style ?? const TextStyle()).copyWith(textBaseline: textBaseline),
      ) as T;

  T textWidthBasis(final TextWidthBasis textWidthBasis) => copyWith(textWidthBasis: textWidthBasis) as T;

  T withUnderLine() => copyWith(style: (style ?? const TextStyle()).copyWith(decoration: TextDecoration.underline)) as T;
}

extension TextStyleExtension on TextStyle {
  TextStyle get w900 => TextStyle(fontSize: fontSize, fontFamily: fontFamily, fontWeight: FontWeight.w900);

  TextStyle get w800 => TextStyle(fontSize: fontSize, fontFamily: fontFamily, fontWeight: FontWeight.w800);

  TextStyle get bold => TextStyle(fontSize: fontSize, fontFamily: fontFamily, fontWeight: FontWeight.w700);

  TextStyle get w600 => TextStyle(fontSize: fontSize, fontFamily: fontFamily, fontWeight: FontWeight.w600);

  TextStyle get w500 => TextStyle(fontSize: fontSize, fontFamily: fontFamily, fontWeight: FontWeight.w500);

  TextStyle get w400 => TextStyle(fontSize: fontSize, fontFamily: fontFamily, fontWeight: FontWeight.w400);

  TextStyle get w300 => TextStyle(fontSize: fontSize, fontFamily: fontFamily, fontWeight: FontWeight.w300);

  TextStyle get w200 => TextStyle(fontSize: fontSize, fontFamily: fontFamily, fontWeight: FontWeight.w200);

  TextStyle get w100 => TextStyle(fontSize: fontSize, fontFamily: fontFamily, fontWeight: FontWeight.w100);
}
