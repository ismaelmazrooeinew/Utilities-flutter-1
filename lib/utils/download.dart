part of '../utilities.dart';

downloadImage({required List<String> imageUrls, Function? action}) async => imageUrls.forEach((i) async {
      await get(
        url: i,
        action: (response) async => await ImageGallerySaver.saveImage(response!.bodyBytes, name: DateTime.now().toString()),
        error: (response) {},
      );
      if (i == imageUrls.last) action!();
    });
