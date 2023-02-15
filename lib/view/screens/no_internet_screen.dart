

import '../../core/theme/colors.dart';
import '../../shared/index_shared.dart';
import '../../shared/resourses/assets_manager.dart';

class NoInternetConnectionScreen extends StatelessWidget {
  const NoInternetConnectionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                AssetsManager.noInternet,
                height: 170.h,
              ),
              SizedBox(
                height: 20.h,
              ),
              const Text(
                AppText.youAreOffline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
