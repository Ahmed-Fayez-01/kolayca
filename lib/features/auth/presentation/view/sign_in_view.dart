import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kolayca/core/shared_widgets/toast.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/constants.dart';
import 'package:kolayca/core/utils/services/local_services/cache_helper.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';
import 'package:kolayca/features/auth/presentation/view/sign_up_view.dart';
import 'package:kolayca/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:kolayca/features/auth/presentation/widget/custem_text_field.dart';
import 'package:kolayca/features/profile/data/models/user_model.dart';
import 'package:kolayca/features/translator_profile/presentation/views/translator_profile_view.dart';

import '../../../../core/shared_widgets/custem_bottom.dart';
import '../../../../core/utils/services/remote_services/service_locator.dart';

class SignInView extends StatefulWidget {
  SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 25.h),
                          Image.asset(Assets.imagesTitle),
                          SizedBox(
                              height: AppConstants.height55(context) * 1.7),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    AppConstants.width20(context) * 1.5),
                            child: Column(
                              children: [
                                CustomTextField(
                                  hintText: 'email'.tr(),
                                  controller: nameController,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return "thisFieldIsRequired".tr();
                                    } else if (EmailValidator.validate(value)) {
                                      return null;
                                    } else {
                                      return "pleaseProvideValidEmailAddress"
                                          .tr();
                                    }
                                  },
                                  prefixIcon: const Icon(
                                    Icons.person_2_outlined,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                    height: AppConstants.height20(context)),
                                CustomTextField(
                                    hintText: 'password'.tr(),
                                    controller: passwordController,
                                    obscureText: true,
                                    validate: (v) {
                                      if (v == null || v.isEmpty) {
                                        return "thisFieldIsRequired".tr();
                                      }
                                      return null;
                                    },
                                    prefixIcon: const Icon(
                                      Icons.lock_outline,
                                      color: Colors.grey,
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: AppConstants.height20(context),
                          ),
                          BlocConsumer<LoginCubit, LoginState>(
                            listener: (context, state) async {
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
                                CacheHelper.saveData(
                                    key: "role",
                                    value: "${state.model.data!.role}");
                                if (getIt.isRegistered<UserModel>()) {
                                  await getIt.unregister<UserModel>();
                                }
                                getIt.registerSingleton<UserModel>(
                                  UserModel.fromMap(
                                      state.model.data?.toJson() ?? {}),
                                );

                                toast(
                                    text: state.model.message!,
                                    color: Colors.green);
                                if (state.model.data!.role == 'user') {
                                  GoRouter.of(context).go("/homeNavBarWidget");
                                } else {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TranslatorProfileView()),
                                      (r) => true);
                                }
                              } else if (state is LoginErrorState) {
                                toast(
                                    text: state.errMessage, color: Colors.red);
                              }
                            },
                            builder: (context, state) => state
                                    is LoginLoadingState
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : CustemBottom(
                                    text: 'login'.tr(),
                                    color: AppColor.plueLight,
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<LoginCubit>().login(data: {
                                          "email": nameController.text,
                                          "password": passwordController.text,
                                        });
                                      }
                                    },
                                  ),
                          ),
                          SizedBox(
                            height: AppConstants.height20(context),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'dontHaveAccount'.tr(),
                                style: AppTextStyle.aljazeera400Style21
                                    .copyWith(fontSize: 24.sp),
                              ),
                              Flexible(
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpView()));
                                  },
                                  child: Container(
                                    padding: EdgeInsetsDirectional.symmetric(
                                        horizontal:
                                            AppConstants.width10(context),
                                        vertical:
                                            AppConstants.height5(context)),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            AppConstants.sp30(context)),
                                        color: AppColor.plueLight),
                                    child: Text(
                                      'createNewAccount'.tr(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyle.aljazeera400Style21
                                          .copyWith(fontSize: 24.sp),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
