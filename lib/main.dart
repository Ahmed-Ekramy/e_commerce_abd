import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Bloc/home_bloc/home_cubit.dart';
import 'Models/categories_model.dart';
import 'Models/home_model.dart';
import 'bloc_observer.dart';
import 'home_screen/home_view.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  // bool onBoarding=CacheHelper.getData(key:"OnBoard");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()
            ..homeData()
            ..catData(),
        ),
      ],
      child: const MaterialApp(debugShowCheckedModeBanner: false, home: HomeView()),
    );
  }
}
