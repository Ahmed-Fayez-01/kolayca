import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_color.dart';

void showWarningDialog(BuildContext context, Function onAccept, String message,
    {String? acceptText, bool acceptRecomended = false}) {
  showDialog(
    context: context,
    useSafeArea: false,
    builder: (context) => _WarningDialog(
      message: message,
      onAccept: onAccept,
      acceptText: acceptText,
      acceptRecomended: acceptRecomended,
    ),
  );
}

class _WarningDialog extends StatelessWidget {
  const _WarningDialog({
    super.key,
    required this.message,
    required this.onAccept,
    this.acceptText,
    required this.acceptRecomended,
  });
  final String message;
  final Function onAccept;
  final String? acceptText;
  final bool acceptRecomended;
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.warning_amber_outlined,
                    color: Colors.red,
                    size: 30.sp,
                  ),
                  10.horizontalSpace,
                  Text('alert'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontFamily: 'Aljazeera')),
                ],
              ),
              20.verticalSpace,
              Text(
                message,
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
                        acceptRecomended ? Colors.green : Colors.red,
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
                      onAccept();
                    },
                    child: Text(acceptText ?? 'confirm'.tr()),
                  ),
                  FilledButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        acceptRecomended ? Colors.red : Colors.green,
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
