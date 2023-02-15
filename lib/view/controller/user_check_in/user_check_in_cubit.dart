import 'package:catalist/shared/index_shared.dart';

import '../../../shared/network/remote/dio_helper.dart';
import 'index_user_check_in.dart';

class UserCheckInCubit extends Cubit<UserCheckInState> {
  UserCheckInCubit() : super(UserCheckInInitialState());
  static UserCheckInCubit get(context) => BlocProvider.of(context);

  UserCheckInModel? userCheckInModel;
  void userCheckIn({
    required int userID,
    required int userLatitude,
    required int userLongitude,
    required String photoPath,
    required String comment,
  }) {
    emit(UserCheckInLoadingState());
    DioHelper.postData(
      url: EndPoints.USER_CHECK_IN,
      data: {
        "userID": userID,
        "userLatitude": userLatitude,
        "userLongitude": userLongitude,
        "photoPath": photoPath,
        "comment": comment,
      },
      token: CacheHelper.getData(key: 'token'),
    ).then((value) {
      print(value.data);
      userCheckInModel = UserCheckInModel.fromJson(value.data);
      emit(UserCheckInSuccessState());
    });
  }
}
