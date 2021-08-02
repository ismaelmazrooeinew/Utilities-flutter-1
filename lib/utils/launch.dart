part of '../utilities.dart';

Future<void> launchURL(
  String url, {
  bool universal = true,
}) async =>
    await canLaunch(url) ? await launch(url, universalLinksOnly: universal) : throw 'Could not launch $url';

void launchWhatsApp(String number) async => await launchURL("https://api.whatsapp.com/send?phone=$number");

void launchTelegram(String id) async => await launchURL("https://t.me/$id");

void launchInstagram(String username) async => await launchURL("https://instagram.com/$username");

void call(String phone) async => await launchURL("tel:$phone");

void sms(String phone) async => await launchURL("sms:$phone");

void email(String email, String subject) {
  String? encodeQueryParameters(
    Map<String, String> params,
  ) =>
      params.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');

  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: email,
    query: encodeQueryParameters(<String, String>{
      'subject': subject,
    }),
  );

  launch(emailLaunchUri.toString());
}
