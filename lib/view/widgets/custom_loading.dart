
import 'package:catalist/shared/index_shared.dart';

import '../../core/theme/colors.dart';


Widget customLoading() {
  return Center(
    child: SizedBox(
      height: 30.h,
      width: 30.w,
      child: const CircularProgressIndicator(
        color: AppColors.teal,
        strokeWidth: 2,
      ),
    ),
  );
}
