import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'palettes.dart';


final bool deviceTablet = SizerUtil.deviceType == DeviceType.tablet;

abstract class AppStyles {
  static const openSansRegularFontFamily = "OpenSans";
  // static const openSansRegularFontFamily = "OpenSans";
  // static const openSansRegularFontFamily = "OpenSans";
  static final homeTitleTextStyle = TextStyle(
      color: AppPalette.homeHeadlineColor,
      fontFamily: openSansRegularFontFamily,
      height: 1.7,
      letterSpacing: 1.5,
      fontWeight: FontWeight.bold,
      fontSize: 18.sp);
  static final homeButtonTextStyle = TextStyle(
      color: AppPalette.whiteColor,
      fontFamily: openSansRegularFontFamily,
      letterSpacing: 1.5,
      fontWeight: FontWeight.bold,
      fontSize: 18.sp);

  static final difficultyButtonStyle = TextStyle(
      color: AppPalette.whiteColor,
      fontFamily: openSansRegularFontFamily,
      letterSpacing: 1.5,
      fontWeight: FontWeight.bold,
      fontSize: 15.sp);

  static final counterNextButtonStyle = TextStyle(
      color: AppPalette.homeHeadlineColor,
      fontFamily: openSansRegularFontFamily,
      fontSize: 17.sp,
      fontWeight: FontWeight.w600);

  static final counterTitleTextStyle = TextStyle(
    fontSize: 19.sp,
    height: 1.6,
    fontFamily: openSansRegularFontFamily,
    fontWeight: FontWeight.bold,
    color: AppPalette.homeHeadlineColor,
  );

  static final counterDescTextStyle = TextStyle(
    height: 2.5,
    fontFamily: openSansRegularFontFamily,
    fontSize: 13.sp,
    fontWeight: FontWeight.bold,
    color: AppPalette.greyColor,
  );

  static final difficultyDescStyle = TextStyle(
    height: 1.6,
    fontFamily: openSansRegularFontFamily,
    fontSize: 13.sp,
    fontWeight: FontWeight.bold,
    color: AppPalette.greyColor,
  );

  static final topicContainerShadow = BoxShadow(
    color: AppPalette.greyColor.withOpacity(0.3),
    spreadRadius: 2,
    blurRadius: 7,
    offset: const Offset(0, 3),
  );

  static final quizProgressBarIndexStyle = TextStyle(
      fontSize: 14.sp,
      fontFamily: openSansRegularFontFamily,
      fontWeight: FontWeight.bold,
      color: AppPalette.homeButtonColor);

  static final quizProgressBarLengthStyle = TextStyle(
      fontFamily: openSansRegularFontFamily,
      fontSize: 11.sp,
      fontWeight: FontWeight.w500,
      color: AppPalette.headlineFourthColor);

  static final quizQuestionTextStyle = TextStyle(
      fontSize: 17.sp,
      fontWeight: FontWeight.w500,
      height: 1.5,
      fontFamily: openSansRegularFontFamily,
      color: AppPalette.headlineFourthColor);

  static final scoreTitleTextStyle = TextStyle(
      color: AppPalette.headlineFourthColor,
      height: 1.9,
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      fontFamily: openSansRegularFontFamily);

  static final scorePercentageTitleStyle = TextStyle(
      fontSize: 13.sp,
      fontFamily: openSansRegularFontFamily,
      fontWeight: FontWeight.bold,
      color: AppPalette.greyColor);

  static final scorePercentageDescTextStyle = TextStyle(
      height: 1.8,
      fontFamily: openSansRegularFontFamily,
      fontSize: 28.sp,
      fontWeight: FontWeight.bold,
      color: AppPalette.headlineFourthColor);

  static final scoreWrongAnswersTitleStyle = TextStyle(
      fontFamily: openSansRegularFontFamily,
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      color: AppPalette.headlineFourthColor);

  static final scoreCorrectAnswerCategoryStyle = TextStyle(
      fontSize: 13.sp,
      fontFamily: openSansRegularFontFamily,
      fontWeight: FontWeight.bold,
      color: AppPalette.greyColor);

  static final scoreCorrectAnswerDessStyle = TextStyle(
      fontSize: 13.sp,
      fontFamily: openSansRegularFontFamily,
      fontWeight: FontWeight.bold,
      color: AppPalette.headlineFourthColor);

  static final mainPaddingStyle = EdgeInsets.symmetric(horizontal: 6.w);
  static final secondaryPaddingStyle =
  EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h);
  static final scoreListviewPaddingStyle = EdgeInsets.only(left: 6.w);
  static final mainBoxDecorationStyle = BoxDecoration(boxShadow: [
    BoxShadow(
      color: AppPalette.headlineThirdColor.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 7,
      offset: const Offset(0, 3),
    ),
  ], color: AppPalette.headlineThirdColor, shape: BoxShape.circle);

  static final scoreAnswersBoxDecorationStyle = BoxDecoration(boxShadow: [
    BoxShadow(
      color: AppPalette.greyColor.withOpacity(0.2),
      spreadRadius: 2,
      blurRadius: 7,
      offset: const Offset(0, 3),
    ),
  ], borderRadius: BorderRadius.circular(15), color: AppPalette.whiteColor);

  static final scoreWrongAnswerDecorationStyle = BoxDecoration(boxShadow: [
    BoxShadow(
      color: AppPalette.errorColor.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 7,
      offset: const Offset(0, 3),
    ),
  ], color: AppPalette.errorColor, shape: BoxShape.circle);

  static final homeCategoryBoxdecorationStyle = BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: AppPalette.homeCategoryBackColor.withOpacity(0.4),
          spreadRadius: 2,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
      color: AppPalette.homeCategoryBackColor,
      borderRadius: BorderRadius.circular(25));

  static final homeRandomTestDecorationStyle = BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: AppPalette.homeRandomTestBackColor.withOpacity(0.4),
          spreadRadius: 2,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
      color: AppPalette.homeRandomTestBackColor,
      borderRadius: BorderRadius.circular(25));

  static final homeTakeTestDecorationStyle = BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: AppPalette.homeTakeTestBackColor.withOpacity(0.4),
          spreadRadius: 2,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
      color: AppPalette.homeTakeTestBackColor,
      borderRadius: BorderRadius.circular(25));

  static final homePercentageTextStyle = TextStyle(
      color: AppPalette.headlineFourthColor,
      fontFamily: openSansRegularFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 10.sp);

  static final homePercentageContainerTitleStyle = TextStyle(
    color: AppPalette.homeHeadlineColor,
    fontFamily: openSansRegularFontFamily,
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
  );

  static final homePercentageContainerDescStyle = TextStyle(
    height: 1.8,
    fontFamily: openSansRegularFontFamily,
    fontSize: 11.sp,
    fontWeight: FontWeight.bold,
    color: AppPalette.greyColor,
  );

  static final homeBubblesTextStyle = TextStyle(
    color: AppPalette.homeHeadlineColor,
    fontFamily: openSansRegularFontFamily,
    fontSize: 13.sp,
    fontWeight: FontWeight.bold,
  );

  static final lastActivityHomeTopicTextStyle = TextStyle(
    color: AppPalette.headlineFourthColor,
    fontFamily: openSansRegularFontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );

  static final lastActivityHomeScoreTextStyle = TextStyle(
    color: AppPalette.greenColor,
    fontFamily: openSansRegularFontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );
}