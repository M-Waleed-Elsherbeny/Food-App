import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/helper/custom_loading.dart';
import 'package:food_app/core/routes/app_route_path.dart';
import 'package:food_app/core/style/colors/app_colors.dart';
import 'package:food_app/core/style/fonts/app_text_style.dart';
import 'package:food_app/features/home/data/cubit/home_cubit.dart';
import 'package:food_app/features/home/data/cubit/home_state.dart';
import 'package:food_app/features/home/data/repo/home_repo.dart';
import 'package:food_app/features/home/presentation/widgets/custom_categories_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.sizeOf(context).width;
    final double deviceHeight = MediaQuery.sizeOf(context).height;
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(HomeRepo())..getCategories(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kPrimaryColor,
          title: Text("All Categories", style: AppTextStyle.font24WhiteBold),
          centerTitle: true,
          leading: SizedBox.shrink(),
          surfaceTintColor: AppColors.kPrimaryColor,
        ),
        body: SafeArea(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return state is GetCategoriesLoadingState
                  ? customLoading()
                  : state is GetCategoriesSuccessState &&
                        state.categories.isNotEmpty
                  ? GridView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: deviceWidth * 0.03,
                        vertical: deviceHeight * 0.02,
                      ),
                      itemCount: state.categories.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: deviceHeight * 0.02,
                        mainAxisSpacing: deviceWidth * 0.03,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        final category = state.categories[index];
                        return GestureDetector(
                          onTap: () {                            
                            Navigator.pushNamed(
                              context,
                              AppRoutePath.mealsView,
                              arguments: category
                            );
                          },
                          child: CustomCategoriesCard(
                            image: category.image,
                            title: category.name,
                          ),
                        );
                      },
                    )
                  : const Center(child: Text('No categories found'));
            },
          ),
        ),
      ),
    );
  }
}
