import 'package:eden_learning_app/app/data/constants/constants.dart';
import 'package:eden_learning_app/app/models/course.dart';
import 'package:eden_learning_app/app/modules/home/components/course_card.dart';
import 'package:eden_learning_app/app/modules/home/components/custom_menu_card.dart';
import 'package:eden_learning_app/app/modules/message/message_view.dart';
import 'package:eden_learning_app/app/modules/profile/components/profile_image_card.dart';
import 'package:eden_learning_app/app/modules/widgets/widgets.dart';
import 'package:eden_learning_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode(context) ? Colors.black : AppColors.kPrimary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          CustomIconButton(
            onTap: () {
              Get.toNamed<dynamic>(AppRoutes.getSettingPageRoute());
            },
            icon: AppAssets.kMoreVert,
            iconColor: AppColors.kWhite,
            color: AppColors.kWhite.withOpacity(0.15),
          ),
          SizedBox(width: AppSpacing.twentyHorizontal),
        ],
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: isDarkMode(context)
                      ? AppColors.kSecondary
                      : AppColors.kWhite,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(AppSpacing.radiusThirty),
                  ),
                ),
                margin: EdgeInsets.only(top: 40.h),
                child: Column(
                  children: [
                    SizedBox(height: 65.h),
                    Text(
                      'Navneet sheoran',
                      style: AppTypography.kBold32,
                    ),
                    Text(
                      'flutter dev',
                      style: AppTypography.kLight14,
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomMenuCard(
                          isSelected: false,
                          icon: AppAssets.kFollow,
                          onTap: () {},
                          title: 'Follow',
                        ),
                        CustomMenuCard(
                          isSelected: false,
                          icon: AppAssets.kMessage,
                          onTap: () {
                            Get.to<dynamic>(() => const MessageView());
                          },
                          title: 'Message',
                        ),
                        CustomMenuCard(
                          isSelected: false,
                          icon: AppAssets.kLinks,
                          onTap: () {},
                          title: 'Links',
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.thirtyVertical),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      decoration: BoxDecoration(
                        color: isDarkMode(context)
                      ? AppColors.kPrimary.withOpacity(0.08)
                      : AppColors.kPrimary.withOpacity(0.15),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(AppSpacing.radiusThirty),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: AppSpacing.thirtyVertical),
                          Text(
                            'About',
                            style: AppTypography.kBold18,
                          ),
                          Text(
                            'I’m a web design enthusiast. I love\nteaching and creating experiences that\nadd value to people’s lives. ',
                            style: AppTypography.kLight14,
                          ),
                          SizedBox(height: AppSpacing.fortyVertical),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Featured Courses',
                                style: AppTypography.kBold18,
                              ),
                              CustomTextButton(
                                  onPressed: () {}, text: 'See All'),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          SizedBox(
                            height: 280.h,
                            child: ListView.separated(
                              clipBehavior: Clip.none,
                              separatorBuilder: (context, index) => SizedBox(
                                width: 30.w,
                              ),
                              scrollDirection: Axis.horizontal,
                              itemCount: coursesList.length,
                              itemBuilder: (context, index) {
                                return CourseCard(
                                  course: coursesList[index],
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 90.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const ProfileImageCard(),
            ],
          ),
        ),
      ),
    );
  }
}
