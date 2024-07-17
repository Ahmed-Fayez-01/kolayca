import 'package:go_router/go_router.dart';

void custemPushReplaceNavigate(context, String path) {
  GoRouter.of(context).pushReplacement(path);
}

void custemPush(context, String path) {
  GoRouter.of(context).push(path);
}

void custemPop(context) {
  GoRouter.of(context).pop();
}

void customNavigate(context, String path, {Object? extra}) {
  GoRouter.of(context).push(path, extra: extra);
}
