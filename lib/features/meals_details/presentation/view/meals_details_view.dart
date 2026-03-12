import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/helper/custom_loading.dart';
import 'package:food_app/core/helper/custom_snack_bar.dart';
import 'package:food_app/core/helper/spacer.dart';
import 'package:food_app/core/services/hive_services.dart';
import 'package:food_app/core/style/colors/app_colors.dart';
import 'package:food_app/core/style/fonts/app_text_style.dart';
import 'package:food_app/core/widgets/custom_text.dart';
import 'package:food_app/features/favorite/data/model/favorite_food_model.dart';
import 'package:food_app/features/home/data/cubit/home_cubit.dart';
import 'package:food_app/features/home/data/cubit/home_state.dart';
import 'package:food_app/features/meals_details/data/model/meals_details_model.dart';
import 'package:food_app/features/meals_details/presentation/widgets/custom_area_and_category.dart';
import 'package:food_app/features/meals_details/presentation/widgets/custom_image_details.dart';
import 'package:food_app/features/meals_details/presentation/widgets/custom_ingredients_and_measures.dart';
import 'package:food_app/features/meals_details/presentation/widgets/custom_title_details.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MealsDetailsView extends StatefulWidget {
  const MealsDetailsView({super.key});

  @override
  State<MealsDetailsView> createState() => _MealsDetailsViewState();
}

class _MealsDetailsViewState extends State<MealsDetailsView> {
  late MealsDetailsModel meals;
  late bool isFavorite;
  String userId = Supabase.instance.client.auth.currentUser!.id;

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
                isFavorite = HiveServices.isFavorite(userId, meals.id);
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
                              isFavorite ?
                                  await HiveServices.removeFavorite(
                                    userId,
                                    meals.id,
                                  ).then((_) {
                                    customSnackBar(
                                      context,
                                      "Deleted Successfully",
                                      backgroundColor: AppColors.kSuccessColor,
                                    );
                                    setState(() {});
                                  }):
                                
                              await HiveServices.addFavorite(
                                userId,
                                FavoriteFoodModel(
                                  id: meals.id,
                                  name: meals.title,
                                  image: meals.image,
                                  area: meals.area,
                                  category: meals.category,
                                ),
                              );

                              setState(() {
                                isFavorite = !isFavorite;
                              });
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
