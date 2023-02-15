import 'package:catalist/shared/index_shared.dart';

import '../../core/theme/colors.dart';

class DefaultTextFiled extends StatelessWidget {
  final TextInputType keyboardType;
  final String? labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final TextEditingController? controller;
  Widget? widget;
  var onTap;
  var onChanged;
  var onFieldSubmitted;
  var validate;
  InputBorder? border;
  InputBorder? enabledBorder;
  InputBorder? focusedBorder;
  BorderSide? borderSide;
  bool? filled;
  bool? readOnly;
  Color? fillColor;
  List<TextInputFormatter>? inputFormatters;
  TextStyle? hintStyle;
  int? maxLength;
  int? minLines;
  String? hintText;
  DefaultTextFiled(
      {super.key,
      required this.keyboardType,
      this.labelText,
      this.suffixIcon,
      this.prefixIcon,
      this.obscureText,
      this.controller,
      this.widget,
      this.onTap,
      this.onChanged,
      this.onFieldSubmitted,
      this.validate,
      this.border,
      this.enabledBorder,
      this.focusedBorder,
      this.fillColor,
      this.filled,
      this.borderSide,
      this.maxLength,
      this.inputFormatters,
      this.minLines,
      this.hintText,
      this.hintStyle,
      required this.readOnly});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            inputFormatters: inputFormatters,
            maxLength: maxLength,
            minLines: minLines,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validate,
            onTap: onTap,
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmitted,
            readOnly: readOnly!,
            controller: controller,
            obscureText: obscureText ?? false,
            cursorColor: AppColors.black,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText ?? '',
              filled: filled ?? false,
              fillColor: fillColor ?? AppColors.white,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              labelText: labelText,
              border: border ?? const UnderlineInputBorder(),
            ),
          ),
        ),
        widget ?? Container()
      ],
    );
  }
}
