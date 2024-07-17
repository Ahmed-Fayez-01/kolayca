import 'package:flutter/material.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';

import '../../../../core/shared_widgets/custem_header_widget.dart';

class LiveTranslatorView extends StatelessWidget {
  const LiveTranslatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            const SliverToBoxAdapter(
                child: CustemHeaderWidget(
              text: 'اطلب مترجم مباشر',
            )),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(
              child: Text(
                textAlign: TextAlign.center,
                'طريقه اطلب مترجم مباشر  ',
                style: AppTextStyle.aljazeera400Style34d,
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Image.asset(
                Assets.imagesVideo2,
                height: 200,
              ),
            )),
            SliverToBoxAdapter(
              child: Text(
                  textAlign: TextAlign.center,
                  style: AppTextStyle.aljazeera400Style34d.copyWith(
                    color: AppColor.plueLight,
                  ),
                  'طريقة طلب مترجم مباشر'),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(
              child: Text(
                  textAlign: TextAlign.center,
                  style:
                      AppTextStyle.aljazeera400Style34d.copyWith(fontSize: 25),
                  'طريقة جدولة مواعيد التحدث مع أتراك'),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Image.asset(
                Assets.imagesVideo2,
                height: 200,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
