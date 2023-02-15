import 'package:cached_network_image/cached_network_image.dart';
import 'package:catalist/core/utils/app_router.dart';
import 'package:catalist/shared/index_shared.dart';
import 'package:catalist/shared/network/local/cashe_helper.dart';
import 'package:catalist/view/controller/main_dashbord/main_dashbord_cubit.dart';
import 'package:catalist/view/controller/main_dashbord/main_dashbord_state.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/custom_loadin_image.dart';

class MainDashBoardScreen extends StatelessWidget {
  const MainDashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainDashboardCubit()
        ..getMainDashboard(
            userId: CacheHelper.getData(
          key: 'userId',
        )),
      child: Scaffold(
        appBar: customAppBar(
          context: context,
          isBack: true,
          title: AppText.mainDashBoard,
        ),
        body: BlocConsumer<MainDashboardCubit, MainDashboardStates>(
          listener: (context, state) {

          },
          builder: (context, state) {
            if (state is MainDashboardSuccessState) {
              return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 5.h),
                child: GridView.count(
                  childAspectRatio: 1 / 1.6,
                  primary: false,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: List.generate(
                      state.mainDashboardModel!.data!.mainDashboardModules!
                          .length, (index) {
                    return Column(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              if(index==1)
                                {
                                  Navigator.pushNamed(context, AppRouter.myTeam);

                                }
                            },
                            child: Card(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://csupervisionapi.catalist-me.com/${state.mainDashboardModel!.data!.mainDashboardModules![index].imagePath}',
                                  placeholder: (context, url) =>
                                      LoadingImageContainer(
                                    width: double.infinity.w,
                                    height: 130.h,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      LoadingImageContainer(
                                    width: double.infinity.w,
                                    height: 130.h,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          state.mainDashboardModel!.data!
                              .mainDashboardModules![index].slaname!,
                          style: const TextStyle(color: Colors.teal),
                        )
                      ],
                    );

                    // return buildItemCart(context, index, state, quantity1);
                  }),
                ),
              );
            } else {
              return customLoading();
            }
          },
        ),
      ),
    );
  }
}
