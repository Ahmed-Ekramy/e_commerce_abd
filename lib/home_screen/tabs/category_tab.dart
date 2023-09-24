import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:w_commerce_abd/Bloc/home_bloc/home_cubit.dart';
import 'package:w_commerce_abd/Models/categories_model.dart';

import '../pro_cat_view.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) =>
                const Divider(endIndent: 40, indent: 40, height: 50, thickness: 2),
            itemBuilder: (context, index) => GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProductCatView(  HomeCubit.get(context).categoriesModel!.data!.data![index].id);
                },));
              },
              child: catItem(
                  HomeCubit.get(context).categoriesModel!.data!.data![index]),
            ),
            itemCount:
                HomeCubit.get(context).categoriesModel!.data!.data!.length,
          ),
        ),
      ],
    );
  }

  Widget catItem(DataModel data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
            height: 100,
            width: 200,
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              width: double.infinity,
              imageUrl: "${data.image}",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress),
                  ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )),
        Text("${data.name}",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
        Icon(Icons.arrow_forward_ios_outlined),
      ],
    );
  }
}
