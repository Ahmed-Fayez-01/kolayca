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
      "https://s3-alpha-sig.figma.com/img/2c5d/505a/ab5c45c66caccd572bdeddd03f8ec85a?Expires=1721001600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=loHPCS9EvbW-mPeMFqsnzk7LIt8uAbMCufcNM1ZqVb2BJhMw9O5~MQZfBxpXwl6NBYAF5WoINkFuWUJw0HuR0DvxfWQfPl0rj-v6yOMDTEvDwNCt9c7TojvBiY8GeeR7M3PH0fWJiOobVNQHpu6XL-Xbhz02KeDHrI-Spe-MZohn4QzGHRAq35fAQGplKHMU0PcCOeAv-FaNxMUCwdQg7i6eXwYpzj~HIRTyZOBzK7njbAp9N7uOWP3Khyt8NsGzjfEQcpNRSqhvoK839YLjho7PM4d8DRvsJk3hsqFtHDj2uOvWx4GwUt73ZAetmjkkE8HGD-N0vTNPdfatW-es5w__",
      "https://s3-alpha-sig.figma.com/img/2243/8605/2ade4fa611cc446bdce4098dad51e662?Expires=1721001600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=oxogUxgXQY-3gwTNpxh5SexemfslKJsT4CfDmhw2utty3IN56aAQaQcQsIEWOyt-rBQ5mnKR1fVQZaFpUlvAv0zFUdGJ3RgBa5cv4fLttWuXvPYnSVyg8g41vImfz0O01L4-dJcHUd~UGCJfVyJkcny33tLGXoIxf~Do3TJEIM1NFbt9ja7Cuyw-bDoKjQZwWZ1CBvIUY6DnEZLrKDWE18n7AZVf3njBhHjkpj6ucJwgBK8jyDF-nWUy12k2iJSBmXEQlR64Y6n0PYxqzgbalGNRjynCiS-26h12I4OotiZN3pexAF2reSFE~PPvoFxje9oepLdbnFLjK7qLJ3AwxQ__"
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
                    color: Colors.black.withOpacity(0.2),
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
