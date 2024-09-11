import 'package:flutter/material.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.valueColor = Colors.white,
    this.color = AppColor.deebPlue,
  });
  final Color color;
  final Color valueColor;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: AppColor.deebPlue,
        // leftDotColor: KColors.green,
        // rightDotColor: KColors.blueB,
        size: MediaQuery.sizeOf(context).height * .1,
      ),
      /*  LoadingAnimationWidget.discreteCircle(
        color: KColors.primary,
        secondRingColor: KColors.green,
        thirdRingColor: KColors.blueB,
        size: context.height * .1,
      ), */
      /* CircularProgressIndicator.adaptive(
        backgroundColor: color,
        valueColor: AlwaysStoppedAnimation<Color>(valueColor),
      ), */
    );
  }
}

class LoadingWidget2 extends StatelessWidget {
  const LoadingWidget2({
    super.key,
    this.valueColor = Colors.white,
    this.color = AppColor.deebPlue,
    this.strokeWidth = 4.0,
  });
  final Color color, valueColor;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: color,
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(valueColor),
      ),
    );
  }
}
