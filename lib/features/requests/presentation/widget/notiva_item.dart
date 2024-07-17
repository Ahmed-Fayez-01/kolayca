

import 'package:flutter/material.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';

class NotiviacationItem extends StatelessWidget {
  const NotiviacationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: SizedBox(
        height: 56,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              left: 15,
              child: Image.asset(
                Assets.imagesNoti,
                height: 56,
              ),
            ),
            const Positioned(
              top: 5,
              left: 80,
              child: Text(
                'Abdullah',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            const Positioned(
              top: 25,
              left: 80,
              child: Text('your message',
                  style: AppTextStyle.madaniArabic400Style20),
            ),
            const Positioned(
                top: 25,
                right: 15,
                child:
                    Text('Aug 29', style: AppTextStyle.madaniArabic400Style20)),
          ],
        ),
      ),
    );
  }
}
