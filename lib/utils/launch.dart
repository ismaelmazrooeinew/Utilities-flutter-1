part of '../utilities.dart';

launchURL(String url, {bool universal}) async => await canLaunch(url) ? await launch(url, universalLinksOnly: universal) : throw 'Could not launch $url';

launchWhatsApp(String number) async => await launchURL("https://api.whatsapp.com/send?phone=$number");

launchTelegram(String id) async => await launchURL("https://t.me/$id");

launchInstagram(String username) async => await launchURL("https://instagram.com/$username");

call(String phone) async => await launchURL("tel:$phone");

sms(String phone) async => await launchURL("sms:$phone");
