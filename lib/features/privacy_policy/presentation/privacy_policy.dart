import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../core/utils/colors/app_color.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  late WebViewController controller;
  int progress = 0;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              this.progress = progress;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse('https://alooturkiye.com/privacy-policy/'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            // backgroundColor: AppColor.ofWhight,
            body: SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          // SizedBox(height: 20.h),
          // CustemHeaderWidget(
          //   text: 'privacyAndPolicy'.tr(),
          //   withBack: true,
          // ),
          // 40.verticalSpace,
          LinearProgressIndicator(
            value: progress / 100,
            color: AppColor.deebPlue,
          ),
          Expanded(child: WebViewWidget(controller: controller))
        ],
      ),
    )));
  }
}
