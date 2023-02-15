class TeamAttendanceModel {
  String? message;
  int? code;
  Data? data;

  TeamAttendanceModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  List<DataList>? dataList;
  int? totalCount;

  Data.fromJson(Map<String, dynamic> json) {
    dataList =
        List.from(json['dataList']).map((e) => DataList.fromJson(e)).toList();
    totalCount = json['totalCount'];
  }
}

class DataList {
  int? id;
  String? userName;
  String? fullName;
  String? attendance;
  String? imgUrl;
  ActionType? actionType;
  String? checkInDate;

  DataList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    fullName = json['fullName'];
    attendance = json['attendance'];
    imgUrl = json['imgUrl'];
    actionType = ActionType.fromJson(json['actionType']);
    checkInDate = json['checkInDate'];
  }
}

class ActionType {
  Null? id;
  Null? value;
  Null? color;

  ActionType.fromJson(Map<String, dynamic> json) {
    id = null;
    value = null;
    color = null;
  }
}
