import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w_commerce_abd/Bloc/home_bloc/home_cubit.dart';
import 'package:w_commerce_abd/Bloc/home_bloc/home_state.dart';
import 'package:w_commerce_abd/Models/categories_model.dart';
import 'package:w_commerce_abd/Models/home_model.dart';


class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
       BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title:
                    const Text("salla", style: TextStyle(color: Colors.black)),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ))
                ]),
            bottomNavigationBar: BottomNavigationBar(
                onTap: (value) {
                  HomeCubit.get(context).onChangeNav(value);
                },
                currentIndex: HomeCubit.get(context).indexNav,
                selectedIconTheme: const IconThemeData(color: Colors.blue),
                unselectedIconTheme: const IconThemeData(color: Colors.grey),
                items: HomeCubit.get(context).items),
            body: HomeCubit.get(context).tabs[HomeCubit.get(context).indexNav],
          );
        },
    );
  }
}
