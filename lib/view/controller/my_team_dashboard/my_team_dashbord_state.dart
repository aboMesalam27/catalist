import 'index_team_dashboard.dart';

abstract class MyTeamDashboardStates {}

class MyTeamDashboardInitialState extends MyTeamDashboardStates {}

class MyTeamDashboardLoadingState extends MyTeamDashboardStates {}

class MyTeamDashboardSuccessState extends MyTeamDashboardStates {
  MyTeamDashboardModel ?myTeamDashboardModel;
  MyTeamDashboardSuccessState({required this.myTeamDashboardModel});
}
