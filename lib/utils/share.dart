part of '../utilities.dart';

shareImage({@required String title, @required String url}) async {
  var request = await HttpClient().getUrl(Uri.parse(url));
  await Share.file(title, "$title.png", await consolidateHttpClientResponseBytes(await request.close()), 'image/jpg');
}
