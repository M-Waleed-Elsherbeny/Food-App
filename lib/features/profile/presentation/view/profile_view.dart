import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/helper/custom_loading.dart';
import 'package:food_app/core/helper/custom_snack_bar.dart';
import 'package:food_app/core/helper/spacer.dart';
import 'package:food_app/core/routes/app_route_path.dart';
import 'package:food_app/core/style/colors/app_colors.dart';
import 'package:food_app/core/style/fonts/app_text_style.dart';
import 'package:food_app/core/widgets/custom_text.dart';
import 'package:food_app/core/widgets/my_custom_button.dart';
import 'package:food_app/features/auth/data/cubit/auth_cubit.dart';
import 'package:food_app/features/auth/data/cubit/auth_state.dart';
import 'package:food_app/features/auth/data/repo/auth_repo.dart';
import 'package:food_app/features/auth/presentation/widgets/custom_login_header.dart';
import 'package:food_app/features/profile/presentation/widgets/custom_profile_details.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.sizeOf(context).width;
    final double deviceHeight = MediaQuery.sizeOf(context).height;
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(authRepo: AuthRepo())..getUser(),
      child: Scaffold(
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
                  top: deviceHeight * 0.07,
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
                      customSnackBar(context, state.errMsg);
                    } else if (state is GetUserErrorState) {
                      customSnackBar(context, state.errMsg);
                    }
                    if (state is AuthSuccessState) {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutePath.loginView,
                      );
                    }
                  },
                  builder: (context, state) {
                    return state is GetUserLoadingState
                        ? customLoading()
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                elevation: 20,
                                shadowColor: AppColors.kPrimaryLightColor,
                                color: AppColors.kScaffoldBackgroundColor,
                                child: Column(
                                  children: [
                                    CustomProfileDetails(
                                      title: state is GetUserSuccessState
                                          ? state.name
                                          : "name",
                                    ),
                                    CustomProfileDetails(
                                      title: state is GetUserSuccessState
                                          ? state.email
                                          : "email",
                                      icon: Icons.email,
                                    ),
                                  ],
                                ),
                              ),
                              heightSpace(deviceHeight * 0.1),
                              state is AuthLoadingState
                                  ? customLoading()
                                  : MyCustomButton(
                                      onPressed: () async {
                                        await context
                                            .read<AuthCubit>()
                                            .logout();
                                      },
                                      text: "Logout",
                                    ),
                            ],
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
