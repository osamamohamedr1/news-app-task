import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_task/core/utils/colors_manger.dart';
import 'package:news_app_task/core/utils/text_styles.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Stay informed with the latest news',
          style: TextStyles.font12GreyNormal,
          textAlign: TextAlign.center,
        ),

        SizedBox(height: 8.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: ColorsManager.blue,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 8.w),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 8.w),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
