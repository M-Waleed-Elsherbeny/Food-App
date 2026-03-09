import 'package:flutter/material.dart';
import 'package:food_app/core/style/colors/app_colors.dart';
import 'package:food_app/core/style/fonts/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.labelText,
    this.controller,
    this.validator,
    this.keyboardType,
    this.isPassword = false,
    this.suffixIcon,
    this.prefixIcon,
  });
  final String? labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool isPassword;
  final Widget? suffixIcon, prefixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      cursorColor: AppColors.kPrimaryColor,
      cursorErrorColor: Colors.redAccent,
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: isPassword,
      obscuringCharacter: "*",
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: AppTextStyle.font14BlackW600.copyWith(fontSize: 16),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.kSecondaryColorGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.kSecondaryColorGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.kPrimaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.kErrorColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.kSecondaryColorGrey),
        ),
        hintText: labelText ?? "Enter text here",
        hintStyle: AppTextStyle.font16greyW400,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
    );
  }
}
