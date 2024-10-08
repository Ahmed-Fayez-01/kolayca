import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/utils/services/local_services/cache_keys.dart';

import '../../../features/auth/presentation/view/sign_in_view.dart';
import '../../../features/profile/data/models/user_model.dart';
import '../colors/app_color.dart';
import '../services/remote_services/service_locator.dart';

void showAuthorizationDialog(BuildContext context, Function onAuthorized) {
  if (CacheKeysManger.tokenStatus() != "" && getIt.isRegistered<UserModel>()) {
    onAuthorized();
  } else {
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) => const _AuthorizationDialog(),
    );
  }
}

class _AuthorizationDialog extends StatelessWidget {
  const _AuthorizationDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: Color(0xffEBEBEB),
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: AppColor.deebPlue,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0).r,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('loginRequired'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontFamily: 'Aljazeera')),
              20.verticalSpace,
              Text(
                'pleaseLoginToContinue'.tr(),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: 'Aljazeera',
                      color: AppColor.deebGrey,
                    ),
              ),
              40.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilledButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Colors.green,
                      ),
                      foregroundColor: WidgetStateProperty.all(
                        Colors.white,
                      ),
                      shape: WidgetStateProperty.all(
                        const StadiumBorder(),
                      ),
                      textStyle: WidgetStateProperty.all(
                        Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontFamily: 'Aljazeera'),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInView()));
                    },
                    child: Text('login'.tr()),
                  ),
                  FilledButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Colors.red,
                      ),
                      foregroundColor: WidgetStateProperty.all(
                        Colors.white,
                      ),
                      shape: WidgetStateProperty.all(
                        const StadiumBorder(),
                      ),
                      textStyle: WidgetStateProperty.all(
                        Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontFamily: 'Aljazeera'),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('cancel'.tr()),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
