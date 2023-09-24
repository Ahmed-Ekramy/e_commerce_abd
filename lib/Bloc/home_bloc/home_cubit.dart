import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w_commerce_abd/Models/categories_model.dart';
import 'package:w_commerce_abd/Models/fav_model.dart';
import 'package:w_commerce_abd/Models/home_model.dart';
import 'package:w_commerce_abd/apiServices/api_services.dart';
import 'package:w_commerce_abd/home_screen/tabs/category_tab.dart';
import 'package:w_commerce_abd/home_screen/tabs/fav_tab.dart';
import 'package:w_commerce_abd/home_screen/tabs/homeTab.dart';
import 'package:w_commerce_abd/home_screen/tabs/setting_tab.dart';

import '../../Models/pro_cart_model.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  int indexNav = 0;
  List<Widget> tabs = const [HomeTab(), CategoryTab(), FavTab(), SettingTab()];
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
    const BottomNavigationBarItem(icon: Icon(Icons.category), label: ''),
    const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
    const BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
  ];
  HomeModel? homeModel;
  Map<int, bool> favorites = {};

  void onChangeNav(value) {
    indexNav = value;
    emit(HomeChangeNavBarState());
  }

  void homeData() async {
    try {
      emit(HomeLoadingState());
      homeModel = await ApiServices.homeData();
      homeModel!.data!.products!.forEach((element) {
        favorites.addAll({element.id!: element.inFavorites!});
      });
      emit(HomeSuccessesState(homeModel!));
    } catch (e) {
      emit(HomeFailureState(e.toString()));
    }
  }

  CategoriesModel? categoriesModel;
  List<CategoriesModel>categories=[];

  void catData() async {
    try {
      emit(CatLoadingState());
      categoriesModel = await ApiServices.categoriesData();
      emit(CatSuccessesState(categoriesModel!));
    } catch (e) {
      emit(CatFailureState(e.toString()));
    }
  }

  ProCatModel? proCatModel;

  void productCatData({required int id}) async {
    try {

      emit(ProCatLoadingState());
      proCatModel = await ApiServices.productsCatData(id: id);
      emit(ProCatSuccessesState(proCatModel!));
    } catch (e) {
      emit(ProCatFailureState(e.toString()));
    }
  }

  FavModel? favModel;
  void favData({required int id}) async {
    favorites[id] = !favorites[id]!;
    FavSuccessesState(favModel!);
    try {
      favModel = await ApiServices.favData(id: id);
      emit(FavSuccessesState(favModel!));
    } catch (e) {
      favorites[id] = !favorites[id]!;
      emit(FavFailureState(e.toString()));
    }
  }
}
