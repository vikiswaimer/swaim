// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) {
    return LightModeTheme();
  }

  late Color primaryColor;
  late Color secondaryColor;
  late Color tertiaryColor;
  late Color alternate;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color primaryText;
  late Color secondaryText;

  late Color white;
  late Color text2Gray;
  late Color grayDark;
  late Color darkBG;
  late Color background;
  late Color grayLines;
  late Color grayIcon;
  late Color gray200;
  late Color gray600;
  late Color black600;
  late Color tertiary400;
  late Color textColor;
  late Color primaryBtnText;
  late Color lineColor;
  late Color backgroundComponents;
  late Color customColor1;

  String get title1Family => typography.title1Family;
  TextStyle get title1 => typography.title1;
  String get title2Family => typography.title2Family;
  TextStyle get title2 => typography.title2;
  String get title3Family => typography.title3Family;
  TextStyle get title3 => typography.title3;
  String get subtitle1Family => typography.subtitle1Family;
  TextStyle get subtitle1 => typography.subtitle1;
  String get subtitle2Family => typography.subtitle2Family;
  TextStyle get subtitle2 => typography.subtitle2;
  String get bodyText1Family => typography.bodyText1Family;
  TextStyle get bodyText1 => typography.bodyText1;
  String get bodyText2Family => typography.bodyText2Family;
  TextStyle get bodyText2 => typography.bodyText2;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  late Color primaryColor = const Color(0xFF222235);
  late Color secondaryColor = const Color(0xFFEEEEEE);
  late Color tertiaryColor = const Color(0xFFD6D6D6);
  late Color alternate = const Color(0x80222235);
  late Color primaryBackground = const Color(0xFFFFFFFF);
  late Color secondaryBackground = const Color(0xFFEEEEEE);
  late Color primaryText = const Color(0xFF090F13);
  late Color secondaryText = const Color(0xFF95A1AC);

  late Color white = Color(0xFFD4A03B);
  late Color text2Gray = Color(0xFF8B97A2);
  late Color grayDark = Color(0xFF57636C);
  late Color darkBG = Color(0xFF111417);
  late Color background = Color(0xFFD4A03B);
  late Color grayLines = Color(0xFF222235);
  late Color grayIcon = Color(0xFF95A1AC);
  late Color gray200 = Color(0xFFDBE2E7);
  late Color gray600 = Color(0xFF262D34);
  late Color black600 = Color(0xFF090F13);
  late Color tertiary400 = Color(0xFF39D2C0);
  late Color textColor = Color(0xFF1E2429);
  late Color primaryBtnText = Color(0xFFFFFFFF);
  late Color lineColor = Color(0xFFE0E3E7);
  late Color backgroundComponents = Color(0xFF1D2428);
  late Color customColor1 = Color(0xFF2FB73C);
}

abstract class Typography {
  String get title1Family;
  TextStyle get title1;
  String get title2Family;
  TextStyle get title2;
  String get title3Family;
  TextStyle get title3;
  String get subtitle1Family;
  TextStyle get subtitle1;
  String get subtitle2Family;
  TextStyle get subtitle2;
  String get bodyText1Family;
  TextStyle get bodyText1;
  String get bodyText2Family;
  TextStyle get bodyText2;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'Overpass';
  TextStyle get title1 => GoogleFonts.getFont(
        'Overpass',
        color: theme.darkBG,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      );
  String get title2Family => 'Overpass';
  TextStyle get title2 => GoogleFonts.getFont(
        'Overpass',
        color: theme.darkBG,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      );
  String get title3Family => 'Overpass';
  TextStyle get title3 => GoogleFonts.getFont(
        'Overpass',
        color: theme.darkBG,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      );
  String get subtitle1Family => 'Overpass';
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Overpass',
        color: theme.primaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );
  String get subtitle2Family => 'Overpass';
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Overpass',
        color: theme.darkBG,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  String get bodyText1Family => 'Overpass';
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Overpass',
        color: theme.grayDark,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  String get bodyText2Family => 'Overpass';
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Overpass',
        color: theme.darkBG,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
