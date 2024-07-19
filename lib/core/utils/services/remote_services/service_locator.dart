import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kolayca/features/auth/data/repo/auth_repo_impl.dart';
import 'package:kolayca/features/home/data/repo/auth_repo_impl.dart';
import 'package:kolayca/features/hwo_us/data/repos/about_us_repo_impl.dart';
import 'package:kolayca/features/lessons/data/repos/lessons_repo.dart';
import 'package:kolayca/features/lessons/data/repos/lessons_repo_impl.dart';
import 'package:kolayca/features/profile/data/repos/profile_repo.dart';
import 'package:kolayca/features/requests/data/repos/orders_repo.dart';
import 'package:kolayca/features/translator_profile/data/repos/translator_orders_repo.dart';
import '../../../../features/how_to_request _translator/data/repo/request_translator_repo.dart';
import '../../../../features/live_translator/data/repos/live_translator_method_repo.dart';
import 'api_service.dart';
//dependency Injection

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<AboutUsRepoImpl>(
      AboutUsRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<LessonsRepo>(
      LessonsRepoImpl(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<RequestTranslatorRepo>(
      RequestTranslatorRepo(getIt.get<ApiService>()));
  getIt.registerSingleton<OrdersRepo>(OrdersRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<LiveTranslatorMethodRepo>(
      LiveTranslatorMethodRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<TranslatorOrdersRepo>(
      TranslatorOrdersRepoImpl(getIt.get<ApiService>()));
  getIt
      .registerSingleton<ProfileRepo>(ProfileRepoImpl(getIt.get<ApiService>()));
}
