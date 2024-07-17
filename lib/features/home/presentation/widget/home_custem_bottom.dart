import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/constants.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/text_styles/app_text_style.dart';

class HomeCustemBottom extends StatelessWidget {
  const HomeCustemBottom({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: CachedNetworkImage(
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[400]!,
                highlightColor: Colors.grey[200]!,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.grey,),
                ),
              ),
              errorWidget: (context, url, error) =>
              const Icon(Icons.error),
              imageUrl:
              "https://www.lovepanky.com/wp-content/uploads/2020/11/what-makes-a-man-a-man-1.jpg",
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.deebPlue
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppConstants.height5(context)),
                  child: Text("تحدث مع الاتراك",style: AppTextStyle.aljazeera400Style21.copyWith(
                    fontSize: MediaQuery.of(context).size.height*.018,
                    fontWeight: FontWeight.w600
                  ),),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
