import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/features/profile/presentation/view_models/language_cubit/change_language_cubit.dart';

class ChangeLanguageWidget extends StatelessWidget {
  const ChangeLanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        surfaceTintColor: Colors.white,
        color: Colors.white,
        offset: Offset(0, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        onSelected: (value) {
          context.read<ChangeLanguageCubit>().changeLanguage(context, value);
        },
        itemBuilder: (context) {
          return const [
            PopupMenuItem(
              value: 'ar',
              child: Text('العربية'),
            ),
            PopupMenuItem(
              value: 'tr',
              child: Text('Turkish'),
            ),
          ];
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: AppColor.plueLight,
              radius: 25.r,
              child: Padding(
                padding: EdgeInsets.all(8.r),
                child: Icon(
                  Icons.language,
                  color: Colors.white,
                  size: 30.sp,
                ),
              ),
            ),
            10.horizontalSpace,
            Text(
              context.locale != Locale('ar') ? 'Turkish' : 'العربية',
              style: TextStyle(
                  color: AppColor.plueLight,
                  fontSize: 30.sp,
                  fontFamily: 'Aljazeera'),
            ),
          ],
        ));
  }
}
