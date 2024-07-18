import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kolayca/features/auth/data/repo/auth_repo_impl.dart';
import 'package:kolayca/features/home/data/repo/auth_repo_impl.dart';
import 'package:kolayca/features/hwo_us/data/repos/about_us_repo_impl.dart';
import 'api_service.dart';
//dependency Injection

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<AboutUsRepoImpl>(AboutUsRepoImpl(getIt.get<ApiService>()));
}
