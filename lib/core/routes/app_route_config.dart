import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/routes/app_route_path.dart';
import 'package:food_app/features/auth/data/cubit/auth_cubit.dart';
import 'package:food_app/features/auth/data/repo/auth_repo.dart';
import 'package:food_app/features/auth/presentation/view/login_view.dart';
import 'package:food_app/features/auth/presentation/view/sign_up_view.dart';
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

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
