import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kolayca/features/home/presentation/view_model/get_slider_cubit/get_slider_cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/constants.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1,
            aspectRatio: 2.5,
            initialPage: 0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          itemCount: context.read<GetSliderDataCubit>().sliderImages.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.height * 0.01,
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[400]!,
                      highlightColor: Colors.grey[200]!,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height * 0.01,
                          ),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    imageUrl:
                        context.read<GetSliderDataCubit>().sliderImages[index],
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.1),
                  ),
                ],
              ),
            );
          },
        ),
        PositionedDirectional(
          bottom: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                context.read<GetSliderDataCubit>().sliderImages.map((url) {
              int index =
                  context.read<GetSliderDataCubit>().sliderImages.indexOf(url);
              return Container(
                width: MediaQuery.of(context).size.height * .013,
                height: MediaQuery.of(context).size.height * .013,
                margin: EdgeInsets.symmetric(
                    vertical: AppConstants.height10(context),
                    horizontal: AppConstants.height5(context) / 2),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    color:
                        _current == index ? Colors.transparent : Colors.white),
              );
            }).toList(),
          ),
        ),
        if (context.read<GetSliderDataCubit>().logoImageurl != null)
          Transform.translate(
            offset: Offset(0, -AppConstants.height20(context) * 1.5),
            child: Container(
              padding: EdgeInsets.all(AppConstants.sp10(context)),
              decoration: BoxDecoration(
                color: const Color(0xe6ffffff),
                borderRadius: BorderRadius.circular(
                  AppConstants.sp30(context),
                ),
              ),
              child: Image.network(
                context.read<GetSliderDataCubit>().logoImageurl!,
                width: MediaQuery.of(context).size.width * .5,
                height: MediaQuery.of(context).size.height * .05,
              ),
            ),
          )
      ],
    );
  }
}
