class UserCheckInModel {
  String? message;
  int? code;

  UserCheckInModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
  }
}
