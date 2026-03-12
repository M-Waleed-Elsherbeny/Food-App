import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/helper/custom_loading.dart';
import 'package:food_app/core/helper/spacer.dart';
import 'package:food_app/core/services/hive_services.dart';
import 'package:food_app/core/style/fonts/app_text_style.dart';
import 'package:food_app/core/widgets/custom_text.dart';
import 'package:food_app/features/home/data/cubit/home_cubit.dart';
import 'package:food_app/features/home/data/cubit/home_state.dart';
import 'package:food_app/features/meals_details/data/model/meals_details_model.dart';
import 'package:food_app/features/meals_details/presentation/widgets/custom_area_and_category.dart';
import 'package:food_app/features/meals_details/presentation/widgets/custom_image_details.dart';
import 'package:food_app/features/meals_details/presentation/widgets/custom_ingredients_and_measures.dart';
import 'package:food_app/features/meals_details/presentation/widgets/custom_title_details.dart';
import 'package:food_app/main.dart';

class MealsDetailsView extends StatefulWidget {
  const MealsDetailsView({super.key});

  @override
  State<MealsDetailsView> createState() => _MealsDetailsViewState();
}

class _MealsDetailsViewState extends State<MealsDetailsView> {
  late MealsDetailsModel meals;
  bool isFavorite = false;
  openBox() async {
    box = await HiveServices.openHiveBox(HiveServices.favoriteBox);
  }

  @override
  void initState() {
    openBox();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.sizeOf(context).width;
    final double deviceHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
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
                  ? Center(child: Expanded(child: customLoading()))
                  : state is GetMealsDetailsSuccessState &&
                        state.meals.isNotEmpty
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomImageDetails(
                            imageUrl: meals.image,
                            isFavorite: isFavorite,
                            onFavoritePressed: () async {
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                              await box!.put(HiveServices.favoriteBoxId, [
                                {
                                  HiveServices.favoriteBoxImage: meals.image,
                                  HiveServices.favoriteBoxCategory:
                                      meals.category,
                                  HiveServices.favoriteBoxArea: meals.area,
                                },
                              ]);
                              log(
                                box!.get(HiveServices.favoriteBoxId).toString(),
                              );
                              log(
                                box!.get(HiveServices.favoriteBox).toString(),
                              );
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: deviceWidth * 0.03,
                              vertical: deviceHeight * 0.02,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  title: meals.title,
                                  style: AppTextStyle.font24BlackW700,
                                ),
                                CustomAreaAndCategory(
                                  area: meals.area,
                                  category: meals.category,
                                ),
                                heightSpace(deviceHeight * 0.02),
                                CustomTitleDetails(title: "Ingredients"),
                                CustomIngredientsAndMeasures(
                                  imageUrl: meals.ingredient1 ?? "",
                                  measure: meals.measure1 ?? "",
                                  ingredient: meals.ingredient1 ?? "",
                                ),
                                CustomIngredientsAndMeasures(
                                  imageUrl: meals.ingredient2 ?? "",
                                  measure: meals.measure2 ?? "",
                                  ingredient: meals.ingredient2 ?? "",
                                ),
                                CustomIngredientsAndMeasures(
                                  imageUrl: meals.ingredient3 ?? "",
                                  measure: meals.measure3 ?? "",
                                  ingredient: meals.ingredient3 ?? "",
                                ),
                                CustomIngredientsAndMeasures(
                                  imageUrl: meals.ingredient4 ?? "",
                                  measure: meals.measure4 ?? "",
                                  ingredient: meals.ingredient4 ?? "",
                                ),
                                CustomIngredientsAndMeasures(
                                  imageUrl: meals.ingredient5 ?? "",
                                  measure: meals.measure5 ?? "",
                                  ingredient: meals.ingredient5 ?? "",
                                ),
                                CustomIngredientsAndMeasures(
                                  imageUrl: meals.ingredient6 ?? "",
                                  measure: meals.measure6 ?? "",
                                  ingredient: meals.ingredient6 ?? "",
                                ),
                                CustomIngredientsAndMeasures(
                                  imageUrl: meals.ingredient7 ?? "",
                                  measure: meals.measure7 ?? "",
                                  ingredient: meals.ingredient7 ?? "",
                                ),
                                CustomIngredientsAndMeasures(
                                  imageUrl: meals.ingredient8 ?? "",
                                  measure: meals.measure8 ?? "",
                                  ingredient: meals.ingredient8 ?? "",
                                ),
                                heightSpace(deviceHeight * 0.02),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Center(child: CustomText(title: "No Meals Founded"));
            },
          ),
        ),
      ),
    );
  }
}
