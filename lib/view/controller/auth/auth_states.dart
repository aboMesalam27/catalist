

import '../../../data/models/login_model.dart';

abstract class AuthStates {}

class LoginInitialState extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {
  final LoginModel loginModel;
  LoginSuccessState({required this.loginModel});
}

class LoginErrorState extends AuthStates {
  final String error;
  LoginErrorState(this.error);
}
