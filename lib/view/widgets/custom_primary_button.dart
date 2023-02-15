import 'package:catalist/shared/index_shared.dart';

import '../../core/theme/colors.dart';

class PrimaryButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? raduis;
  BorderSide? borderSide;
  TextStyle? textStyle;
  final String? text;
  Color? btnColor;
  var onPressed;
  PrimaryButton({
    this.width,
    this.height,
    this.raduis,
    this.borderSide,
    this.textStyle,
    required this.text,
    required this.onPressed,
    this.btnColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 40.h,
      width: width ?? 220.w,
      child: MaterialButton(
        elevation: 0,
        color: btnColor ?? AppColors.white,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(raduis ?? 25.r),
            side: borderSide ?? const BorderSide()),
        child: Text(
          text.toString(),
          style: textStyle ?? const TextStyle(),
        ),
      ),
    );
  }
}
