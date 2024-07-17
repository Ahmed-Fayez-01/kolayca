import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
    final List<String> imgList = [
      "https://ps.w.org/ml-slider/assets/banner-1544x500.png?rev=2907610",
      "https://ps.w.org/image-slider-widget/assets/banner-772x250.png?rev=1674939",
      "https://www.wpwebs.com/wp-content/uploads/2016/11/01-2.jpg",
      // Add more image URLs
    ];
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            aspectRatio: 3,
            initialPage: 0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          itemCount: imgList.length,
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
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.01,),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error),
                    imageUrl: imgList[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.1),
                  ),
                ],
              ),
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.map((url) {
            int index = imgList.indexOf(url);
            return Container(
              width: MediaQuery.of(context).size.height * .013,
              height: MediaQuery.of(context).size.height * .013,
              margin: EdgeInsets.symmetric(
                  vertical: AppConstants.height10(context),
                  horizontal: AppConstants.height5(context) / 2),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.white,
                      width: 2
                  ),
                  color: _current == index
                      ? Colors.transparent
                      : Colors.white),
            );
          }).toList(),
        ),
      ],
    );
  }
}
