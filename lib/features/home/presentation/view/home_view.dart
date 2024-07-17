import 'package:flutter/material.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/features/home/presentation/widget/home_custem_bottom.dart';

import '../../../../core/utils/functions/custem_navigate.dart';
import '../../../../core/utils/roots/app_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 7)),
          SliverToBoxAdapter(
            child: Image.asset(Assets.imagesAppBar),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 19)),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 500,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 25,
                    childAspectRatio: 1.5,
                  ),
                  children: [
                    HomeCustemBottom(
                      onTap: () {},
                      image: Assets.imagesTalkWithTirki,
                    ),
                    HomeCustemBottom(
                      onTap: () {
                        custemPush(context, liveTranslatorView);
                      },
                      image: Assets.imagesAskTrans,
                    ),
                    Image.asset(Assets.imagesBooks),
                    HomeCustemBottom(
                      image: Assets.imagesLessons,
                      onTap: () {
                        custemPush(context, lessonsView);
                      },
                    ),
                    Image.asset(Assets.imagesTestYourLanguage),
                    HomeCustemBottom(
                      image: Assets.imagesNearestTranslator,
                      onTap: () {
                        custemPush(context, nearestTranslatorView);
                      },
                    ),
                    HomeCustemBottom(
                      image: Assets.imagesSubscriptionPackage,
                      onTap: () {
                        custemPush(context, subscriptionPackageView);
                      },
                    ),
                    Image.asset(Assets.imagesLanguageCourses),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
