import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/helper/custom_loading.dart';
import 'package:food_app/core/helper/custom_snack_bar.dart';
import 'package:food_app/core/helper/password_and_email_validations.dart';
import 'package:food_app/core/helper/spacer.dart';
import 'package:food_app/core/routes/app_route_path.dart';
import 'package:food_app/core/style/colors/app_colors.dart';
import 'package:food_app/core/style/fonts/app_text_style.dart';
import 'package:food_app/core/widgets/custom_text.dart';
import 'package:food_app/core/widgets/have_account_or_not.dart';
import 'package:food_app/core/widgets/my_custom_button.dart';
import 'package:food_app/features/auth/data/cubit/auth_cubit.dart';
import 'package:food_app/features/auth/data/cubit/auth_state.dart';
import 'package:food_app/features/auth/presentation/widgets/custom_login_header.dart';
import 'package:food_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:food_app/features/auth/presentation/widgets/login_with_social_media.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isPassword = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;
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
              title: "Login",
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
              child: BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthErrorState) {
                    customSnackBar(context, "Error in Email or Password");
                  } else if (state is AuthSuccessState) {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutePath.layoutBottomNavigationBar,
                    );
                  }
                },
                builder: (context, state) {
                  return state is AuthLoadingState
                      ? customLoading()
                      : SingleChildScrollView(
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextField(
                                  controller: emailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Email can't be empty";
                                    }
                                    if (!PasswordAndEmailValidations.isValidEmail(
                                      email: value,
                                    )) {
                                      return "Please enter a valid Email";
                                    }
                                    return null;
                                  },
                                  labelText: "Enter your Email",
                                  prefixIcon: const Icon(
                                    Icons.email_outlined,
                                    color: AppColors.kPrimaryColor,
                                  ),
                                ),
                                heightSpace(deviceHeight * 0.02),
                                CustomTextField(
                                  controller: passwordController,
                                  isPassword: !isPassword,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Password can't be empty";
                                    }
                                    if (value.length < 8) {
                                      return "Password must be at least 8 characters";
                                    }
                                    return null;
                                  },
                                  labelText: "Enter your Password",
                                  prefixIcon: const Icon(
                                    Icons.lock_outline,
                                    color: AppColors.kPrimaryColor,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      isPassword
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: AppColors.kPrimaryColor,
                                    ),
                                    onPressed: () {
                                      isPassword = !isPassword;
                                      setState(() {});
                                    },
                                  ),
                                ),
                                heightSpace(deviceHeight * 0.01),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: CustomText(
                                    title: "Forgot password?",
                                    style: AppTextStyle.font14BlueW500Underline,
                                  ),
                                ),
                                heightSpace(deviceHeight * 0.03),
                                MyCustomButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      context.read<AuthCubit>().login(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                    }
                                  },
                                  text: "Login",
                                ),
                                heightSpace(deviceHeight * 0.03),
                                MyCustomButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      AppRoutePath.layoutBottomNavigationBar,
                                    );
                                  },
                                  text: "Continue as Guest",
                                ),
                                heightSpace(deviceHeight * 0.03),
                                const LoginWithSocialMedia(),
                                heightSpace(deviceHeight * 0.03),
                                const HaveAccountOrNot(),
                                heightSpace(deviceHeight * 0.01),
                              ],
                            ),
                          ),
                        );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
