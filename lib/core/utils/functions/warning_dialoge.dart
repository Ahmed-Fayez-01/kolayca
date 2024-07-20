import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_color.dart';

void showWarningDialog(
    BuildContext context, Function onAccept, String message) {
  showDialog(
    context: context,
    useSafeArea: false,
    builder: (context) => _WarningDialog(
      message: message,
      onAccept: onAccept,
    ),
  );
}

class _WarningDialog extends StatelessWidget {
  const _WarningDialog({
    super.key,
    required this.message,
    required this.onAccept,
  });
  final String message;
  final Function onAccept;
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
                  Text('تنبيه',
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
                      onAccept();
                    },
                    child: const Text('تأكيد'),
                  ),
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
                      Navigator.of(context).pop();
                    },
                    child: const Text('الغاء'),
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
