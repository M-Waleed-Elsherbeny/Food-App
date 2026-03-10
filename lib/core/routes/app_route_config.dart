import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/routes/app_route_path.dart';
import 'package:food_app/features/auth/data/cubit/auth_cubit.dart';
import 'package:food_app/features/auth/data/repo/auth_repo.dart';
import 'package:food_app/features/auth/presentation/view/login_view.dart';
import 'package:food_app/features/auth/presentation/view/sign_up_view.dart';
import 'package:food_app/features/home/data/cubit/home_cubit.dart';
import 'package:food_app/features/home/data/models/categories_model.dart';
import 'package:food_app/features/home/data/models/meals_model.dart';
import 'package:food_app/features/home/data/repo/home_repo.dart';
import 'package:food_app/features/home/presentation/views/meals_in_all_categories.dart';
import 'package:food_app/features/meals_details/presentation/view/meals_details_view.dart';
import 'package:food_app/features/navigation/data/cubit/navigation_cubit.dart';
import 'package:food_app/features/navigation/presentation/view/layout_bottom_navigation_bar.dart';

class AppRouteConfig {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutePath.layoutBottomNavigationBar:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<NavigationCubit>(
            create: (context) => NavigationCubit(),
            child: const LayoutBottomNavigationBar(),
          ),
        );

      case AppRoutePath.loginView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(authRepo: AuthRepo()),
            child: LoginView(),
          ),
        );

      case AppRoutePath.signUpView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(authRepo: AuthRepo()),
            child: SignUpView(),
          ),
        );
      case AppRoutePath.mealsView:
        return MaterialPageRoute(
          builder: (context) {
            final CategoriesModel category =
                settings.arguments as CategoriesModel;
            return BlocProvider<HomeCubit>(
              create: (context) {
                return HomeCubit(HomeRepo())..getMeals(catTitle: category.name);
              },
              child: MealsInAllCategories(category: category),
            );
          },
        );
      case AppRoutePath.mealsDetailsView:
        return MaterialPageRoute(
          builder: (context) {
            final   meal =
                settings.arguments as MealsModel;
            return BlocProvider<HomeCubit>(
              create: (context) {
                return HomeCubit(HomeRepo())..getMealDetails(id: meal.id);
              },
              child: MealsDetailsView(),
            );
          },
        );
      

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
