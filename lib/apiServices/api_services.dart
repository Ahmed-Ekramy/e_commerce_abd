import 'dart:developer';

import 'package:dio/dio.dart';

import '../Models/categories_model.dart';
import '../Models/fav_model.dart';
import '../Models/home_model.dart';
import '../Models/login_model.dart';
import '../Models/pro_cart_model.dart';

class ApiServices {
  static Dio dio = Dio();

  static Future<LoginModel> loginData(
      {required String email, required String password}) async {
    try {
      var response = await dio.post("https://student.valuxapps.com/api/login",
          data: {"email": email, "password": password});
      LoginModel loginModel = LoginModel.fromJson(response.data);
      if (loginModel.status == true) {
        return loginModel;
      } else {
        throw Exception(loginModel.message);
      }
    } on DioException catch (e) {
      final String errorMassage =
          e.response?.data['massage'] ?? "OPPs there was an error,try later";
      throw Exception(errorMassage);
    } catch (e) {
      log(e.toString());
      'OPPs there was an error,try later';
      throw Exception(e);
    }
  }

  static Future<HomeModel> homeData() async {
    try {
      var response = await dio.get("https://student.valuxapps.com/api/home",
          options: Options(headers: {
            'Content-Type': 'application/json',
            'lang': 'en',
            'Authorization':
                'JxmSyQ2b04s5f2mdcMh2A4pdcQOrqWBYI295nRKstbPrWr3n3BCRZRNrMWG7z4k8d93qQ7'
          }));
      HomeModel homeModel = HomeModel.fromJson(response.data);

        return homeModel;

    } on DioException catch (e) {
      final String errorMassage =
          e.response?.data['massage'] ?? "OPPs there was an error,try later";
      throw Exception(errorMassage);
    } catch (e) {
      log(e.toString());
      'OPPs there was an error,try later';
      throw Exception(e);
    }
  }

  static Future<CategoriesModel> categoriesData() async {
    try {
      var response =
          await dio.get("https://student.valuxapps.com/api/categories",
              options: Options(headers: {
                'lang': 'en',
                'Authorization':
                    'JxmSyQ2b04s5f2mdcMh2A4pdcQOrqWBYI295nRKstbPrWr3n3BCRZRNrMWG7z4k8d93qQ7'
              }));
      CategoriesModel categoriesModel = CategoriesModel.fromJson(response.data);

        return categoriesModel;

    } on DioException catch (e) {
      final String errorMassage =
          e.response?.data['massage'] ?? "OPPs there was an error,try later";
      throw Exception(errorMassage);
    } catch (e) {
      log(e.toString());
      'OPPs there was an error,try later';
      throw Exception(e);
    }
  }

  static Future<ProCatModel> productsCatData({required int id}) async {
    try {
      var response = await dio.get(
          "https://student.valuxapps.com/api/products?category_id=$id",
          options: Options(headers: {
            'lang': 'en',
          }));
      ProCatModel proCatModel = ProCatModel.fromJson(response.data);
        return proCatModel;

    } on DioException catch (e) {
      final String errorMassage =
          e.response?.data['massage'] ?? "OPPs there was an error,try later";
      throw Exception(errorMassage);
    } catch (e) {
      log(e.toString());
      'OPPs there was an error,try later';
      throw Exception(e);
    }
  }

 static Future<FavModel>favData( {required int id}) async {

   try {
      var response = await dio.post(
          "https://student.valuxapps.com/api/favorites",
          data: {"product_id": id}, options: Options(headers: {
        'lang': 'en',
        'Authorization':
        'JxmSyQ2b04s5f2mdcMh2A4pdcQOrqWBYI295nRKstbPrWr3n3BCRZRNrMWG7z4k8d93qQ7'
      }));
      print(response.data);
      FavModel favModel = FavModel.fromJson(response.data);
      print(favModel.data?.id);
        return favModel;
    }on DioException catch (e) {
     final String errorMassage =
         e.response?.data['massage'] ?? "OPPs there was an error,try later";
     throw Exception(errorMassage);
   } catch (e) {
     log(e.toString());
     'OPPs there was an error,try later';
     throw Exception(e);
   }
  }
}
