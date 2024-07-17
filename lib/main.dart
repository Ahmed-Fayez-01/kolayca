import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/utils/roots/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    EasyLocalization.ensureInitialized(),
    ScreenUtil.ensureScreenSize(),
  ]);
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale("ar"), Locale("en")],
        saveLocale: true,
        startLocale: const Locale("en"),
        path:
            "lib/core/language", // <-- change the path of the translation files
        child: const Kocayla()),
  );
}

class Kocayla extends StatelessWidget {
  const Kocayla({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(510, 1084),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Builder(builder: (context) {
            return MaterialApp.router(
              title: 'Kolayca',
              locale: context.locale,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              debugShowCheckedModeBanner: false,
              routerConfig: router,
            );
          });
        });
  }
}
