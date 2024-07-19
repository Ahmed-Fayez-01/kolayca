import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/text_styles/app_text_style.dart';
import '../../../../auth/presentation/widget/custem_text_field.dart';

class EditProfilePopup extends StatefulWidget {
  const EditProfilePopup({super.key});

  @override
  State<EditProfilePopup> createState() => _EditProfilePopupState();
}

class _EditProfilePopupState extends State<EditProfilePopup> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(20).r,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'تعديل حساب',
              style: AppTextStyle.aljazeera400Style34
                  .copyWith(color: const Color(0xff5F5F5F), fontSize: 34.sp),
            ),
            Container(
              height: 3.h,
              width: MediaQuery.of(context).size.width * 0.35,
              color: const Color(0xff5F5F5F),
            ),
            SizedBox(height: AppConstants.height20(context)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.width20(context) * 2),
              child: Column(
                children: [
                  CustomTextField(
                    hintText: 'الاسم',
                    controller: nameController,
                    prefixIcon: const Icon(Icons.person_2_outlined,
                        color: Color(0xff7E8384)),
                  ),
                  SizedBox(height: AppConstants.height20(context)),
                  CustomTextField(
                    hintText: 'البريد الالكتروني',
                    controller: emailController,
                    prefixIcon: const Icon(Icons.email_outlined,
                        color: Color(0xff7E8384)),
                  ),
                  SizedBox(height: AppConstants.height20(context)),
                  CustomTextField(
                    hintText: 'كلمه المرور',
                    controller: passwordController,
                    obscureText: true,
                    prefixIcon: const Icon(Icons.lock_outline,
                        color: Color(0xff7E8384)),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppConstants.height20(context)),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(AppColor.deebPlue),
                      shape: WidgetStateProperty.all(
                        const StadiumBorder(),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'حفظ التعديلات',
                      style: AppTextStyle.madaniArabic400Style20
                          .copyWith(color: const Color(0xffffffff)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
