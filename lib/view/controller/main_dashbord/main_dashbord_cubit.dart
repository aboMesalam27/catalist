import '../../../shared/network/remote/dio_helper.dart';
import 'index_main_dashboard.dart';
import 'package:catalist/shared/index_shared.dart';

class MainDashboardCubit extends Cubit<MainDashboardStates> {
  MainDashboardCubit() : super(MainDashboardInitialState());
  static MainDashboardCubit get(context) => BlocProvider.of(context);
  MainDashboardModel? mainDashboardModel;
  void getMainDashboard({required int userId}) {
    emit(MainDashboardLoadingState());
    DioHelper.getData(url: EndPoints.mainDashboard(userId)).then((value) {
      mainDashboardModel = MainDashboardModel.fromJson(value.data);
      emit(MainDashboardSuccessState(mainDashboardModel: mainDashboardModel));
    }).catchError((error) {});
  }
}
