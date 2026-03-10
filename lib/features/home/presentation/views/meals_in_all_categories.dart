import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/helper/custom_loading.dart';
import 'package:food_app/core/routes/app_route_path.dart';
import 'package:food_app/core/style/colors/app_colors.dart';
import 'package:food_app/core/style/fonts/app_text_style.dart';
import 'package:food_app/core/widgets/custom_back_button.dart';
import 'package:food_app/features/home/data/cubit/home_cubit.dart';
import 'package:food_app/features/home/data/cubit/home_state.dart';
import 'package:food_app/features/home/data/models/categories_model.dart';
import 'package:food_app/features/home/data/models/meals_model.dart';
import 'package:food_app/features/home/presentation/widgets/custom_meals_card.dart';

class MealsInAllCategories extends StatelessWidget {
  const MealsInAllCategories({super.key, required this.category});
  final CategoriesModel category;

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.sizeOf(context).width;
    final double deviceHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        title: Text(
          "${category.name} Meals",
          style: AppTextStyle.font24WhiteBold,
        ),
        centerTitle: true,
        leading: CustomBackButton(),
        surfaceTintColor: AppColors.kPrimaryColor,
      ),
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state is GetMealsLoadingState
                ? customLoading()
                : state is GetMealsSuccessState && state.meals.isNotEmpty
                ? GridView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: deviceWidth * 0.03,
                      vertical: deviceHeight * 0.02,
                    ),
                    itemCount: state.meals.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: deviceHeight * 0.02,
                      mainAxisSpacing: deviceWidth * 0.03,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      final MealsModel meals = state.meals[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutePath.mealsDetailsView,
                            arguments: meals,
                          );
                        },
                        child: CustomMealsCard(
                          title: meals.title,
                          image: meals.image,
                        ),
                      );
                    },
                  )
                : const Center(child: Text('No Meals found'));
          },
        ),
      ),
    );
  }
}
