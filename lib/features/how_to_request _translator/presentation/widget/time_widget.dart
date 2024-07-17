import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/core/utils/colors/app_color.dart';
import 'package:kolayca/core/utils/text_styles/app_text_style.dart';
import 'package:kolayca/features/how_to_request%20_translator/presentation/widget/table_cle.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 340,
      color: AppColor.deebPlue,
      child: Column(
        children: [
          Container(
            height: 45,
            width: 375,
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.deebPlue,
                  width: 3,
                ),
                color: AppColor.plueLight),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    ' الوقت',
                    style: AppTextStyle.aljazeera400Style21,
                  ),
                  const SizedBox(width: 15),
                  SvgPicture.asset(
                    Assets.imagesWhatTime,
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    Assets.imagesDate,
                  ),
                  const SizedBox(width: 7),
                  const Text(
                    ' التاريخ',
                    style: AppTextStyle.aljazeera400Style21,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 15),
                Image.asset(Assets.imagesTime),
                Container(
                  height: 100,
                  width: 1,
                  color: Colors.grey,
                ),
                Center(
                  child: Container(
                    width: 135, // Specified width
                    height: 122, // Specified height
                    padding:const EdgeInsets.all(4.0), // Smaller padding
                    decoration: BoxDecoration(
                      color: AppColor.deebPlue,
                      borderRadius:
                          BorderRadius.circular(8.0), // Smaller border radius
                    ),
                    child:const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'ديسمبر',
                          style: TextStyle(
                            fontSize: 12, // Smaller font size
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 2.0), // Smaller vertical spacing
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 12, // Smaller icon size
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 12, // Smaller icon size
                            ),
                          ],
                        ),
                        SizedBox(height: 2.0), // Smaller vertical spacing
                        Expanded(child: TableCalendar()),
                      ],
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

class CustemText extends StatelessWidget {
  const CustemText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyle.aljazeera400Style21,
    );
  }
}


  Widget calendarDay(String day) {
    return Container(
      alignment: Alignment.center,
      padding:const EdgeInsets.all(2.0), // Smaller padding
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        shape: day == '12' ? BoxShape.circle : BoxShape.rectangle,
        color: day == '12' ? Colors.blueAccent : Colors.transparent,
      ),
      child: Text(
        day,
        style:const TextStyle(
          color: Colors.white,
          fontSize: 8, // Smaller font size
        ),
      ),
    );
  }

