import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/end_points.dart';
import '../../../data/models/login_model.dart';

import '../../../shared/network/remote/dio_helper.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  LoginModel? loginModel;

  AuthCubit() : super(LoginInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required userName,
    required password,
  }) {
    emit(LoginLoadingState());

    DioHelper.postData(
      url: EndPoints.LOGIN,
      data: {
        "userName": userName,
        "password": password,
      },
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel: loginModel!));
    }).catchError((e) {
      emit(LoginErrorState(e.toString()));
    });
  }
}
