import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:w_commerce_abd/Bloc/home_bloc/home_cubit.dart';
import 'package:w_commerce_abd/Models/categories_model.dart';
import 'package:w_commerce_abd/Models/home_model.dart';

Widget HomeItem(Products product,context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: 120,
        height: 100,
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  width: double.infinity,
                  imageUrl: "${product.image}",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress),
                      ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )),
            if (product.discount != 0)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  color: Colors.red,
                  child: const Text(
                    "DISCOUNT",
                    style: TextStyle(fontSize: 8, color: Colors.white),
                  ),
                ),
              )
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Text("${product.name}", overflow: TextOverflow.ellipsis, maxLines: 1),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("${product.price} EGP",
              style: const TextStyle(
                  color: Colors.blue, fontWeight: FontWeight.bold)),
          const SizedBox(
            width: 5,
          ),
          if (product.discount != 0)
            Text(
              "${product.oldPrice} ",
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.lineThrough),
            ),
          Expanded(
              child: SizedBox(
                height: 30,
                child: IconButton(
                    style: IconButton.styleFrom(elevation: 0),
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      HomeCubit
                          .get(context).favData(id: product.id!);
                    },
                    icon:
                     CircleAvatar(
                        backgroundColor: HomeCubit
                            .get(context)
                            .favorites[product.id]!?Colors.blueAccent:Colors.grey,

                        child: const Icon(Icons.favorite_border, size: 15,color: Colors.white,))),
              )),
        ],
      )
    ],
  );
}

Widget catItems(DataModel dataModel) {
  return Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      SizedBox(
          width: 200,
          height: 300,
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            width: double.infinity,
            imageUrl: "${dataModel.image}",
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
                  child:
                  CircularProgressIndicator(value: downloadProgress.progress),
                ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          )),
      Container(
        width: 200,
        color: Colors.black.withOpacity(0.8),
        child: Text("${dataModel.name}",
            style: const TextStyle(color: Colors.white),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center),
      )
    ],
  );
}
