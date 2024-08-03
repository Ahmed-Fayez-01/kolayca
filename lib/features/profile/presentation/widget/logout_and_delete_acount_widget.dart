import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kolayca/core/shared_widgets/loading_state_widget.dart';
import 'package:kolayca/core/utils/functions/set_user_availability.dart';
import 'package:kolayca/core/utils/services/local_services/cache_helper.dart';
import 'package:kolayca/core/utils/services/remote_services/service_locator.dart';
import 'package:kolayca/features/profile/data/models/user_model.dart';
import 'package:kolayca/features/profile/presentation/view_models/delete_acount_cubit/delete_account_cubit.dart';
import 'package:kolayca/features/profile/presentation/view_models/logout_cubit/logout_cubit.dart';

import '../../../../core/utils/functions/warning_dialoge.dart';
import '../../../../core/utils/services/remote_services/zego_cloud_service.dart';
import '../../../auth/presentation/view/sign_in_view.dart';

class LogoutAndDeleteAcountWidget extends StatelessWidget {
  const LogoutAndDeleteAcountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteAccountCubit(getIt()),
      child: BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
        listener: (context, state) async {
          if (state is DeleteAccountLoading) {
            showDialog(
                context: context,
                builder: (context) => const Scaffold(
                      backgroundColor: Colors.white,
                      body: Center(child: LoadingBody()),
                    ));
          } else if (state is DeleteAccountSuccess) {
            await logoutAndDeleteAccount(context);
            Fluttertoast.showToast(msg: 'accountDeleted'.tr());
          } else if (state is DeleteAccountError) {
            Fluttertoast.showToast(
                msg: 'somethingWentWrong'.tr(), backgroundColor: Colors.red);
          }
        },
        builder: (context, state) {
          return BlocListener<LogoutCubit, LogoutState>(
            listener: (context, state) async {
              if (state is LogoutLoading) {
                showDialog(
                    context: context,
                    builder: (context) => const Scaffold(
                          backgroundColor: Colors.white,
                          body: Center(child: LoadingBody()),
                        ));
              } else if (state is LogoutSuccess) {
                await logoutAndDeleteAccount(context);
                Fluttertoast.showToast(msg: "logoutSuccessfully".tr());
              } else if (state is LogoutFailure) {
                Fluttertoast.showToast(
                    msg: 'somethingWentWrong'.tr(),
                    backgroundColor: Colors.red);
              }
            },
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    showWarningDialog(context, () async {
                      BlocProvider.of<LogoutCubit>(context).logOut();
                    }, 'doYouWantToLogout'.tr());
                  },
                  child: _buttonWidget(),
                ),
                if (CacheHelper.getData(key: "role") == null ||
                    CacheHelper.getData(key: "role") == "user")
                  TextButton(
                    onPressed: () {
                      showWarningDialog(context, () {
                        BlocProvider.of<DeleteAccountCubit>(context)
                            .deleteAccount();
                      }, 'doYouWantToDeleteAccount'.tr());
                    },
                    child: _buttonWidget(
                        text: 'deleteAccount'.tr(), icon: Icons.delete_outline),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future logoutAndDeleteAccount(context) async {
    getIt.unregister<UserModel>();
    CacheHelper.removeData(key: 'token');
    CacheHelper.removeData(key: 'userId');
    CacheHelper.removeData(key: 'role');
    ZegoServices.onUserLogout();

    await SetUserAvailability.call(false);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignInView()),
    );
  }

  Row _buttonWidget({String? text, IconData icon = Icons.logout}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xffF34235),
          radius: 25.r,
          child: Padding(
            padding: EdgeInsets.all(8.r),
            child: Icon(
              icon,
              color: Colors.white,
              size: 30.sp,
            ),
          ),
        ),
        10.horizontalSpace,
        Text(
          text ?? 'logout'.tr(),
          style: TextStyle(
              color: const Color(0xffF34235),
              fontSize: 30.sp,
              fontFamily: 'Aljazeera'),
        ),
      ],
    );
  }
}
