import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w_commerce_abd/Bloc/home_bloc/home_cubit.dart';
import 'package:w_commerce_abd/Bloc/home_bloc/home_state.dart';
import 'package:w_commerce_abd/Models/pro_cart_model.dart';

class ProductCatView extends StatelessWidget {
  int? id;

  ProductCatView(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..productCatData(id: id ?? 0),
      child: BlocBuilder<HomeCubit, HomeStates>(builder: (context, state) {
        if (state is ProCatSuccessesState) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: GridView.count(
                      shrinkWrap: false,
                      physics: const BouncingScrollPhysics(),
                      crossAxisCount: 2,
                      childAspectRatio: 1.2 / 1.9,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10.0,
                      children: List.generate(
                          HomeCubit.get(context)
                              .proCatModel!
                              .data!
                              .data!
                              .length,
                          (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: proCatItem(HomeCubit.get(context)
                                    .proCatModel!
                                    .data!
                                    .data![index]),
                              )),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }

  Widget proCatItem(ProDataModel proDataModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 200,
          height: 150,
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  width: double.infinity,
                  imageUrl: "${proDataModel.image}",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress),
                      ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              if (proDataModel.discount != 0)
                Container(
                  color: Colors.red,
                  child: const Text(
                    "DISCOUNT",
                    style: TextStyle(fontSize: 8, color: Colors.white),
                  ),
                )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text("${proDataModel.name}",
            overflow: TextOverflow.ellipsis, maxLines: 1),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("${proDataModel.price} EGP",
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold)),
            const SizedBox(
              width: 5,
            ),
            if (proDataModel.discount != 0)
              Text(
                "${proDataModel.oldPrice} ",
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough),
              ),
            Expanded(
                child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border))),
          ],
        )
      ],
    );
  }
}
