class LoginModel {
  String? message;
  int? code;
  Data? data;

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  UserData? userData;

  Data.fromJson(Map<String, dynamic> json) {
    userData = UserData.fromJson(json['userData']);
  }
}

class UserData {
  Tokens? tokens;
  Userinfo? userinfo;

  UserData.fromJson(Map<String, dynamic> json) {
    tokens = Tokens.fromJson(json['tokens']);
    userinfo = Userinfo.fromJson(json['userinfo']);
  }
}

class Tokens {
  String? accessToken;
  String? refreshToken;

  Tokens.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }
}

class Userinfo {
  int? userId;
  String? userEmail;
  String? fullName;
  String? userTelephone;
  String? photoPath;
  String? agency;
  String? role;
  bool? checkedIn;

  Userinfo.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userEmail = json['userEmail'];
    fullName = json['fullName'];
    userTelephone = json['userTelephone'];
    photoPath = json['photoPath'];
    agency = json['agency'];
    role = json['role'];
    checkedIn = json['checkedIn'];
  }
}
