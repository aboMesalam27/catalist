import '../../../shared/network/remote/dio_helper.dart';
import 'index_team_dashboard.dart';
import 'package:catalist/shared/index_shared.dart';

class MyTeamDashboardCubit extends Cubit<MyTeamDashboardStates> {
  MyTeamDashboardCubit() : super(MyTeamDashboardInitialState());
  static MyTeamDashboardCubit get(context) => BlocProvider.of(context);
  MyTeamDashboardModel? myTeamDashboardModel;
  void myTeamDashboard({required int userId}) {
    emit(MyTeamDashboardLoadingState());
    DioHelper.getData(url: EndPoints.myTeamDashboard(userId)).then((value) {
      myTeamDashboardModel = MyTeamDashboardModel.fromJson(value.data);
      emit(MyTeamDashboardSuccessState(
          myTeamDashboardModel: myTeamDashboardModel));
    }).catchError(
      (error) {},
    );
  }
}
