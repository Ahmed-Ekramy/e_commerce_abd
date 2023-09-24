import 'package:flutter/material.dart';
import 'package:w_commerce_abd/Bloc/home_bloc/home_cubit.dart';
import 'home_widget.dart';

class BuilderGridView extends StatelessWidget {
  const BuilderGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 1 / 1.2,
        children: List.generate(
            HomeCubit.get(context).homeModel!.data!.products!.length,
                (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: HomeItem(HomeCubit.get(context)
                  .homeModel!
                  .data!
                  .products![index],context),
            )),
      ),
    );

  }
}