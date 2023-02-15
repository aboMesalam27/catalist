class MainDashboardModel {
  String? message;
  int? code;
  Data? data;

  MainDashboardModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  List<MainDashboardModules>? mainDashboardModules;

  Data.fromJson(Map<String, dynamic> json) {
    mainDashboardModules = List.from(json['mainDashboardModules'])
        .map((e) => MainDashboardModules.fromJson(e))
        .toList();
  }
}

class MainDashboardModules {
  int? id;
  String? slaname;
  String? imagePath;

  MainDashboardModules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slaname = json['slaname'];
    imagePath = json['imagePath'];
  }
}
