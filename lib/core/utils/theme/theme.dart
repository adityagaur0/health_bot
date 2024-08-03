import 'package:flutter/material.dart';
import 'package:health_bot/core/utils/constant/colour.dart';
import 'package:health_bot/core/utils/theme/widget_themes/bottom_sheet_theme.dart';
import 'package:health_bot/core/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:health_bot/core/utils/theme/widget_themes/chip_theme.dart';
import 'package:health_bot/core/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:health_bot/core/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:health_bot/core/utils/theme/widget_themes/text_theme.dart';

import 'widget_themes/appbar_theme.dart';
import 'widget_themes/text_field_theme.dart';

class TAppTheme {
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: TColors.primary,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    //-----new
    fontFamily: 'Poppins',
    disabledColor: TColors.grey,
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: TColors.white,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: TColors.primary,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    //----- new
    fontFamily: 'Poppins',
    disabledColor: TColors.grey,
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    scaffoldBackgroundColor: TColors.black,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
  );
}
