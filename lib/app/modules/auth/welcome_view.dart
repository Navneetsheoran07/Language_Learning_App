import 'package:animate_do/animate_do.dart';
import 'package:eden_learning_app/app/data/constants/constants.dart';
import 'package:eden_learning_app/app/modules/auth/components/custom_social_button.dart';
import 'package:eden_learning_app/app/modules/auth/components/divider_with_text.dart';
import 'package:eden_learning_app/app/modules/widgets/widgets.dart';
import 'package:eden_learning_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const WaveCard(),
          const Spacer(),
          FadeInUp(
            duration: const Duration(milliseconds: 500),
            child: Text(
              'Join a community of teachers & students',
              style: AppTypography.kBold32,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20.h),
          FadeInUp(
            duration: const Duration(milliseconds: 600),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
              child: CustomSocialButton(
                onTap: () {},
                icon: AppAssets.kFaceBook,
                text: 'Join using Facebook',
              ),
            ),
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          FadeInUp(
            duration: const Duration(milliseconds: 700),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
              child: CustomSocialButton(
                onTap: () {},
                icon: AppAssets.kGoogle,
                text: 'Join using Google',
              ),
            ),
          ),
          SizedBox(height: AppSpacing.thirtyVertical),
          FadeInUp(
            duration: const Duration(milliseconds: 801),
            child: const DividerWithText(),
          ),
          SizedBox(height: AppSpacing.thirtyVertical),
          FadeInUp(
            duration: const Duration(milliseconds: 900),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
              child: CustomSocialButton(
                onTap: () {
                  Get.toNamed<dynamic>(AppRoutes.getSignUpRoute());
                },
                icon: AppAssets.kMail,
                text: 'Join using Email',
              ),
            ),
          ),
          SizedBox(height: AppSpacing.tenVertical),
          FadeInUp(
            duration: const Duration(milliseconds: 1000),
            child: CustomTextButton(
              onPressed: () {
                Get.toNamed<dynamic>(AppRoutes.getSignInRoute());
              },
              text: 'Sign In instead',
            ),
          ),
          SizedBox(height: AppSpacing.twentyVertical),
        ],
      ),
    );
  }
}
