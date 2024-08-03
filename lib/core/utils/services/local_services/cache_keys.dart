import 'cache_helper.dart';

class CacheKeysManger {
  static bool onBoardingStatus() =>
      CacheHelper.getData(key: 'onBoarding') ?? false;
  static String tokenStatus() => CacheHelper.getData(key: 'token') ?? "";
  static int userId() => CacheHelper.getData(key: 'userId') ?? 0;

  static int get notificationsCount =>
      CacheHelper.getData(key: "notificationsCount") ?? 0;
  static incrementNotificationsCount() {
    int count = notificationsCount;
    CacheHelper.saveData(key: "notificationsCount", value: ++count);
  }

  static resetNotificationsCount() {
    CacheHelper.removeData(key: "notificationsCount");
  }
}
