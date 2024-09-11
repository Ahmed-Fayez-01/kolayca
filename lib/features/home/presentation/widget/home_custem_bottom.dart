import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/constants.dart';
import 'package:kolayca/features/home/data/models/home_data_model.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/text_styles/app_text_style.dart';

class HomeCustomBottom extends StatelessWidget {
  const HomeCustomBottom({
    super.key,
    this.onTap,
    required this.data,
  });
  final void Function()? onTap;
  final Data data;

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
                    color: Colors.grey,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageUrl: data.image!,
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: AppColor.deebPlue),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                        vertical: AppConstants.height5(context)),
                    child: Text(
                      data.title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.aljazeera400Style21.copyWith(
                          fontSize: MediaQuery.of(context).size.height * .018,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
