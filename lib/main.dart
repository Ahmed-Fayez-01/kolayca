import 'package:flutter/material.dart';

import 'core/utils/roots/app_router.dart';

void main() {
  runApp(const Kocayla());
}
class Kocayla extends StatelessWidget {
  const Kocayla({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.rtl, child: child!);
      },
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}