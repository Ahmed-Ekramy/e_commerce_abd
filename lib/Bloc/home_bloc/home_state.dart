
import 'package:w_commerce_abd/Models/categories_model.dart';
import 'package:w_commerce_abd/Models/home_model.dart';

import '../../Models/fav_model.dart';
import '../../Models/pro_cart_model.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates{}
class HomeLoadingState extends HomeStates{}
class HomeSuccessesState extends HomeStates{
  HomeSuccessesState(this.homeModel);
  final HomeModel homeModel;
}
class HomeFailureState extends HomeStates{
  HomeFailureState(this.error);
  String error;
}
////////////////////////////////////////////////
////////////////////////////////////////////
class CatInitialStates extends HomeStates {}
class CatLoadingState extends HomeStates{}
class CatSuccessesState extends HomeStates{
  CatSuccessesState(this.categoriesModel);
  final CategoriesModel categoriesModel;}
class CatFailureState extends HomeStates{
  CatFailureState(this.error);
  String error;
}
//////////////////////////////////////////////
/////////////////////////////////////////////
class ProCatInitialStates extends HomeStates {}
class ProCatLoadingState extends HomeStates{}
class ProCatSuccessesState extends HomeStates{
  ProCatSuccessesState(this.proCatModel);
  final ProCatModel  proCatModel;}
class ProCatFailureState extends HomeStates{
  ProCatFailureState(this.error);
  String error;
}
//////////////////////////////////////////
////////////////////////////////////
class ShopChangeFavoritesState extends HomeStates{}
class FavLoadingState extends HomeStates{}
class FavSuccessesState extends HomeStates{
  FavSuccessesState(this.favModel);
  final FavModel  favModel;}
class FavFailureState extends HomeStates{
  FavFailureState(this.error);
  String error;
}
/////////////////////////////////////////////////////////
//////////////////////////////////////////
class HomeChangeNavBarState extends HomeStates{}
