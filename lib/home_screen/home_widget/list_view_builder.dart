import 'package:flutter/material.dart';

import 'package:w_commerce_abd/Bloc/home_bloc/home_cubit.dart';

import 'home_widget.dart';

class BuilderListView extends StatelessWidget {
  const BuilderListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => catItems(
            HomeCubit.get(context).categoriesModel!.data!.data![index]),
        separatorBuilder: (context, index) => const SizedBox(
              width: 20,
            ),
        itemCount: HomeCubit.get(context).categoriesModel!.data!.data!.length);
  }
}
