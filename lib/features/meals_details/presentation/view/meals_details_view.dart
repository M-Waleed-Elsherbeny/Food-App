import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/helper/custom_loading.dart';
import 'package:food_app/core/style/colors/app_colors.dart';
import 'package:food_app/core/style/fonts/app_text_style.dart';
import 'package:food_app/core/widgets/custom_text.dart';
import 'package:food_app/features/home/data/cubit/home_cubit.dart';
import 'package:food_app/features/home/data/cubit/home_state.dart';
import 'package:food_app/features/meals_details/data/model/meals_details_model.dart';

class MealsDetailsView extends StatefulWidget {
  const MealsDetailsView({super.key});

  @override
  State<MealsDetailsView> createState() => _MealsDetailsViewState();
}

class _MealsDetailsViewState extends State<MealsDetailsView> {
  late MealsDetailsModel meals;
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.sizeOf(context).width;
    final double deviceHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.02),
            child: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                if (state is GetMealsDetailsSuccessState) {
                  meals = state.meals.first;
                }
              },
              builder: (context, state) {
                return state is GetMealsDetailsLoadingState
                    ? Expanded(child: customLoading())
                    : state is GetMealsDetailsSuccessState &&
                          state.meals.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: deviceWidth,
                                height: deviceHeight * 0.35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      meals.image,
                                      // "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                width: deviceWidth * 0.1,
                                height: deviceHeight * 0.1,
                                margin: EdgeInsets.symmetric(
                                  horizontal: deviceWidth * 0.03,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: BoxBorder.all(
                                    color: AppColors.kScaffoldBackgroundColor,
                                    width: 2,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios_new_outlined,
                                    color: AppColors.kPrimaryColor,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                child: Container(
                                  width: deviceWidth * 0.1,
                                  height: deviceHeight * 0.1,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: deviceWidth * 0.03,
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: BoxBorder.all(
                                      color: AppColors.kScaffoldBackgroundColor,
                                      width: 2,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite_border_outlined,
                                      color: AppColors.kErrorColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          CustomText(
                            title: "Title",
                            style: AppTextStyle.font16BlackWBold,
                          ),
                          Row(
                            children: [
                              Container(
                                width: deviceWidth * 0.25,
                                height: deviceHeight * 0.05,
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 5, right: 10),
                                padding: EdgeInsets.symmetric(
                                  horizontal: deviceWidth * 0.03,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.kSecondaryColorGrey
                                      .withAlpha(50),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: CustomText(
                                  title: "Category",
                                  style: AppTextStyle.font14PrimaryBold,
                                ),
                              ),
                              Container(
                                width: deviceWidth * 0.25,
                                height: deviceHeight * 0.05,
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 5, right: 10),
                                padding: EdgeInsets.symmetric(
                                  horizontal: deviceWidth * 0.03,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.kSecondaryColorGrey
                                      .withAlpha(50),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: CustomText(
                                  title: "Aria",
                                  style: AppTextStyle.font14PrimaryBold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Center(child: CustomText(title: "No Meals Founded"));
              },
            ),
          ),
        ),
      ),
    );
  }
}
