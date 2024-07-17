import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/constants.dart';
import 'package:kolayca/features/home/presentation/view/home_view.dart';
import 'package:kolayca/features/how_to_request%20_translator/presentation/view/how_to_request_translator_view.dart';
import 'package:kolayca/features/hwo_us/presentation/view/hwo_us_view.dart';
import 'package:kolayca/features/nearest_translator/presentation/view/nearest_translator_view.dart';
import 'package:kolayca/features/subscription_%20package/presentation/view/subscription_package_view.dart';

class HomeNavBarWidget extends StatefulWidget {
  const HomeNavBarWidget({super.key});

  @override
  State<HomeNavBarWidget> createState() => _HomeNavBarWidgetState();
}

class _HomeNavBarWidgetState extends State<HomeNavBarWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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

  static final List<Widget> _pages = <Widget>[
    const HomeView(),
    const HwoUsView(),
    const SubscriptionPackageView(),
    const HowToRequestTranslatorView(),
    const NearestTranslatorView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * .08,
        color: AppColor.deebPlue,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildNavItem(
                Assets.home, Assets.activeHome, 'الرئيسية', 0),
            const CustemDividerContainer(),
            _buildNavItem(Assets.info, Assets.activeInfo, 'من نحن', 1),
            const CustemDividerContainer(),
            _buildNavItem(Assets.chat, Assets.activeChat, 'تواصل معنا', 2),
            const CustemDividerContainer(),
            _buildNavItem(Assets.usage, Assets.activeUsage, 'الاستخدام', 3),
            const CustemDividerContainer(),
            _buildNavItem(Assets.user, Assets.activeUser, 'البروفايل', 4),
          ],
        ),
      ),
    );
  }
}

class CustemDividerContainer extends StatelessWidget {
  const CustemDividerContainer({
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
            width: MediaQuery.of(context).size.width*.006,
            height: MediaQuery.of(context).size.height*.05,
            decoration: const BoxDecoration(
              color: Color(0xffC8C8C8),
            ),
          ),
        ],
      ),
    );
  }
}
