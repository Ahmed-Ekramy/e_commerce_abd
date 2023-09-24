import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:w_commerce_abd/login/login_cubit.dart';
import 'package:w_commerce_abd/login/login_state.dart';
import 'package:w_commerce_abd/register_screen.dart';
import 'package:w_commerce_abd/widget/defaultFormTextFild.dart';
import '../home_screen/home_view.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessesState) {
            Fluttertoast.showToast(
                msg: state.loginModel.message!,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.greenAccent,
                textColor: Colors.white,
                fontSize: 16.0);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeView(),
                ),(route) => false,);
          } else if (state is LoginFailureState) {
            Fluttertoast.showToast(
                msg: state.error,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "LOGIN",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    defaultFormField(
                        prefixIcon: const Icon(Icons.email),
                        controller: emailController,
                        label: 'Email Address',
                        validate: (value) {
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value!);
                          if (value == null || value.isEmpty || !emailValid) {
                            return "Please Enter valid Email Address";
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    defaultFormField(
                        isPassword: LoginCubit.get(context).isPassword,
                        suffixIcon:IconButton(onPressed: () {
                          LoginCubit.get(context).changeSuffix();
                        }, icon: Icon(LoginCubit.get(context).suffix)),
                        controller: passwordController,
                        label: 'Enter Password',
                        validate: () {
                          return null;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0, minimumSize: const Size(350, 50)),
                            onPressed: () {
                              LoginCubit.get(context).postLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            },
                            child: const Text("LOGIN")),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't Have An Account ?",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const RegisterView();
                              }));
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(50, 50)),
                            child: const Text(
                              "REGISTER",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
