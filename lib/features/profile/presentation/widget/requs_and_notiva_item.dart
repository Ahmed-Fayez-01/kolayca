import 'package:flutter/material.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';

class RequestsAndNotviItem extends StatelessWidget {
  const RequestsAndNotviItem({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 62,
        width: 447,
        color: Colors.white,
        child: Row(
          children: [
            Container(
              height: 62,
              width: 9,
              color: AppColor.plueLight,
            ),
       const     SizedBox(width: 7),
            Text(
             text,
              style: AppTextStyle.aljazeera400Style34d.copyWith(
                fontSize: 32,
              ),
            ),
       const     Spacer(),
            Image.asset(
              Assets.imagesLayer1,
              height: 47,
            ),
        const    SizedBox(width: 11),
          ],
        ),
      ),
    );
  }
}
