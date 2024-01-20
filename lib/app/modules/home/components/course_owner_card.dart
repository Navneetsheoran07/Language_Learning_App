import 'package:eden_learning_app/app/data/constants/constants.dart';
import 'package:eden_learning_app/app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseOwnerCard extends StatelessWidget {
  final UserModel user;
  const CourseOwnerCard({required this.user,super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(
              image: AssetImage(AppAssets.kUser5),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: AppSpacing.tenHorizontal),
        Column(
          children: [
            Text(
              user.name,
              style: AppTypography.kBold16,
            ),
            Text(
              user.bio,
              style: AppTypography.kLight14,
            ),
          ],
        ),
      ],
    );
  }
}
