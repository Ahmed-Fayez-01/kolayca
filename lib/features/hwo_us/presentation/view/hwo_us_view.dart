import 'package:flutter/material.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';

import '../../../../core/shared_widgets/custem_header_widget.dart';

class HwoUsView extends StatelessWidget {
  const HwoUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          const SliverToBoxAdapter(
            child: CustemHeaderWidget(
              text: 'من نحن؟',
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(child: Image.asset(Assets.imagesLogo, height: 81)),
          const SliverToBoxAdapter(child: SizedBox(height: 25)),
          SliverToBoxAdapter(
            child: Text(
              'نحن هنا لمساعدتك على تعلم \nاللغه التركيه بسهوله',
              style: AppTextStyle.aljazeera400Style34d,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 25)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 36, right: 36),
              child: Text(
                'رؤيتنا هي جعل تعلم اللغة التركية متاحه للجميع أينما كانوا مهمتنا هي توفير أدوات تعليمية متقدمة وتفاعلية تساعك على تحقيق أهدافك اللغوية بكفاءة عالية',
                style: AppTextStyle.aljazeera400Style34d.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Image.asset(
              Assets.imagesVideo2,
              height: 247,
            ),
          )),
          SliverToBoxAdapter(
            child: Image.asset(Assets.imagesFollow, height: 97),
          )
        ],
      ),
    );
  }
}
