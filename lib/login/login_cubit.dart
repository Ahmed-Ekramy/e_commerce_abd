import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w_commerce_abd/apiServices/api_services.dart';
import '../Models/login_model.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context)=> BlocProvider.of(context);

  postLogin( {required String email, required String password}) async {
    try{
      emit(LoginLoadingState());
      LoginModel loginModel = await ApiServices.loginData(
          email: email, password: password);
      print(loginModel.data?.name);
      emit(LoginSuccessesState(loginModel));
    }catch(e){
      emit(LoginFailureState(e.toString()));
    }
  }
  bool isPassword = true;
  IconData suffix=Icons.visibility;
   changeSuffix(){
     isPassword=!isPassword;
    suffix= isPassword?Icons.visibility:Icons.visibility_off;

    emit(LoginSuffixStateState());
  }
}
