class EndPoints {
  static const String LOGIN = 'SupervisorLogin/Login';
  static const String UPLOAD_PHOTO = 'Photo/UploadSupervisorPhotos';
  static const String USER_CHECK_IN = 'User/InsertUserCheckIn';
  static const String TEAM_ATTENDANCE = 'Supervisors/TeamAttendance';
  static String mainDashboard(int userId) {
    return 'Supervisors/MainDashboard?UserId=$userId&LangId=1';
  }
  static String myTeamDashboard(int userId) {
    return 'Supervisors/TeamDashboard?UserId=$userId&LangId=1';
  }
}
