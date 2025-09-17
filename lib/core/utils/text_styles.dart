import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_task/core/utils/colors_manger.dart';

class TextStyles {
  // News Item Specific Styles
  static TextStyle font18BlackBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
    height: 1.3,
  );

  static TextStyle font20BlackBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
    height: 1.3,
  );

  static TextStyle font14GreyNormal = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: Colors.grey[700],
    height: 1.4,
  );

  static TextStyle font11BlueW600 = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.w600,
    color: Colors.blue[700],
  );

  static TextStyle font12GreyW500 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: Colors.grey[600],
  );

  static TextStyle font12GreyNormal = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: Colors.grey[600],
  );

  static TextStyle font12BlueBold = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    color: Colors.blue[700],
  );

  // Legacy styles (keeping for backward compatibility)
  static TextStyle font20GreyBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: ColorsManager.grey,
  );

  static TextStyle font20GreyNormal = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.normal,
    color: ColorsManager.grey,
  );

  static TextStyle font14GreyNormal_Legacy = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: ColorsManager.grey,
  );

  static TextStyle font16WhiteBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle font14GreyBold = TextStyle(
    fontSize: 14.sp,
    color: Colors.grey,
    fontWeight: FontWeight.bold,
  );

  static TextStyle font14WhiteNormal = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  // Deprecated aliases (for backward compatibility - will be removed in future versions)
  @Deprecated('Use font18BlackBold instead')
  static TextStyle get newsTitle => font18BlackBold;

  @Deprecated('Use font20BlackBold instead')
  static TextStyle get newsTitleLarge => font20BlackBold;

  @Deprecated('Use font14GreyNormal instead')
  static TextStyle get newsDescription => font14GreyNormal;

  @Deprecated('Use font11BlueW600 instead')
  static TextStyle get newsSource => font11BlueW600;

  @Deprecated('Use font12GreyW500 instead')
  static TextStyle get newsDate => font12GreyW500;

  @Deprecated('Use font12GreyNormal instead')
  static TextStyle get newsCaption => font12GreyNormal;
}
