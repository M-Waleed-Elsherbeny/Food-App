import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/style/colors/app_colors.dart';
import 'package:food_app/features/navigation/data/cubit/navigation_cubit.dart';
import 'package:food_app/features/navigation/data/cubit/navigation_state.dart';

class LayoutBottomNavigationBar extends StatelessWidget {
  const LayoutBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        int index = context.read<NavigationCubit>().currentIndex;
        List screens = context.read<NavigationCubit>().screens;
        return Scaffold(
          body: screens[index],
          bottomNavigationBar: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.kPrimaryColor,
              boxShadow: [
                const BoxShadow(
                  color: AppColors.kPrimaryColor,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: BottomNavigationBar(
              onTap: (index) {
                context.read<NavigationCubit>().changeIndex(index);
              },
              currentIndex: index,
              backgroundColor: Colors.transparent,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              elevation: 0.0,
              selectedItemColor: AppColors.kDarkBlue,
              unselectedItemColor: AppColors.kScaffoldBackgroundColor,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: index == 0
                      ? const Icon(Icons.home_filled, size: 30)
                      : const Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: index == 1
                      ? const Icon(Icons.favorite, size: 30)
                      : const Icon(Icons.favorite_border, size: 30),
                  label: 'My Favorites',
                ),
                BottomNavigationBarItem(
                  icon: index == 2
                      ? const Icon(Icons.person_2_rounded, size: 30)
                      : const Icon(Icons.person_2_outlined),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
