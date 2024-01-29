import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_solution_challenge_2024/features/home/presentation/manager/states.dart';

import '../pages/bottom_tabs/fav_tab.dart';
import '../pages/bottom_tabs/home_tab.dart';
import '../pages/bottom_tabs/search_tab.dart';
import '../pages/bottom_tabs/services_tab.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);

  PageController pageController =
  PageController(initialPage: 1, viewportFraction: 0.95);

  PageController postPageController =
  PageController(initialPage: 1, viewportFraction: 0.95);

  final List<Widget> widgetOptions = [
    const HomeTab(),
    const SearchTab(),
    const FavTab(),
    const ServiceTab(),
  ];

  int selectedIndex = 0;

  double screenWidth(context) => MediaQuery.of(context).size.width;

  double screenHeight(context) => MediaQuery.of(context).size.height;

  void onNavItemTapped(int index) {
    emit(HomeInitState());
    selectedIndex = index;
    emit(OnNavItemTappedState());
  }
}
