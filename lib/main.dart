import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:catalist/core/utils/constant.dart';
import 'package:catalist/view/controller/auth/auth_cubit.dart';
import 'package:catalist/view/controller/internet/internet_cubit.dart';

import 'core/debug/app_bloc_observer.dart';
import 'core/utils/app_router.dart';

import 'shared/network/local/cashe_helper.dart';
import 'shared/network/remote/dio_helper.dart';


void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();

  await CacheHelper.init();
  runApp(Catalist(
    connectivity: Connectivity(),
    appRouter: AppRouter(),
  ));
}

class Catalist extends StatefulWidget {
  final Connectivity? connectivity;
  final AppRouter appRouter;
  const Catalist({super.key, required this.appRouter, this.connectivity});

  @override
  State<Catalist> createState() => _CatalistState();
}

class _CatalistState extends State<Catalist> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => InternetCubit()..checkConnection()),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(375, 812),
        builder: (c, i) => MaterialApp(
          builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0.sp),
              child: widget!,
            );
          },
          onGenerateRoute: widget.appRouter.generateRoute,
          initialRoute: AppRouter.login,
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
