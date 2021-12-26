import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:utilities/widgets/container.dart';

Widget imageAsset(
  final String asset, {
  final Color? color,
  final double? width,
  final double? height,
  final BoxFit fit = BoxFit.contain,
  final Clip clipBehavior = Clip.hardEdge,
  final double borderRadius = 1,
  final EdgeInsets margin = EdgeInsets.zero,
  final VoidCallback? onTap,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: margin,
        child: radius(
          child: SizedBox(
            width: width,
            height: height,
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
          ),
          radius: borderRadius,
        ),
      ),
    );

Widget imageNetwork(
  final String url, {
  final Color? color,
  final double? width,
  final double? height,
  final BoxFit fit = BoxFit.contain,
  final Clip clipBehavior = Clip.hardEdge,
  final double borderRadius = 1,
  final EdgeInsets margin = EdgeInsets.zero,
  final VoidCallback? onTap,
  final String? placeholder,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadius)),
        margin: margin,
        width: width,
        height: height,
        child: (url.length >= 10 && url.substring(url.length - 3) == "svg")
            ? SvgPicture.network(
                url,
                color: color,
                width: width,
                height: height,
                fit: fit,
                placeholderBuilder: (final _) => placeholder == null
                    ? const SizedBox()
                    : imageAsset(
                        placeholder,
                        color: color,
                        width: width,
                        height: height,
                        fit: fit,
                        clipBehavior: clipBehavior,
                      ),
              )
            : Image.network(
                url,
                color: color,
                width: width,
                height: height,
                fit: fit,
                errorBuilder: (final _, final __, final ___) => placeholder == null
                    ? const SizedBox()
                    : imageAsset(
                        placeholder,
                        color: color,
                        width: width,
                        height: height,
                        fit: fit,
                        clipBehavior: clipBehavior,
                      ),
                loadingBuilder: (final BuildContext context, final Widget child, final ImageChunkEvent? event) {
                  if (event == null) return child;
                  return placeholder == null
                      ? const SizedBox()
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
      ),
    );

Widget imageFile(
  final File file, {
  final Color? color,
  final double? width,
  final double? height,
  final BoxFit fit = BoxFit.contain,
  final Clip clipBehavior = Clip.hardEdge,
  final double borderRadius = 1,
  final EdgeInsets margin = EdgeInsets.zero,
  final VoidCallback? onTap,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: margin,
        child: radius(
          child: SizedBox(
            width: width,
            height: height,
            child: Image.file(
              file,
              color: color,
              width: width,
              height: height,
              fit: fit,
            ),
          ),
          radius: borderRadius,
        ),
      ),
    );
