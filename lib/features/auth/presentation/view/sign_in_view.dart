import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/shared_widgets/home_nav_bar_widget.dart';
import 'package:kolayca/core/shared_widgets/toast.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/constants.dart';
import 'package:kolayca/core/utils/services/local_services/cache_helper.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';
import 'package:kolayca/features/auth/presentation/view/sign_up_view.dart';
import 'package:kolayca/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
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
      body: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: AppColor.deebPlue,
        ),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.imagesBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: 25.h),
                      Image.asset(Assets.imagesTitle),
                      SizedBox(height: AppConstants.height55(context) * 1.7),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppConstants.width20(context) * 1.5),
                        child: Column(
                          children: [
                            CustomTextField(
                              hintText: 'الاسم',
                              controller: nameController,
                              prefixIcon: const Icon(
                                Icons.person_2_outlined,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: AppConstants.height20(context)),
                            CustomTextField(
                                hintText: 'كلمه المرور',
                                controller: passwordController,
                                obscureText: true,
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                      ),
                      BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                          if (state is LoginSuccessState) {
                            CacheHelper.saveData(
                                key: "token",
                                value: "Bearer ${state.model.accessToken}");
                            CacheHelper.saveData(
                                key: "name",
                                value: "${state.model.data!.name}");
                            CacheHelper.saveData(
                                key: "email",
                                value: "${state.model.data!.email}");
                            toast(
                                text: state.model.message!,
                                color: Colors.green);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const HomeNavBarWidget()));
                          } else if (state is LoginErrorState) {
                            toast(text: state.errMessage, color: Colors.red);
                          }
                        },
                        builder: (context, state) => state is LoginLoadingState
                            ? const Center(child: CircularProgressIndicator())
                            : CustemBottom(
                                text: 'الدخول',
                                color: AppColor.plueLight,
                                onTap: () {
                                  context.read<LoginCubit>().login(data: {
                                    "name": nameController.text,
                                    "password": passwordController.text,
                                  });
                                },
                              ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'اذا لم يكن لديك حساب رجاء',
                            style: AppTextStyle.aljazeera400Style21
                                .copyWith(fontSize: 25.sp),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpView()));
                            },
                            child: Container(
                              padding: EdgeInsetsDirectional.symmetric(
                                  horizontal: AppConstants.width10(context),
                                  vertical: AppConstants.height5(context)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppConstants.sp30(context)),
                                  color: AppColor.plueLight),
                              child: Text(
                                'انشاء حساب جديد',
                                style: AppTextStyle.aljazeera400Style21
                                    .copyWith(fontSize: 25.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
