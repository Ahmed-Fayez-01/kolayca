import 'package:flutter/material.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';

class LessonsView extends StatelessWidget {
  const LessonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 7)),
          SliverToBoxAdapter(
            child: Image.asset(
              Assets.imagesLessonstitle,
              height: 200,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 19)),
          SliverToBoxAdapter(
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 25,
                    childAspectRatio: 1.5,
                  ),
                  itemBuilder: (context, index) {
                    return Image.asset(Assets.imagesVideo);
                  },
                  itemCount: 8,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
