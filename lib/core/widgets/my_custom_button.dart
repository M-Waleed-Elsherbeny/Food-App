import 'package:flutter/material.dart';
import 'package:food_app/core/style/colors/app_colors.dart';
import 'package:food_app/core/style/fonts/app_text_style.dart';
import 'package:food_app/core/widgets/custom_text.dart';

class MyCustomButton extends StatelessWidget {
  const MyCustomButton({
    super.key,
    this.onPressed,
    this.text,
    this.color,
    this.style,
    this.width,
    this.height,
    this.child,
  });
  final VoidCallback? onPressed;
  final String? text;
  final Color? color;
  final TextStyle? style;
  final double? width, height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width ?? double.infinity,
      height: height ?? 52,
      color: color ?? AppColors.kPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onPressed: onPressed ?? () {},
      child:
          child ??
          CustomText(
            title: text ?? "Type text here",
            style: style ?? AppTextStyle.font18White600,
          ),
    );
  }
}
