import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w_commerce_abd/Bloc/home_bloc/home_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';


class SliderBuilder extends StatelessWidget {
  const SliderBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: HomeCubit
            .get(context)
            .homeModel!
            .data!
            .banners
            ?.map((e) =>
            CachedNetworkImage(
              fit: BoxFit.fill,
              width: double.infinity,
              imageUrl: "${e.image}",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress),
                  ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),)
            .toList(),
        options: CarouselOptions(
          height: 200,
          aspectRatio: 16 / 9,
          viewportFraction: 1.0,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 1),
          autoPlayAnimationDuration:
          const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ));
  }
}