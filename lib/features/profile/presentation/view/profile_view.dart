import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';
import 'package:kolayca/features/profile/presentation/widget/custem_divider.dart';
import 'package:kolayca/features/profile/presentation/widget/personal_data.dart';
import 'package:kolayca/features/profile/presentation/widget/requs_and_notiva_item.dart';

import '../../../../core/shared_widgets/custem_header_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.ofWhight,
        body: Column(
          children: [
            const SizedBox(height: 35),
            const CustemHeaderWidget(
              text: 'ملفي الشخصي',
            ),
            const SizedBox(height: 76),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.imagesFileimage, height: 150),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PersonalData(
                      text: 'الاسم',
                      image: Assets.imagesName,
                    ),
                    const PersonalData(
                      text: 'رقم التليفون',
                      image: Assets.imagesPhon,
                    ),
                    const PersonalData(
                      text: ' الايميل',
                      image: Assets.imagesEmail,
                    ),
                    Container(
                      height: 43,
                      width: 115,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColor.plueLight,
                          width: 3,
                        ),
                        color: AppColor.ofWhight,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Assets.imagesEdit),
                          const SizedBox(width: 9),
                          Text('تعديل',
                              style: AppTextStyle.aljazeera400Style34d.copyWith(
                                fontSize: 24,
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 58),
          const  CustemDivider(),
            const SizedBox(height: 20),
          const  RequestsAndNotviItem(
              text: 'الاشعارات',
            ),
            const SizedBox(height: 20),
          const  RequestsAndNotviItem(
              text: 'الطلبات',
            ),
          ],
        ),
      ),
    );
  }
}
