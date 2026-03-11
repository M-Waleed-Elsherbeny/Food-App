import 'package:flutter/material.dart';
import 'package:food_app/core/style/colors/app_colors.dart';
import 'package:food_app/core/style/fonts/app_text_style.dart';
import 'package:food_app/core/widgets/custom_text.dart';

class CustomProfileDetails extends StatelessWidget {
  const CustomProfileDetails({super.key, required this.title, this.icon});
  final String title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: deviceWidth * 0.05,
        vertical: deviceHeight * 0.03,
      ),
      leading: Icon(
        icon ?? Icons.person,
        size: 40,
        color: AppColors.kPrimaryColor,
      ),
      title: CustomText(title: title, style: AppTextStyle.font16BlackWBold),
      trailing: Icon(Icons.edit, color: AppColors.kPrimaryColor),
    );
  }
}
