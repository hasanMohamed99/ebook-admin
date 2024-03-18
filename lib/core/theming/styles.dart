import 'package:flutter/material.dart';
import '../helpers/constants.dart';
import 'colors.dart';

abstract class TextStyles {
  static TextStyle font22Black700Weight = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.textBlack,
    fontFamily: AppConstants.kMainFont,
  );

  static TextStyle font16Black700Weight = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textBlack,
    fontFamily: AppConstants.kMainFont,
  );

  static TextStyle font18Black700Weight = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.textBlack,
    fontFamily: AppConstants.kMainFont,
  );

  static TextStyle font16Black400Weight = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textBlack,
    fontFamily: AppConstants.kMainFont,
  );

  static TextStyle font16Gray400Weight = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.gray,
    fontFamily: AppConstants.kMainFont,
  );

  static TextStyle font16Yellow400Weight = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.mainYellow,
    fontFamily: AppConstants.kMainFont,
  );

  static TextStyle font14White400Weight = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: AppConstants.kMainFont,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle font16White500Weight = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontFamily: AppConstants.kMainFont,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle font20White700Weight = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    fontFamily: AppConstants.kMainFont,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle font20Black700Weight = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontFamily: AppConstants.kMainFont,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle font14Black500Weight = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textBlack,
    fontFamily: AppConstants.kMainFont,
  );

  static TextStyle font14Red500Weight = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.red,
    fontFamily: AppConstants.kMainFont,
  );

  static TextStyle font14Gray400Weight = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.gray,
    fontFamily: AppConstants.kMainFont,
  );

  static TextStyle font14Yellow400Weight = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.mainYellow,
    fontFamily: AppConstants.kMainFont,
  );

  static TextStyle font14Black400Weight = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textBlack,
    fontFamily: AppConstants.kMainFont,
  );

  static TextStyle font14LighterBlack400Weight = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.lighterBlack,
    fontFamily: AppConstants.kMainFont,
  );

  static TextStyle font14Yellow400WeightElevated = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.mainYellow,
    fontFamily: AppConstants.kMainFont,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(0.0, 0.0),
        blurRadius: 60.0,
        color: AppColors.mainYellow,
      ),
    ],
  );

  static TextStyle font16Yellow400WeightElevated = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.mainYellow,
    fontFamily: AppConstants.kMainFont,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(0.0, 0.0),
        blurRadius: 60.0,
        color: AppColors.mainYellow,
      ),
    ],
  );

  static TextStyle font20Yellow700WeightElevated = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.mainYellow,
    fontFamily: AppConstants.kMainFont,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(0.0, 0.0),
        blurRadius: 60.0,
        color: AppColors.mainYellow,
      ),
    ],
  );
}