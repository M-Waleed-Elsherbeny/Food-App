import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/networking/supabase_services.dart';
import 'package:food_app/core/routes/app_route_config.dart';
import 'package:food_app/core/routes/app_route_path.dart';
import 'package:food_app/core/services/bloc_observer.dart';
import 'package:food_app/core/style/colors/app_colors.dart';
import 'package:hive/hive.dart';

Box? box;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseServices.initSupabase();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.kScaffoldBackgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kPrimaryColor),
        useMaterial3: true,
        fontFamily: "Poppins",
      ),
      onGenerateRoute: AppRouteConfig().onGenerateRoute,
      initialRoute: AppRoutePath.loginView,
    );
  }

  // m@gmail.com
  // w@gmail.com
  // 12345678
}
