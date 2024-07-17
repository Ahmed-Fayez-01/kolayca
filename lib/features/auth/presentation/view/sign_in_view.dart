import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';
import 'package:kolayca/features/auth/data/auth_cubit/auth_cubit.dart';
import 'package:kolayca/features/auth/presentation/widget/custem_text_field.dart';

import '../../../../core/shared_widgets/custem_bottom.dart';
import '../../../../core/utils/functions/custem_navigate.dart';
import '../../../../core/utils/roots/app_router.dart';

class SignInView extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInView({super.key});

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
                    const SizedBox(height: 25),
                    Image.asset(Assets.imagesTitle),
                    const SizedBox(height: 100),
                    CustomTextField(
                        hintText: 'الاسم', controller: nameController),
                    CustomTextField(
                        hintText: 'كلمه المرور',
                        controller: passwordController,
                        obscureText: true),
                    CustemBottom(
                      text: 'الدخول',
                      onTap: () {
                        context.read<AuthCubit>().logIn(
                            nameController.text, passwordController.text);
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        custemPushReplaceNavigate(context, signUpView);
                      },
                      child: const Text(
                        'انشاء حساب جديد',
                        style: AppTextStyle.aljazeera400Style21,
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
