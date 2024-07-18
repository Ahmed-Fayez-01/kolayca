import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kolayca/features/auth/presentation/view/sign_up_view.dart';
import 'package:kolayca/features/how_to_request%20_translator/presentation/view/how_to_request_translator_view.dart';
import 'package:kolayca/features/lessons/presentation/view/lesson_view.dart';
import 'package:kolayca/features/live_translator/presentation/view/live_translator_view.dart';
import 'package:kolayca/features/nearest_translator/presentation/view/nearest_translator_view.dart';
import 'package:kolayca/features/notivication/presentation/view/notivacation_view.dart';
import 'package:kolayca/features/profile/presentation/view/profile_view.dart';
import 'package:kolayca/features/requests/presentation/view/requests_view.dart';
import 'package:kolayca/features/subscription_%20package/presentation/view/subscription_package_view.dart';

import '../../shared_widgets/home_nav_bar_widget.dart';

const String lessonsView = '/lessons_view';
const String subscriptionPackageView = '/subscription_package_view';
const String nearestTranslatorView = '/nearest_translator_view';
const String liveTranslatorView = '/live_translator_view';
const String notiviacationView = '/notiviacation_view';
const String requestsView = '/requests_view';
const String profileView = '/profile_view';
const String howToRequestTranslatorView = '/how_to_request_translator_view';
const String signUpView = '/sign_up_view';
const String signInView = '/sign_in_view';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) =>const HomeNavBarWidget(),
  ),
  GoRoute(
    path: lessonsView,
    builder: (context, state) => const LessonsView(),
  ),
  GoRoute(
    path: nearestTranslatorView,
    builder: (context, state) => const NearestTranslatorView(),
  ),
  GoRoute(
    path: subscriptionPackageView,
    builder: (context, state) => const SubscriptionPackageView(),
  ),
  GoRoute(
    path: liveTranslatorView,
    builder: (context, state) => const LiveTranslatorView(),
  ),
  GoRoute(
    path: notiviacationView,
    builder: (context, state) => const NotificationView(),
  ),
  GoRoute(
    path: requestsView,
    builder: (context, state) => const RequestsView(),
  ),
  GoRoute(
    path: profileView,
    builder: (context, state) => const ProfileView(),
  ),
  GoRoute(
    path: howToRequestTranslatorView,
    builder: (context, state) => const HowToRequestTranslatorView(),
  ),
  // GoRoute(
  //   path: signUpView,
  //   builder: (context, state) => BlocProvider(
  //     // create: (context) => AuthCubit(),
  //     child: SignUpView(),
  //   ),
  // ),
]);
