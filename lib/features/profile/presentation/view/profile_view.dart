import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/constants.dart';
import 'package:kolayca/core/utils/services/remote_services/service_locator.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';
import 'package:kolayca/features/notivication/presentation/view/notivacation_view.dart';
import 'package:kolayca/features/profile/data/models/user_model.dart';
import 'package:kolayca/features/profile/presentation/view_models/get_profile_cubit/get_profile_cubit.dart';
import 'package:kolayca/features/profile/presentation/widget/custem_divider.dart';
import 'package:kolayca/features/profile/presentation/widget/personal_data.dart';
import 'package:kolayca/features/profile/presentation/widget/requs_and_notiva_item.dart';
import 'package:kolayca/features/requests/presentation/view/requests_view.dart';
import 'package:kolayca/features/requests/presentation/view_model/upload_image_profile/upload_image_profile_cubit.dart';

import '../../../../core/shared_widgets/custem_header_widget.dart';
import 'widgets/edit_profile_popup.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel? user;
    return BlocProvider(
      create: (context) => GetProfileCubit(getIt())..getProfile(),
      child: BlocBuilder<GetProfileCubit, GetProfileState>(
        builder: (context, state) {
          if (state is GetProfileSuccess) {
            user = state.userModel;
          }
          return Scaffold(
            backgroundColor: AppColor.ofWhight,
            appBar: PreferredSize(
              preferredSize:
                  const Size.fromHeight(0.0), // here the desired height
              child: AppBar(
                elevation: 0,
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Color(0xffEBEBEB),
                  statusBarIconBrightness: Brightness.dark,
                  systemNavigationBarColor: AppColor.deebPlue,
                  statusBarBrightness: Brightness.light,
                ),
              ),
            ),
            body: Column(
              children: [
                SizedBox(height: AppConstants.height20(context)),
                const CustemHeaderWidget(
                  text: 'ملفي الشخصي',
                ),
                SizedBox(height: AppConstants.height30(context) * 2),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.width20(context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<UploadImageProfileCubit,
                          UploadImageProfileState>(builder: (context, state) {
                        return Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: [
                            context
                                        .read<UploadImageProfileCubit>()
                                        .profileImage ==
                                    null
                                ? Image.asset(Assets.imagesFileimage,
                                    height: MediaQuery.of(context).size.width *
                                        0.25)
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        MediaQuery.of(context).size.width *
                                            0.25),
                                    child: Image.file(
                                      context
                                          .read<UploadImageProfileCubit>()
                                          .profileImage!,
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.25,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<UploadImageProfileCubit>()
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
                      SizedBox(width: AppConstants.width20(context)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PersonalData(
                              text: user?.name ?? '',
                              image: Assets.imagesName,
                            ),
                            SizedBox(height: AppConstants.height10(context)),
                            const PersonalData(
                              text: '05465446',
                              image: Assets.imagesPhon,
                            ),
                            SizedBox(height: AppConstants.height10(context)),
                            const PersonalData(
                              text: ' الايميل',
                              image: Assets.imagesEmail,
                            ),
                            SizedBox(height: AppConstants.height10(context)),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      const EditProfilePopup(),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColor.plueLight,
                                    width: 3,
                                  ),
                                  color: AppColor.ofWhight,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(Assets.imagesEdit),
                                    const SizedBox(width: 9),
                                    Text('تعديل',
                                        style: AppTextStyle.aljazeera400Style34d
                                            .copyWith(
                                          fontSize: 24,
                                        ))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 58),
                const CustemDivider(),
                const SizedBox(height: 20),
                RequestsAndNotviItem(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const NotificationView()));
                  },
                  text: 'الاشعارات',
                ),
                const SizedBox(height: 20),
                RequestsAndNotviItem(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RequestsView()));
                  },
                  text: 'الطلبات',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
