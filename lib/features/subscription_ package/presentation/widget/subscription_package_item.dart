import 'package:flutter/material.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';


class SubscriptionPackageItem extends StatelessWidget {
  const SubscriptionPackageItem(
      {super.key,
      required this.price,
      required this.consultationHours,
      required this.image});

  final String price;
  final String consultationHours;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: SizedBox(
        height: 135,
        width: 450,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                ),
              ),
            ),
            Positioned(
              top: 25,
              right: 55,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Text(
                  consultationHours,
                  style: AppTextStyle.madaniArabic400Style20.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Positioned(
                top: 50,
                left: 20,
                child: Text(
                  price,
                  style: AppTextStyle.madaniArabic400Style20
                      .copyWith(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
