import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/home/presentation/views/home_view.dart';
import 'package:food_app/features/navigation/data/cubit/navigation_state.dart';
import 'package:food_app/features/profile/presentation/view/profile_view.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationStateInitial());

  int currentIndex = 0;
  List<Widget> screens = [
    const HomeView(),
    Container(color: Colors.red),
    ProfileView(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeCurrentIndex());
  }
}
