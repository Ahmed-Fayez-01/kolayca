import 'package:flutter/material.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/features/subscription_%20package/presentation/widget/subscription_package_item.dart';

import '../../../../core/shared_widgets/custem_header_widget.dart';

class SubscriptionPackageView extends StatelessWidget {
  const SubscriptionPackageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 25)),
            SliverToBoxAdapter(
              child: CustemHeaderWidget(
                text: 'باقات الاشتراك',
              ),
            ),
            SliverToBoxAdapter(
                child: SubscriptionPackageItem(
              image: Assets.imagesSubscriptionPackageCard,
              consultationHours:
                  '30 consultation hours\n30 templates and 30 images\nUnlimited access file',
              price: r'$499',
            )),
            SliverToBoxAdapter(
                child: SubscriptionPackageItem(
              image: Assets.imagesSubscriptionPackageCard2,
              consultationHours:
                  '15 consultation hours\n15 templates and 15 images\nUnlimited access file',
              price: r'$399',
            )),
            SliverToBoxAdapter(
                child: SubscriptionPackageItem(
              image: Assets.imagesSubscriptionPackageCard3,
              consultationHours:
                  '10 consultation hours\n10 templates and 10 images\nUnlimited access file',
              price: r'$299',
            ))
          ],
        ),
      ),
    );
  }
}
