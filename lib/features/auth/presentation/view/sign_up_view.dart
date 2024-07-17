import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';
import 'package:kolayca/features/auth/data/auth_cubit/auth_cubit.dart';
import 'package:kolayca/features/auth/presentation/view/sign_in_view.dart';
import 'package:kolayca/features/auth/presentation/widget/custem_text_field.dart';

class SignUpView extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Image.asset(
                      Assets.imagesGroup,
                      height: 150,
                    ),
                    const SizedBox(height: 25),
                    Text(
                      'حساب جديد',
                      style: AppTextStyle.aljazeera400Style34
                          .copyWith(color: AppColor.deebGrey),
                    ),
                    Container(
                      height: 2,
                      width: 155,
                      color: AppColor.deebGrey,
                    ),
                    const SizedBox(height: 25),
                    CustomTextField(
                        hintText: 'الاسم', controller: nameController),
                    CustomTextField(
                        hintText: 'البريد الالكتروني',
                        controller: emailController),
                    CustomTextField(
                        hintText: 'كلمه المرور',
                        controller: passwordController,
                        obscureText: true),
                    CustomTextField(
                        hintText: 'تاكيد كلمه المرور',
                        controller: confirmPasswordController,
                        obscureText: true),
                    const SizedBox(height: 45),
                    GestureDetector(
                      onTap: () {
                        context.read<AuthCubit>().createAccount(
                              nameController.text,
                              emailController.text,
                              passwordController.text,
                              confirmPasswordController.text,
                            );
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInView()));
                      },
                      child: Image.asset(
                        Assets.imagesCreate,
                        height: 100,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
