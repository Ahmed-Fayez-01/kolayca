import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/shared_widgets/home_nav_bar_widget.dart';
import 'package:kolayca/core/shared_widgets/loading_state_widget.dart';
import 'package:kolayca/core/shared_widgets/toast.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/constants.dart';
import 'package:kolayca/core/utils/functions/set_user_availability.dart';
import 'package:kolayca/core/utils/services/local_services/cache_helper.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';
import 'package:kolayca/features/auth/presentation/view/sign_up_view.dart';
import 'package:kolayca/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:kolayca/features/auth/presentation/widget/custem_text_field.dart';
import 'package:kolayca/features/home/presentation/view_model/get_slider_cubit/get_slider_cubit.dart';
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
    return BlocBuilder<GetSliderDataCubit, GetSliderDataState>(
      builder: (context, state) {
        return BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) async {
            if (state is LoginSuccessState) {
              CacheHelper.saveData(
                  key: "token", value: "Bearer ${state.model.accessToken}");
              CacheHelper.saveData(
                  key: "name", value: "${state.model.data!.name}");
              CacheHelper.saveData(
                  key: "email", value: "${state.model.data!.email}");
              CacheHelper.saveData(
                  key: "role", value: "${state.model.data!.role}");
              if (getIt.isRegistered<UserModel>()) {
                await getIt.unregister<UserModel>();
              }
              getIt.registerSingleton<UserModel>(state.model.data!);
              await SetUserAvailability.call(true);
              toast(text: state.model.message!, color: Colors.green);
              if (state.model.data!.role == 'user') {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeNavBarWidget()),
                  (route) => route.isFirst,
                );
              } else {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TranslatorProfileView(),
                  ),
                  (route) => route.isFirst,
                );
              }
            } else if (state is LoginErrorState) {
              toast(text: state.errMessage, color: Colors.red);
            }
          },
          builder: (context, state) {
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
                    child: state is LoginLoadingState
                        ? LoadingBody()
                        : CustomScrollView(
                            slivers: [
                              SliverFillRemaining(
                                hasScrollBody: false,
                                fillOverscroll: true,
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 50.h),
                                      CachedNetworkImage(
                                        imageUrl: context
                                                .read<GetSliderDataCubit>()
                                                .logoImageurl ??
                                            '',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .7,
                                        // height: MediaQuery.of(context).size.height * .08,
                                      ),
                                      SizedBox(
                                          height:
                                              AppConstants.height55(context) *
                                                  1.7),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                AppConstants.width20(context) *
                                                    1.5),
                                        child: Column(
                                          children: [
                                            CustomTextField(
                                              hintText: 'email'.tr(),
                                              controller: nameController,
                                              validate: (String? value) {
                                                if (value!.isEmpty) {
                                                  return "thisFieldIsRequired"
                                                      .tr();
                                                } else if (EmailValidator
                                                    .validate(value.trim())) {
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
                                                height: AppConstants.height20(
                                                    context)),
                                            CustomTextField(
                                                hintText: 'password'.tr(),
                                                controller: passwordController,
                                                obscureText: true,
                                                validate: (v) {
                                                  if (v == null || v.isEmpty) {
                                                    return "thisFieldIsRequired"
                                                        .tr();
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
                                      CustemBottom(
                                        text: 'login'.tr(),
                                        color: Colors.white,
                                        onTap: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            context
                                                .read<LoginCubit>()
                                                .login(data: {
                                              "email": nameController.text,
                                              "password":
                                                  passwordController.text,
                                              "firebase_token":
                                                  await FirebaseMessaging
                                                      .instance
                                                      .getToken()
                                            });
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        height: AppConstants.height20(context),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'dontHaveAccount'.tr(),
                                            style: AppTextStyle
                                                .aljazeera400Style21
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
                                                padding: EdgeInsetsDirectional
                                                    .symmetric(
                                                        horizontal: AppConstants
                                                            .width10(context),
                                                        vertical: AppConstants
                                                            .height5(context)),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            AppConstants.sp30(
                                                                context)),
                                                    color: AppColor.plueLight),
                                                child: Text(
                                                  'createNewAccount'.tr(),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: AppTextStyle
                                                      .aljazeera400Style21
                                                      .copyWith(
                                                          fontSize: 24.sp),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      20.verticalSpace,
                                      Text(
                                        'enterAsGuest'.tr(),
                                        style: AppTextStyle.aljazeera400Style21
                                            .copyWith(fontSize: 24.sp),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeNavBarWidget()));
                                        },
                                        child: Container(
                                          padding:
                                              EdgeInsetsDirectional.symmetric(
                                                  horizontal:
                                                      AppConstants.width10(
                                                          context),
                                                  vertical:
                                                      AppConstants.height5(
                                                          context)),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      AppConstants.sp30(
                                                          context)),
                                              color: AppColor.plueLight),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.w),
                                            child: Text(
                                              'mainHome'.tr(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppTextStyle
                                                  .aljazeera400Style21
                                                  .copyWith(fontSize: 24.sp),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Powered by ',
                                          style: AppTextStyle
                                              .aljazeera400Style21
                                              .copyWith(fontSize: 24.sp),
                                          children: [
                                            TextSpan(
                                              text: 'kolaycakonus.com',
                                              style: AppTextStyle
                                                  .aljazeera400Style21
                                                  .copyWith(
                                                      fontSize: 24.sp,
                                                      color:
                                                          AppColor.plueLight),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
