import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/utils/services/local_services/cache_helper.dart';
import 'package:kolayca/core/utils/services/remote_services/service_locator.dart';
import 'package:kolayca/features/auth/data/repo/auth_repo_impl.dart';
import 'package:kolayca/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:kolayca/features/auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:kolayca/features/auth/presentation/view_model/upload_sign_up_image_profile/upload_sign_up_image_profile_cubit.dart';
import 'package:kolayca/features/home/data/repo/auth_repo_impl.dart';
import 'package:kolayca/features/home/presentation/view_model/get_home_data_cubit/get_home_data_cubit.dart';
import 'package:kolayca/features/home/presentation/view_model/get_slider_cubit/get_slider_cubit.dart';
import 'package:kolayca/features/hwo_us/data/repos/about_us_repo_impl.dart';
import 'package:kolayca/features/hwo_us/presentation/view_models/about_us_cubit/about_us_cubit.dart';
import 'package:kolayca/features/requests/presentation/view_model/upload_image_profile/upload_image_profile_cubit.dart';
import 'core/utils/roots/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  setup();
  Future.wait([
    EasyLocalization.ensureInitialized(),
    ScreenUtil.ensureScreenSize(),
  ]);
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale("ar"), Locale("en")],
        saveLocale: true,
        startLocale: const Locale("ar"),
        path: "lib/core/language",
        // <-- change the path of the translation files
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
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => UploadImageProfileCubit()),
                BlocProvider(create: (context) => UploadSignUpImageProfileCubit()),
                BlocProvider(create: (context) => LoginCubit(getIt.get<AuthRepoImpl>())),
                BlocProvider(create: (context) => RegisterCubit(getIt.get<AuthRepoImpl>())),
                BlocProvider(create: (context) => GetHomeDataCubit(getIt.get<HomeRepoImpl>())..getHomeData()),
                BlocProvider(create: (context) => GetSliderDataCubit(getIt.get<HomeRepoImpl>())..getSliderData()),
                BlocProvider(create: (context) => AboutUsCubit(getIt.get<AboutUsRepoImpl>())..getSettings()),
              ],
              child: MaterialApp.router(
                title: 'Kolayca',
                locale: context.locale,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                debugShowCheckedModeBanner: false,
                routerConfig: router,
              ),
            );
          });
        });
  }
}
