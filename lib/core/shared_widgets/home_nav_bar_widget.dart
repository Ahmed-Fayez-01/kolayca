import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/constants.dart';
import 'package:kolayca/features/customer_services/presentation/views/customer_services_view.dart';
import 'package:kolayca/features/home/presentation/view/home_view.dart';
import 'package:kolayca/features/hwo_us/presentation/view/hwo_us_view.dart';
import 'package:kolayca/features/jobs/presentation/views/jobs_view.dart';
import 'package:kolayca/features/profile/presentation/view/profile_view.dart';
import 'package:kolayca/features/profile/presentation/view_models/get_profile_cubit/get_profile_cubit.dart';
import 'package:kolayca/features/subscription_%20package/presentation/view/subscription_package_view.dart';

import '../../features/live_translator/presentation/view/live_translator_view.dart';
import '../../features/translator_profile/presentation/views/translator_profile_view.dart';
import '../utils/functions/authorization_dialog.dart';

class HomeNavBarWidget extends StatefulWidget {
  const HomeNavBarWidget({super.key});

  @override
  State<HomeNavBarWidget> createState() => _HomeNavBarWidgetState();
}

class _HomeNavBarWidgetState extends State<HomeNavBarWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      if (index != 4) {
        _selectedIndex = index;
      } else {
        showAuthorizationDialog(context, () {
          _selectedIndex = index;
        });
      }
    });
  }

  Widget _buildNavItem(
      String image, String activeImage, String label, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onItemTapped(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              _selectedIndex == index ? activeImage : image,
              height: MediaQuery.of(context).size.height * .035,
              width: MediaQuery.of(context).size.height * .035,
            ),
            SizedBox(
              height: AppConstants.height5(context),
            ),
            Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: MediaQuery.of(context).size.height * .012,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  static List<Widget> _pages(BuildContext context) {
    final user = context.read<GetProfileCubit>().getUserProfile();
    return <Widget>[
      const HomeView(),
      const HwoUsView(),
      const CustomerServicesView(),
      const JobsView(),
      if (user?.role == null || user?.role == 'user')
        const ProfileView()
      else
        const TranslatorProfileView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEBEBEB),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0), // here the desired height
        child: AppBar(
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor:
                _selectedIndex == 0 ? Colors.white : const Color(0xffEBEBEB),
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: AppColor.deebPlue,
            statusBarBrightness: Brightness.light,
          ),
        ),
      ),
      body: Center(
        child: _pages(context).elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * .08,
        color: AppColor.deebPlue,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildNavItem(Assets.home, Assets.activeHome, 'home'.tr(), 0),
            const CustomDividerContainer(),
            _buildNavItem(Assets.info, Assets.activeInfo, 'whoUs'.tr(), 1),
            const CustomDividerContainer(),
            _buildNavItem(Assets.chat, Assets.activeChat, 'contactUs'.tr(), 2),
            const CustomDividerContainer(),
            _buildNavItem(Assets.jobs, Assets.activeJobs, 'jobs'.tr(), 3),
            const CustomDividerContainer(),
            _buildNavItem(Assets.user, Assets.activeUser, 'profile'.tr(), 4),
          ],
        ),
      ),
    );
  }
}

class CustomDividerContainer extends StatelessWidget {
  const CustomDividerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .006,
            height: MediaQuery.of(context).size.height * .05,
            decoration: const BoxDecoration(
              color: Color(0xffC8C8C8),
            ),
          ),
        ],
      ),
    );
  }
}
