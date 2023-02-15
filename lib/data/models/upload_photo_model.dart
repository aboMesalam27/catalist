class UploadPhotoModel {
  String? message;
  int? code;
  Data? data;

  UploadPhotoModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  List<String>? imagePathes;
  String? message;

  Data.fromJson(Map<String, dynamic> json) {
    imagePathes = List.castFrom<dynamic, String>(json['imagePathes']);
    message = json['message'];
  }
}
