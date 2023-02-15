
import 'index_main_dashboard.dart';

abstract class MainDashboardStates {}

class MainDashboardInitialState extends MainDashboardStates {}

class MainDashboardLoadingState extends MainDashboardStates {}

class MainDashboardSuccessState extends MainDashboardStates {
  MainDashboardModel ?mainDashboardModel;
  MainDashboardSuccessState({required this.mainDashboardModel});
}
