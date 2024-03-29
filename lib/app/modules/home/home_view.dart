import 'package:eden_learning_app/app/data/constants/constants.dart';
import 'package:eden_learning_app/app/modules/home/components/best_teachers.dart';
import 'package:eden_learning_app/app/modules/home/components/course_list.dart';
import 'package:eden_learning_app/app/modules/home/components/custom_menu_card.dart';
import 'package:eden_learning_app/app/modules/home/components/earning_card.dart';
import 'package:eden_learning_app/app/modules/home/components/refer_friend_sheet.dart';
import 'package:eden_learning_app/app/modules/home/components/search_field.dart';
import 'package:eden_learning_app/app/modules/schedule/course_schedule.dart';
import 'package:eden_learning_app/app/modules/search/search_view.dart';
import 'package:eden_learning_app/app/modules/statistics/statistics_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Text('Navneet sheoran', style: AppTypography.kBold32),
              Text(
                'What do you want to do today? ☀️',
                style: AppTypography.kLight16,
              ),
              SizedBox(height: AppSpacing.thirtyVertical),
              GestureDetector(
                onTap: () {
                  Get.to<void>(() => const SearchView());
                },
                child: SearchField(
                  controller: TextEditingController(),
                ),
              ),
              SizedBox(height: 26.h),
              EarningCard(
                title: 'Total Earnings',
                amount: r'$6,463',
                onSwipe: () {},
              ),
              SizedBox(height: 60.h),
              Text(
                'Latest on Navneet Design',
                style: AppTypography.kBold18,
              ),
              SizedBox(height: AppSpacing.twentyVertical),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomMenuCard(
                    isSelected: selectedIndex == 0,
                    onTap: () => handleCardTap(0),
                    icon: AppAssets.kPopular,
                    title: 'Popular',
                  ),
                  CustomMenuCard(
                    isSelected: selectedIndex == 1,
                    onTap: () => handleCardTap(1),
                    icon: AppAssets.kRecords,
                    title: 'Records',
                  ),
                  CustomMenuCard(
                    isSelected: selectedIndex == 2,
                    onTap: () => handleCardTap(2),
                    icon: AppAssets.kStatistics,
                    title: 'Statistics',
                  ),
                  CustomMenuCard(
                    isSelected: selectedIndex == 3,
                    onTap: () => handleCardTap(3),
                    icon: AppAssets.kStudents,
                    title: 'Students',
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.fiftyVertical),
              const CourseList(),
              SizedBox(height: 60..h),
              const BestTeachers(),
              SizedBox(height: AppSpacing.thirtyVertical),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.twentyHorizontal,
                ),
                child: Text(
                  'Refer a Friend',
                  style: AppTypography.kBold18,
                ),
              ),
              SizedBox(height: AppSpacing.twentyVertical),
              EarningCard(
                title: 'Total Referrals',
                amount: r'$92',
                onSwipe: () {
                  showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30.r),
                      ),
                    ),
                    builder: (context) {
                      return const ReferFriendSheet();
                    },
                  );
                },
              ),
              SizedBox(height: 18.h),
            ],
          ),
        ),
      ),
    );
  }

  int selectedIndex = 0;

  void handleCardTap(int index) {
    setState(() {
      if (selectedIndex == index) {
        selectedIndex = -1;
      } else {
        selectedIndex = index;
        if (selectedIndex == 1) {
          Future.delayed(const Duration(milliseconds: 500), () {
            Get.to<void>(() => const CourseSchedule());
          });
        }
        if (selectedIndex == 2) {
          Future.delayed(const Duration(milliseconds: 500), () {
            Get.to<void>(() => const StatisticsView());
          });
        }
      }
    });
  }
}
