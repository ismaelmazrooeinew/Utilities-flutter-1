import 'package:utilities/utilities.dart';

class RequestVerificationCodeForLoginParams {
  RequestVerificationCodeForLoginParams({
    required this.mobile,
  });

  final String mobile;

  factory RequestVerificationCodeForLoginParams.fromJson(String str) => RequestVerificationCodeForLoginParams.fromMap(
        json.decode(str),
      );

  String toJson() => json.encode(toMap());

  factory RequestVerificationCodeForLoginParams.fromMap(Map<String, dynamic> json) => RequestVerificationCodeForLoginParams(
        mobile: json["mobile"],
      );

  Map<String, dynamic> toMap() => {
        "mobile": mobile,
      };
}
