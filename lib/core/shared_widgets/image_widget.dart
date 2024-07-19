//import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    required this.imageUrl,
    Key? key,
    this.width = 165,
    this.height = 52,
    this.fit,
    this.color,
    this.colorFilter,
    this.onTap,
  }) : super(key: key);
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final ColorFilter? colorFilter;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        color: color,
      ),
    );
  }
}
