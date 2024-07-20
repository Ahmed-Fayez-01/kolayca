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
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SignInView()),
            );
            Fluttertoast.showToast(msg: 'تم حذف الحساب بنجاح');
          } else if (state is DeleteAccountError) {
            Fluttertoast.showToast(
                msg: 'حدث خطأ ما', backgroundColor: Colors.red);
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
                    getIt.unregister<UserModel>();
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignInView()),
                    );
                  }, 'هل تريد تسجيل الخروج؟');
                },
                child: _buttonWidget(),
              ),
              TextButton(
                onPressed: () {
                  showWarningDialog(context, () {
                    BlocProvider.of<DeleteAccountCubit>(context)
                        .deleteAccount();
                  }, 'هل تريد حذف حسابك؟');
                },
                child: _buttonWidget(
                    text: 'حذف الحساب', icon: Icons.delete_outline),
              ),
            ],
          );
        },
      ),
    );
  }

  Row _buttonWidget(
      {String text = 'تسجيل الخروج', IconData icon = Icons.logout}) {
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
          text,
          style: TextStyle(
              color: const Color(0xffF34235),
              fontSize: 30.sp,
              fontFamily: 'Aljazeera'),
        ),
      ],
    );
  }
}
