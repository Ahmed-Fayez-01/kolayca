import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/constants.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key, required this.icon});
final String icon;
  @override
  Widget build(BuildContext context) {
    return   Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon,width: MediaQuery.of(context).size.width*.3,color: const Color(0xffDCDCDC),),
          SizedBox(height: AppConstants.height10(context)),
          Text("no_item".tr(),style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.height*.02,
              color: const Color(0xffA5A5A5)
          )),
        ],
      ),
    );
  }
}
