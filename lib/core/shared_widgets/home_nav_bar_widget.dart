import 'package:flutter/material.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
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

  Widget _buildNavItem(String image, String label, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(image,
              height: 63,
              width: 75,
              color: _selectedIndex == index ? Colors.white : Colors.white70),
        ],
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
        height: 85,
        color: Colors.lightBlue,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              _buildNavItem(Assets.imagesHome2, 'القائمة الرئيسية', 0),
              const CustemDividerContainer(),
              _buildNavItem(Assets.imagesHwous1, 'من نحن', 1),
              const CustemDividerContainer(),
              _buildNavItem(Assets.imagesConnextwithus, 'تواصل معنا', 2),
              const CustemDividerContainer(),
              _buildNavItem(Assets.imagesHwotous, 'كيفية الاستخدام', 3),
              const CustemDividerContainer(),
              _buildNavItem(Assets.imagesLogoin, 'تسجيل الدخول', 4),
            ],
          ),
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Container(
        alignment: Alignment.center,
        child: Container(
          width: 3,
          height: 35,
          decoration: BoxDecoration(
            
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
