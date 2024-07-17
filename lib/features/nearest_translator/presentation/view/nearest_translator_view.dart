import 'package:flutter/material.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';

import '../../../../core/shared_widgets/custem_header_widget.dart';

class NearestTranslatorView extends StatelessWidget {
  const NearestTranslatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            const SliverToBoxAdapter(
              child: CustemHeaderWidget(
                text: 'اطلب اقرب مترجم',
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(
              child: Text(
                textAlign: TextAlign.center,
                'حدّد موقعك من الخريطة',
                style: AppTextStyle.aljazeera400Style34d,
              ),
            ),
            SliverToBoxAdapter(
                child: Image.asset(
              Assets.imagesSelectLocation,
              height: 300,
            )),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 112,
                width: 400,
                child: Text(
                    textAlign: TextAlign.center,
                    style: AppTextStyle.aljazeera400Style34d,
                    'اطلب أقرب مترجم من موقعك ليقدم لك خدمة الترجمة بشكل مباشر'),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(
              child: Image.asset(Assets.imagesComungSoon, height: 130),
            )
          ],
        ),
      ),
    );
  }
}
