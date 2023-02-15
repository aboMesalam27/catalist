

import 'package:cached_network_image/cached_network_image.dart';
import 'package:catalist/view/controller/upload_photo/index_upload_photo.dart';


import '../../shared/index_shared.dart';
import '../controller/team_attendance/team_attendance_cubit.dart';
import '../controller/team_attendance/team_attendance_state.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_loadin_image.dart';


class TeamAttendanceScreen extends StatelessWidget {
  const TeamAttendanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TeamAttendanceCubit()
        ..teamAttendance(
            userID: CacheHelper.getData(
              key: 'userId',
            ),
            childIDs: [],
            roleIDs: [15],
            pageNumber: 1,
            pageSize: 10),
      child: Scaffold(
        appBar: customAppBar(
          context: context,
          isBack: true,
          title: AppText.teamAttendance,
        ),
        body: BlocConsumer<TeamAttendanceCubit, TeamAttendanceState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is TeamAttendanceSuccessState) {
              print('object');
              print((state.teamAttendanceModel!.data!.dataList![0].imgUrl)!
                  .replaceAll(r'\', r'/'));
              return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 5.h),
                child: GridView.count(
                  childAspectRatio: 1 / 1.1,
                  primary: false,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: List.generate(
                      state.teamAttendanceModel!.data!.dataList!.length,
                      (index) {
                    return Column(
                      children: [
                        Expanded(
                          child: Card(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://www.seekpng.com/png/detail/925-9252525_man-thinking-png-person-thinking-no-background.png',
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
                        Text(
                          state.teamAttendanceModel!.data!.dataList![index]
                              .fullName!,
                          style: const TextStyle(color: Colors.teal),
                          textAlign: TextAlign.center,
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
