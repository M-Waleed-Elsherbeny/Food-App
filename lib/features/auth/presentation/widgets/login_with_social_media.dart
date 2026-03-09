import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/core/assets/app_assets.dart';
import 'package:food_app/core/helper/spacer.dart';
import 'package:food_app/core/style/colors/app_colors.dart';
import 'package:food_app/core/style/fonts/app_text_style.dart';
import 'package:food_app/core/widgets/custom_text.dart';

class LoginWithSocialMedia extends StatelessWidget {
  const LoginWithSocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.sizeOf(context).height;
    double deviceWidth = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Expanded(
              child: Divider(
                color: AppColors.kSecondaryColorGrey,
                thickness: 1,
              ),
            ),
            CustomText(
              title: "  or continue with  ",
              style: AppTextStyle.font16greyW400.copyWith(fontSize: 14),
            ),
            const Expanded(
              child: Divider(
                color: AppColors.kSecondaryColorGrey,
                thickness: 1,
              ),
            ),
          ],
        ),
        heightSpace(deviceHeight * 0.02),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: deviceWidth * 0.2,
              height: deviceHeight * 0.05,
              decoration: BoxDecoration(
                color: AppColors.kPrimaryColor,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.kPrimaryColor),
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(AppAssets.svgGoogle),
            ),
            Container(
              width: deviceWidth * 0.2,
              height: deviceHeight * 0.05,
              decoration: BoxDecoration(
                color: AppColors.kPrimaryColor,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.kPrimaryColor),
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(AppAssets.svgFacebook),
            ),
            Container(
              width: deviceWidth * 0.2,
              height: deviceHeight * 0.05,
              decoration: BoxDecoration(
                color: AppColors.kPrimaryColor,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.kPrimaryColor),
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(AppAssets.svgApple),
            ),
          ],
        ),
      ],
    );
  }
}
