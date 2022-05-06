import 'package:utilities/utilities.dart';

class VerifyMobileNumberForLoginParams {
  VerifyMobileNumberForLoginParams({
    required this.mobile,
    required this.verificationCode,
  });

  final String mobile;
  final String verificationCode;

  factory VerifyMobileNumberForLoginParams.fromJson(String str) => VerifyMobileNumberForLoginParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VerifyMobileNumberForLoginParams.fromMap(Map<String, dynamic> json) => VerifyMobileNumberForLoginParams(
        mobile: json["mobile"],
        verificationCode: json["verificationCode"],
      );

  Map<String, dynamic> toMap() => {
        "mobile": mobile,
        "verificationCode": verificationCode,
      };
}
