import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w_commerce_abd/Bloc/home_bloc/home_state.dart';
import 'package:w_commerce_abd/home_screen/home_widget/gride_view_builder.dart';
import 'package:w_commerce_abd/home_screen/home_widget/list_view_builder.dart';
import 'package:w_commerce_abd/home_screen/home_widget/slider_builder.dart';

import '../../Bloc/home_bloc/home_cubit.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        if (HomeCubit.get(context).homeModel != null &&
            HomeCubit.get(context).categoriesModel != null ) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SliderBuilder(),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Category",
                        style: TextStyle(fontSize: 20),
                      ),
                      Container(
                        width: 600,
                        height: 250,
                        child: const BuilderListView(),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Product",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                const SliverFillRemaining(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: BuilderGridView(),
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
