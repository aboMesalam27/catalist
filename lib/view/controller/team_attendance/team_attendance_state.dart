import 'index_team_attendance.dart';

abstract class TeamAttendanceState {}

class TeamAttendanceInitialState extends TeamAttendanceState {}

class TeamAttendanceLoadingState extends TeamAttendanceState {}

class TeamAttendanceSuccessState extends TeamAttendanceState {
  TeamAttendanceModel? teamAttendanceModel;
  TeamAttendanceSuccessState({required this.teamAttendanceModel});
}
