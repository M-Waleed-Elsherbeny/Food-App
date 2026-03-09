
import 'package:flutter/material.dart';
import 'package:food_app/core/routes/app_route_path.dart';
import 'package:food_app/core/style/fonts/app_text_style.dart';
import 'package:food_app/core/widgets/custom_text.dart';

class HaveAccountOrNot extends StatelessWidget {
  const HaveAccountOrNot({super.key, this.isLogin = true});
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          title: isLogin
              ? "Don't have an account? "
              : "Already have an account? ",
          style: AppTextStyle.font16greyW400.copyWith(fontSize: 14),
        ),
        GestureDetector(
          onTap: () {
            isLogin
                ? Navigator.pushNamed(context, AppRoutePath.signUpView)
                : Navigator.pop(context);
          },
          child: CustomText(
            title: isLogin ? "Sign Up" : "Login",
            style: AppTextStyle.font14PrimaryBold,
          ),
        ),
      ],
    );
  }
}
