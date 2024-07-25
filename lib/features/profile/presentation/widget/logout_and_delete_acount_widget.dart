import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kolayca/core/shared_widgets/loading_state_widget.dart';
import 'package:kolayca/core/utils/services/local_services/cache_helper.dart';
import 'package:kolayca/core/utils/services/remote_services/service_locator.dart';
import 'package:kolayca/features/profile/data/models/user_model.dart';
import 'package:kolayca/features/profile/presentation/view_models/delete_acount_cubit/delete_account_cubit.dart';

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
        listener: (context, state) {
          if (state is DeleteAccountLoading) {
            showDialog(
                context: context,
                builder: (context) => const Scaffold(
                      backgroundColor: Colors.white,
                      body: Center(child: LoadingBody()),
                    ));
          } else if (state is DeleteAccountSuccess) {
            getIt.unregister<UserModel>();
            CacheHelper.removeData(key: 'token');
            CacheHelper.removeData(key: 'userId');
            CacheHelper.removeData(key: 'role');

            ZegoServices.onUserLogout();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignInView()),
            );
            Fluttertoast.showToast(msg: 'accountDeleted'.tr());
          } else if (state is DeleteAccountError) {
            Fluttertoast.showToast(
                msg: 'somethingWentWrong'.tr(), backgroundColor: Colors.red);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              TextButton(
                onPressed: () {
                  showWarningDialog(context, () {
                    CacheHelper.removeData(key: 'token');
                    CacheHelper.removeData(key: 'userId');
                    CacheHelper.removeData(key: 'role');
                    ZegoServices.onUserLogout();
                    getIt.unregister<UserModel>();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInView()),
                    );
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
          );
        },
      ),
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
