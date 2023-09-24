
import '../Models/login_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}
class LoginLoadingState extends LoginStates {}
class LoginSuffixStateState extends LoginStates {}
class LoginSuccessesState extends LoginStates {
   LoginModel loginModel;
  LoginSuccessesState(this.loginModel);

}
class LoginFailureState extends LoginStates {
  String error;

  LoginFailureState(this.error);
}
