import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/text_styles/app_text_style.dart';
import '../../../../auth/presentation/widget/custem_text_field.dart';
import '../../view_models/get_profile_cubit/get_profile_cubit.dart';
import '../../view_models/update_profile_cubit/update_profile_cubit.dart';

class EditProfilePopup extends StatefulWidget {
  const EditProfilePopup({super.key});

  @override
  State<EditProfilePopup> createState() => _EditProfilePopupState();
}

class _EditProfilePopupState extends State<EditProfilePopup> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  @override
  void initState() {
    final user = context.read<GetProfileCubit>().getUserProfile();
    nameController = TextEditingController(text: user?.name);
    emailController = TextEditingController(text: user?.email);
    passwordController = TextEditingController();
    super.initState();
  }

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
            BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
              builder: (context, state) {
                return Row(
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
                        onPressed: state is UpdateProfileLoading
                            ? () {}
                            : () async {
                                if (nameController.text.isEmpty ||
                                    emailController.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      msg:
                                          'يجب تعبئة الاسم والبريد الالكتروني');
                                  return;
                                }
                                await context
                                    .read<UpdateProfileCubit>()
                                    .updateUserProfile(data: {
                                  'name': nameController.text,
                                  'email': emailController.text,
                                  if (passwordController.text.isNotEmpty)
                                    'new_password': passwordController.text
                                });
                                Navigator.pop(context);
                              },
                        child: state is UpdateProfileLoading
                            ? LoadingAnimationWidget.staggeredDotsWave(
                                color: AppColor.ofWhight,
                                size: 40.sp,
                              )
                            : Text(
                                'حفظ التعديلات',
                                style: AppTextStyle.madaniArabic400Style20
                                    .copyWith(color: const Color(0xffffffff)),
                              ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
