import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets/app_assets.dart';
import '../../../../../core/utils/constants.dart';

class TechnicalSupportItem extends StatelessWidget {
  const TechnicalSupportItem({super.key, required this.title, required this.icon,this.onTap});
final String title;
final String icon;
final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(AppConstants.sp20(context)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
          color: const Color(0x1ac20102),
        ),
        child:  Row(children: [
          SvgPicture.asset(icon,color: Colors.black,width: MediaQuery.of(context).size.height*.025,height: MediaQuery.of(context).size.height*.025,),
          SizedBox(width: AppConstants.width10(context),),
          Expanded(child: Text(title,  style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: MediaQuery.of(context).size.height * .016,
              color: Colors.black),)),
          SizedBox(width: AppConstants.width10(context),),
          SvgPicture.asset(Assets.arrowGo),
        ],),
      ),
    );
  }
}
