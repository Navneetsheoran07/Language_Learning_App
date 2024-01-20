import 'package:eden_learning_app/app/data/constants/constants.dart';
import 'package:eden_learning_app/app/models/course.dart';
import 'package:eden_learning_app/app/modules/course_detail/course_detail_view.dart';
import 'package:eden_learning_app/app/modules/home/components/saved_icon.dart';
import 'package:eden_learning_app/app/modules/widgets/containers/primary_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  const CourseCard({required this.course, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to<Widget>(() => CourseDetailView(
              course: course,
            ));
      },
      child: PrimaryContainer(
        width: 264.w,
        height: 280.h,
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Hero(
                tag: course.image,
                child: Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.all(10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(AppSpacing.radiusFifteen),
                    ),
                    image: DecorationImage(
                      image: AssetImage(course.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SavedIcon(course: course),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.all(AppSpacing.tenVertical),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.category.name,
                      style: AppTypography.kBold14
                          .copyWith(color: AppColors.kPrimary),
                    ),
                    SizedBox(height: AppSpacing.tenVertical),
                    Text(
                      course.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.kBold20,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          '\$ ${course.price}',
                          style: AppTypography.kBold14,
                        ),
                        const Spacer(),
                        Text(
                          'By ${course.owner.name}',
                          style: AppTypography.kLight16,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
