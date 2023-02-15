import 'package:catalist/core/utils/app_router.dart';
import 'package:catalist/shared/network/local/cashe_helper.dart';
import 'package:catalist/shared/resourses/app_validate.dart';
import '../../core/theme/colors.dart';
import '../controller/auth/index_auth.dart';
import '../controller/internet/index_internet.dart';
import 'package:catalist/shared/index_shared.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_primary_button.dart';
import 'index_screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocBuilder<InternetCubit, InternetStates>(
        builder: (context, state) {
          if (state is InternetConnected) {
            return BlocConsumer<InternetCubit, InternetStates>(
              listener: (context, state) {},
              builder: (context, state) {
                return BlocConsumer<AuthCubit, AuthStates>(
                  builder: (BuildContext context, state) {
                    return Scaffold(
                      backgroundColor: AppColors.white,
                      appBar: customAppBar(
                          context: context,
                          title: AppText.login,
                          isBack: false),
                      body: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25.0.w, vertical: 3.h),
                              child: DefaultTextFiled(
                                readOnly: false,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return AppValidateStrings.enterYourEmail;
                                  }
                                },
                                // validate: (value) =>
                                //     AppValidate.validateEmail(value, context),
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                hintText: AppText.email,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25.0.w, vertical: 3.h),
                              child: DefaultTextFiled(
                                readOnly: false,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return AppValidateStrings.enterYourPassword;
                                  }
                                },
                                // validate: (value) =>
                                //     AppValidate.validatePassword(
                                //         value, context),
                                controller: passwordController,
                                obscureText: !_passwordVisible,
                                hintText: AppText.password,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: AppColors.black,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                                keyboardType: TextInputType.visiblePassword,
                              ),
                            ),
                            SizedBox(
                              height: 45.h,
                            ),
                            ConditionalBuilder(
                              builder: (context) {
                                return PrimaryButton(
                                    width: 260.w,
                                    height: 44.h,
                                    textStyle:
                                        const TextStyle(color: AppColors.white),
                                    borderSide: const BorderSide(
                                      color: AppColors.teal,
                                    ),
                                    btnColor: AppColors.teal,
                                    text: AppText.signIn,
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        AuthCubit.get(context).userLogin(
                                          userName: emailController.text,
                                          password: passwordController.text,
                                        );
                                      }
                                    });
                              },
                              condition: state is! LoginLoadingState,
                              fallback: (context) => customLoading(),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  listener: (context, state) {
                    if (state is LoginSuccessState) {
                      CacheHelper.saveData(
                        key: 'token',
                        value: state
                            .loginModel.data!.userData!.tokens!.accessToken,
                      );
                      CacheHelper.saveData(
                        key: 'userId',
                        value:
                            state.loginModel.data!.userData!.userinfo!.userId,
                      );
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRouter.uploadPhoto,
                        (route) => false,
                      );
                      if (kDebugMode) {
                        print('success');
                      }
                    }
                  },
                );
              },
            );
          } else {
            return const NoInternetConnectionScreen();
          }
        },
      ),
    );
  }
}
