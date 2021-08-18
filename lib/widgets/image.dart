part of '../utilities.dart';

Widget imageAsset(
  String asset, {
  Color? color,
  double? width,
  double? height,
  BoxFit fit = BoxFit.contain,
  Clip clipBehavior = Clip.hardEdge,
  double borderRadius = 1,
  EdgeInsets margin = EdgeInsets.zero,
}) =>
    Padding(
      padding: margin,
      child: radius(
        child: asset.substring(asset.length - 3).toLowerCase() == "svg"
            ? SvgPicture.asset(
                asset,
                color: color,
                width: width,
                height: height,
                fit: fit,
                clipBehavior: clipBehavior,
              )
            : Image.asset(
                asset,
                color: color,
                width: width,
                height: height,
                cacheWidth: width?.toInt(),
                cacheHeight: height?.toInt(),
                fit: fit,
              ),
        radius: borderRadius,
      ),
    );
