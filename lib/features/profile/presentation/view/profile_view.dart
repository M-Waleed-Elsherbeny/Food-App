import 'package:flutter/material.dart';
import 'package:food_app/core/helper/spacer.dart';
import 'package:food_app/core/style/colors/app_colors.dart';
import 'package:food_app/core/style/fonts/app_text_style.dart';
import 'package:food_app/core/widgets/custom_text.dart';
import 'package:food_app/core/widgets/my_custom_button.dart';
import 'package:food_app/features/auth/presentation/widgets/custom_login_header.dart';
import 'package:food_app/features/profile/presentation/widgets/custom_profile_details.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.sizeOf(context).width;
    final double deviceHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Column(
        children: [
          CustomLoginHeader(),
          Container(
            width: deviceWidth,
            height: deviceHeight * 0.1,
            alignment: Alignment.center,
            child: CustomText(
              title: "Profile",
              style: AppTextStyle.font30WhiteBold,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top: deviceHeight * 0.05,
                right: deviceWidth * 0.1,
                left: deviceWidth * 0.1,
              ),
              width: deviceWidth * 0.97,
              height: deviceHeight * 0.7,
              decoration: BoxDecoration(
                color: AppColors.kScaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                ),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 20,
                    shadowColor: AppColors.kPrimaryLightColor,
                    color: AppColors.kScaffoldBackgroundColor,
                    child: Column(
                      children: [
                        CustomProfileDetails(title: "Name"),
                        CustomProfileDetails(
                          title: "phone number",
                          icon: Icons.phone,
                        ),
                        CustomProfileDetails(
                          title: "email@gmail.com",
                          icon: Icons.email,
                        ),
                      ],
                    ),
                  ),
                  heightSpace(deviceHeight * 0.03),
                  MyCustomButton(
                    onPressed: () {
                      // Navigator.pushReplacementNamed(
                      //   context,
                      //   AppRoutePath.layoutBottomNavigationBar,
                      // );
                    },
                    text: "Logout",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
