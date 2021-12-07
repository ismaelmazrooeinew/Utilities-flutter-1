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
  VoidCallback? onTap,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Padding(
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
                  fit: fit,
                ),
          radius: borderRadius,
        ),
      ),
    );

Widget imageNetwork(
  String url, {
  Color? color,
  double? width,
  double? height,
  BoxFit fit = BoxFit.contain,
  Clip clipBehavior = Clip.hardEdge,
  double borderRadius = 1,
  EdgeInsets margin = EdgeInsets.zero,
  VoidCallback? onTap,
  String? placeholder,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: margin,
        child: radius(
          child: Image.network(
            url,
            color: color,
            width: width,
            height: height,
            fit: fit,
            errorBuilder: (_, __, ___) => placeholder == null
                ? SizedBox()
                : imageAsset(
                    placeholder,
                    color: color,
                    width: width,
                    height: height,
                    fit: fit,
                    clipBehavior: clipBehavior,
                  ),
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? event) {
              if (event == null) return child;
              return placeholder == null
                  ? SizedBox()
                  : imageAsset(
                      placeholder,
                      color: color,
                      width: width,
                      height: height,
                      fit: fit,
                      clipBehavior: clipBehavior,
                    );
            },
          ),
          radius: borderRadius,
        ),
      ),
    );

Widget imageFile(
  File file, {
  Color? color,
  double? width,
  double? height,
  BoxFit fit = BoxFit.contain,
  Clip clipBehavior = Clip.hardEdge,
  double borderRadius = 1,
  EdgeInsets margin = EdgeInsets.zero,
  VoidCallback? onTap,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: margin,
        child: radius(
          child: Image.file(
            file,
            color: color,
            width: width,
            height: height,
            fit: fit,
          ),
          radius: borderRadius,
        ),
      ),
    );
