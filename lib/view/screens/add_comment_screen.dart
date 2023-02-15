import 'package:catalist/core/utils/app_router.dart';
import 'package:catalist/shared/index_shared.dart';
import 'package:catalist/shared/network/local/cashe_helper.dart';
import 'package:catalist/view/controller/user_check_in/user_check_in_cubit.dart';
import 'package:catalist/view/controller/user_check_in/user_check_in_state.dart';

import '../../core/theme/colors.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_primary_button.dart';

class AddCommentScreen extends StatelessWidget {
  TextEditingController commentController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  AddCommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCheckInCubit(),
      child: BlocConsumer<UserCheckInCubit, UserCheckInState>(
        listener: (context, state) {
          if(state is UserCheckInSuccessState)
            {
              Navigator.pushNamed(context, AppRouter.mainDashBoard);
            }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: customAppBar(
              context: context,
              isBack: true,
              title: AppText.addComment,
            ),
            body: Center(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 3.h),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultTextFiled(
                        readOnly: false,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Enter your comment';
                          }
                        },
                        controller: commentController,
                        keyboardType: TextInputType.emailAddress,
                        hintText: AppText.commentHere,
                      ),
                      SizedBox(
                        height: 50.h,
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
                              text: AppText.checkIn,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  UserCheckInCubit.get(context).userCheckIn(
                                    comment: commentController.text,
                                    photoPath:
                                        CacheHelper.getData(key: 'imagePath'),
                                    userID: CacheHelper.getData(key: 'userId'),
                                    userLatitude: 0,
                                    userLongitude: 0,
                                  );
                                }
                              });
                        },
                        condition: state is! UserCheckInLoadingState,
                        fallback: (context) => customLoading(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
