import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/utils/assets/app_assets.dart';
import 'package:kolayca/features/lessons/presentation/view_models/get_lessons_cubit/get_lessons_cubit.dart';

import '../../../../core/shared_widgets/custem_header_widget.dart';
import '../../../../core/utils/colors/app_color.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/services/remote_services/service_locator.dart';
import 'widgets/youtube_thumbnail.dart';

class LessonsView extends StatelessWidget {
  const LessonsView({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return BlocProvider(
      create: (context) =>
          GetLessonsCubit(lessonsRepo: getIt.get())..getLessons(),
      child: Scaffold(
          backgroundColor: const Color(0xffEBEBEB),
          body: AnnotatedRegion(
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              // systemNavigationBarColor: AppColor.deebPlue,
            ),
            child: Column(
              children: [
                Container(
                  height: 302.h,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Assets.imagesBackground),
                          fit: BoxFit.cover)),
                  padding: EdgeInsets.only(
                      top: AppConstants.height20(context) + topPadding),
                  child: CustemHeaderWidget(
                    text: 'دروس اللغة التركية المسجلة',
                    withBack: true,
                    textColor: AppColor.deebPlue,
                    backgroundColor: Colors.white.withOpacity(0.6),
                    fontSize: 30.sp,
                  ),
                ),
                SizedBox(height: 30.h),
                BlocConsumer<GetLessonsCubit, GetLessonsState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return state is GetLessonsLoading
                          ? const Center(child: CircularProgressIndicator())
                          : state is GetLessonsSuccess
                              ? Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 28.w,
                                    ),
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 30.h,
                                        mainAxisSpacing: 30.w,
                                        childAspectRatio: 1.5,
                                      ),
                                      itemBuilder: (context, index) {
                                        return YouTubeThumbnail(
                                          videoUrl:
                                              state.lessons[index].linkUrl ??
                                                  '',
                                        );
                                        // return Image.asset(Assets.imagesVideo);
                                      },
                                      itemCount: state.lessons.length,
                                    ),
                                  ),
                                )
                              : const SizedBox(
                                  child: Text('لا يوجد دروس'),
                                );
                    }),
              ],
            ),
          )),
    );
  }
}
