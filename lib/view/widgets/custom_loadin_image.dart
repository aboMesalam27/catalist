

import 'package:shimmer/shimmer.dart';

import '../../core/theme/colors.dart';
import '../../shared/index_shared.dart';

class LoadingImageContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final bool repeat;

  const LoadingImageContainer({
    Key? key,
    required this.width,
    required this.height,
    this.repeat = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey,
      highlightColor: AppColors.grey.withOpacity(0.2),
      loop: repeat ? 0 : 1,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.grey.withOpacity(0.2),
        ),
      ),
    );
  }
}
