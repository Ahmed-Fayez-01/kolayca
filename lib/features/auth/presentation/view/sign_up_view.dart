import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kolayca/core/shared_widgets/home_nav_bar_widget.dart';
import 'package:kolayca/core/shared_widgets/toast.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/constants.dart';
import 'package:kolayca/core/utils/services/local_services/cache_helper.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';
import 'package:kolayca/features/auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:kolayca/features/auth/presentation/view_model/upload_sign_up_image_profile/upload_sign_up_image_profile_cubit.dart';
import 'package:kolayca/features/auth/presentation/widget/custem_text_field.dart';

import '../../../../core/utils/services/remote_services/service_locator.dart';
import '../../../profile/data/models/user_model.dart';

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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesBackground),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppConstants.width15(context)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: AppConstants.height55(context)),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: RotatedBox(
                            quarterTurns: 2,
                            child: SvgPicture.asset(
                              Assets.back,
                              width: MediaQuery.of(context).size.height * .03,
                            ))),
                  ),
                  SizedBox(height: AppConstants.height5(context)),
                  BlocBuilder<UploadSignUpImageProfileCubit,
                      UploadSignUpImageProfileState>(builder: (context, state) {
                    return Stack(
                      alignment: AlignmentDirectional.bottomStart,
                      children: [
                        context
                                    .read<UploadSignUpImageProfileCubit>()
                                    .profileImage ==
                                null
                            ? Image.asset(
                                Assets.imagesGroup,
                                height:
                                    MediaQuery.of(context).size.width * 0.35,
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width * 0.35),
                                child: Image.file(
                                  context
                                      .read<UploadSignUpImageProfileCubit>()
                                      .profileImage!,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  height:
                                      MediaQuery.of(context).size.width * 0.35,
                                  fit: BoxFit.cover,
                                ),
                              ),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<UploadSignUpImageProfileCubit>()
                                .selectProfileImage();
                          },
                          child: CircleAvatar(
                              radius: 20.sp,
                              backgroundColor: Colors.black,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 30.sp,
                              )),
                        ),
                      ],
                    );
                  }),
                  SizedBox(height: AppConstants.height20(context)),
                  Text(
                    'حساب جديد',
                    style: AppTextStyle.aljazeera400Style34
                        .copyWith(color: const Color(0xff5F5F5F)),
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
                        SizedBox(height: AppConstants.height20(context)),
                        CustomTextField(
                          hintText: 'تاكيد كلمه المرور',
                          controller: confirmPasswordController,
                          obscureText: true,
                          prefixIcon: const Icon(Icons.lock_outline,
                              color: Color(0xff7E8384)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppConstants.height30(context)),
                  BlocConsumer<RegisterCubit, RegisterState>(
                      listener: (context, state) async {
                    if (state is UserRegisterSuccessState) {
                      CacheHelper.saveData(
                          key: "token",
                          value: "Bearer ${state.model.accessToken}");
                      CacheHelper.saveData(
                          key: "name", value: "${state.model.data!.name}");
                      CacheHelper.saveData(
                          key: "email", value: "${state.model.data!.email}");
                      if (getIt.isRegistered<UserModel>()) {
                        await getIt.unregister<UserModel>();
                      }
                      getIt.registerSingleton<UserModel>(
                        UserModel.fromMap(state.model.data?.toJson() ?? {}),
                      );
                      toast(text: state.model.message!, color: Colors.green);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeNavBarWidget()));
                    } else if (state is UserRegisterErrorState) {
                      toast(text: state.errMessage, color: Colors.red);
                    }
                  }, builder: (context, state) {
                    return state is UserRegisterLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : GestureDetector(
                            onTap: () {
                              context.read<RegisterCubit>().userRegister(
                                  password: passwordController.text,
                                  email: emailController.text,
                                  confirmPassword:
                                      confirmPasswordController.text,
                                  name: nameController.text);
                            },
                            child: Image.asset(
                              Assets.imagesCreate,
                              height: 100,
                            ),
                          );
                  }),
                ],
              ),
            )),
      ),
    );
  }
}
