import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'core/shared_widgets/home_nav_bar_widget.dart';
import 'core/utils/roots/app_router.dart';
import 'features/live_translator/presentation/view_models/get_live_translator_methods_cubit.dart';
import 'features/profile/presentation/view_models/get_profile_cubit/get_profile_cubit.dart';
import 'features/profile/presentation/view_models/update_profile_cubit/update_profile_cubit.dart';
import 'features/subscription_ package/presentation/view_models/get_packages_cubit.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  setup();
  await Future.wait([
    EasyLocalization.ensureInitialized(),
    ScreenUtil.ensureScreenSize(),
    dotenv.load(),
  ]);

  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);
  ZegoUIKit().initLog().then((value) {
    ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
      [ZegoUIKitSignalingPlugin()],
    );
    runApp(
      EasyLocalization(
          supportedLocales: const [Locale("ar"), Locale("en")],
          saveLocale: true,
          startLocale: const Locale("ar"),
          path: "lib/core/language",
          // <-- change the path of the translation files
          child: Kocayla(navigatorKey: navigatorKey)),
    );
  });
}

class Kocayla extends StatelessWidget {
  const Kocayla({super.key, required this.navigatorKey});
  final GlobalKey<NavigatorState> navigatorKey;
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
                BlocProvider(
                  create: (context) => GetProfileCubit(getIt())..fetchProfile(),
                ),
                BlocProvider(
                  create: (context) => UpdateProfileCubit(getIt()),
                ),
                BlocProvider(create: (context) => UploadImageProfileCubit()),
                BlocProvider(
                    create: (context) => UploadSignUpImageProfileCubit()),
                BlocProvider(
                    create: (context) => LoginCubit(getIt.get<AuthRepoImpl>())),
                BlocProvider(
                    create: (context) =>
                        RegisterCubit(getIt.get<AuthRepoImpl>())),
                BlocProvider(
                    create: (context) =>
                        GetHomeDataCubit(getIt.get<HomeRepoImpl>())
                          ..getHomeData()),
                BlocProvider(
                    create: (context) =>
                        GetSliderDataCubit(getIt.get<HomeRepoImpl>())
                          ..getSliderData()),
                BlocProvider(
                    create: (context) =>
                        AboutUsCubit(getIt.get<AboutUsRepoImpl>())
                          ..getSettings()),
                BlocProvider(
                    create: (context) =>
                        GetLiveTranslatorMethodsCubit(getIt.get())
                          ..getLiveTranslatorMethods()),
                BlocProvider(
                    create: (context) =>
                        GetPackagesCubit(getIt.get())..getPackages()),
              ],
              child: MaterialApp.router(
                title: 'Kolayca',
                locale: context.locale,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                debugShowCheckedModeBanner: false,
                routerConfig: router(navigatorKey),
              ),
            );
          });
        });
  }
}
