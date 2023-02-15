import 'package:catalist/shared/index_shared.dart';
import '../../../shared/network/remote/dio_helper.dart';
import 'index_team_attendance.dart';
class TeamAttendanceCubit extends Cubit<TeamAttendanceState> {
  TeamAttendanceCubit() : super(TeamAttendanceInitialState());
  static TeamAttendanceCubit get(context) => BlocProvider.of(context);
  TeamAttendanceModel? teamAttendanceModel;
  void teamAttendance({
    required int pageNumber,
    required int pageSize,
    required List childIDs,
    required List roleIDs,
    required int userID,
  }) {
    emit(TeamAttendanceLoadingState());
    DioHelper.postData(url: EndPoints.TEAM_ATTENDANCE, data: {
      "pageNumber": pageNumber,
      "pageSize": pageSize,
      "childIDs": childIDs,
      "roleIDs": roleIDs,
      "userID": userID
    }).then((value) {
      teamAttendanceModel = TeamAttendanceModel.fromJson(value.data);
      emit(
          TeamAttendanceSuccessState(teamAttendanceModel: teamAttendanceModel));
    }).catchError((error) {});
  }
}
