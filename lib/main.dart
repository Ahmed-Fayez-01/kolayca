import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/shared_widgets/home_nav_bar_widget.dart';
import 'package:kolayca/core/shared_widgets/loading_state_widget.dart';
import 'package:kolayca/core/utils/functions/set_user_availability.dart';
import 'package:kolayca/core/utils/services/local_services/cache_helper.dart';
import 'package:kolayca/core/utils/services/local_services/cache_keys.dart';
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
import 'package:kolayca/features/profile/presentation/view_models/language_cubit/change_language_cubit.dart';
import 'package:kolayca/features/profile/presentation/view_models/logout_cubit/logout_cubit.dart';
import 'package:kolayca/features/requests/presentation/view_model/upload_image_profile/upload_image_profile_cubit.dart';
import 'package:kolayca/features/translator_profile/presentation/views/translator_profile_view.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import 'core/utils/notifications/notification_service.dart';
import 'features/live_translator/presentation/view_models/get_live_translator_methods_cubit.dart';
import 'features/profile/presentation/view_models/get_profile_cubit/get_profile_cubit.dart';
import 'features/profile/presentation/view_models/update_profile_cubit/update_profile_cubit.dart';
import 'features/subscription_ package/presentation/view_models/get_packages_cubit.dart';
import 'firebase_options.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  setup();
  await Future.wait([
    EasyLocalization.ensureInitialized(),
    ScreenUtil.ensureScreenSize(),
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    dotenv.load(),
  ]);

  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);
  ZegoUIKit().initLog().then((value) {
    ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
      [ZegoUIKitSignalingPlugin()],
    );
    runApp(
      EasyLocalization(
          supportedLocales: const [Locale("ar"), Locale("tr")],
          saveLocale: true,
          startLocale: const Locale("ar"),
          path: "lib/core/language",
          // <-- change the path of the translation files
          child: Kocayla(navigatorKey: navigatorKey)),
    );
  });
}

class Kocayla extends StatefulWidget {
  const Kocayla({super.key, required this.navigatorKey});
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  State<Kocayla> createState() => _KocaylaState();
}

class _KocaylaState extends State<Kocayla> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocProvider(
        create: (context) => ChangeLanguageCubit(),
        child: BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
          builder: (context, s) {
            return s is ChangeLanguageLoading
                ? MaterialApp(
                    navigatorKey: widget.navigatorKey,
                    debugShowCheckedModeBanner: false,
                    localizationsDelegates: context.localizationDelegates,
                    supportedLocales: context.supportedLocales,
                    locale: context.locale,
                    home: Scaffold(body: LoadingBody()),
                  )
                : ScreenUtilInit(
                    designSize: const Size(510, 1084),
                    minTextAdapt: true,
                    splitScreenMode: true,
                    builder: (context, child) {
                      return Builder(builder: (context) {
                        return MultiBlocProvider(
                          providers: [
                            BlocProvider(
                              create: (context) => GetProfileCubit(getIt())
                                ..fetchProfile(context),
                            ),
                            BlocProvider(
                              create: (context) => UpdateProfileCubit(getIt()),
                            ),
                            BlocProvider(
                                create: (context) => UploadImageProfileCubit()),
                            BlocProvider(
                                create: (context) =>
                                    UploadSignUpImageProfileCubit()),
                            BlocProvider(
                                create: (context) =>
                                    LoginCubit(getIt.get<AuthRepoImpl>())),
                            BlocProvider(
                                create: (context) =>
                                    RegisterCubit(getIt.get<AuthRepoImpl>())),
                            BlocProvider(
                                create: (context) =>
                                    GetHomeDataCubit(getIt.get<HomeRepoImpl>())
                                      ..getHomeData()),
                            BlocProvider(
                                create: (context) => GetSliderDataCubit(
                                    getIt.get<HomeRepoImpl>())
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
                                    GetPackagesCubit(getIt.get())
                                      ..getPackages()),
                            BlocProvider(
                                create: (context) => LogoutCubit(getIt.get())),
                          ],
                          child: MaterialApp(
                            title: 'Aloo Türkiye',
                            locale: context.locale,
                            localizationsDelegates:
                                context.localizationDelegates,
                            supportedLocales: context.supportedLocales,
                            debugShowCheckedModeBanner: false,
                            navigatorKey: widget.navigatorKey,
                            home: () {
                              final String? role =
                                  CacheHelper.getData(key: "role");
                              return (role == null || role == 'user')
                                  ? const HomeNavBarWidget()
                                  : const TranslatorProfileView();
                            }(),
                            // routerConfig: router(widget.navigatorKey),
                          ),
                        );
                      });
                    });
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    setUserAvailability(true);
    NotificationService().initialize();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    setUserAvailability(false);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      setUserAvailability(false);
    } else if (state == AppLifecycleState.resumed) {
      setUserAvailability(true);
    }
  }

  void setUserAvailability(isAvailable) async {
    final token = CacheKeysManger.tokenStatus();
    bool isAuthenticated = token != "";
    if (isAuthenticated) {
      SetUserAvailability.call(isAvailable);
    }
  }
}
