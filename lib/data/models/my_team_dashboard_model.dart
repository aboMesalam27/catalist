class MyTeamDashboardModel {
  String? message;
  int? code;
  Data? data;

  MyTeamDashboardModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  List<TeamDashboardModules>? teamDashboardModules;

  Data.fromJson(Map<String, dynamic> json) {
    teamDashboardModules = List.from(json['teamDashboardModules'])
        .map((e) => TeamDashboardModules.fromJson(e))
        .toList();
  }
}

class TeamDashboardModules {
  int? id;
  String? slaname;
  String? imagePath;

  TeamDashboardModules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slaname = json['slaname'];
    imagePath = json['imagePath'];
  }
}
