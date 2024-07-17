
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';

class PersonalData extends StatelessWidget {
  const PersonalData({
    super.key,
    required this.text,
    required this.image,
  });

  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(image),
        const SizedBox(width: 9),
        Text(
          text,
          style: AppTextStyle.aljazeera400Style34d.copyWith(fontSize: 30),
        ),
      ],
    );
  }
}
