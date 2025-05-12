import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => _themeData(Brightness.light);
  static ThemeData get dark => _themeData(Brightness.dark);

  static ThemeData _themeData(Brightness brightness) {
    final baseTheme = FlexThemeData.light(
      colors: const FlexSchemeColor(
        primary: Color(0xFF0B6463), // Updated teal #0B6463
        primaryContainer: Color(0xFF0B6463), // Updated teal #0B6463
        secondary: Color(0xFFFFFFFF), // White for text and accents
        secondaryContainer: Color(0xFFE0F2F1), // Light teal for containers
        tertiary: Color(0xFF0B6463), // Teal for accents
        tertiaryContainer: Color(0xFFB2DFDB), // Lighter teal for containers
      ),
      surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
      blendLevel: 7,
      subThemesData: const FlexSubThemesData(
        useM2StyleDividerInM3: true,
        blendOnLevel: 6,
        blendOnColors: false,
        useTextTheme: true,
        adaptiveRadius: FlexAdaptive.excludeWebAndroidFuchsia(),
        defaultRadiusAdaptive: 10.0,
        elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
        elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
        elevatedButtonRadius: 12,
        outlinedButtonOutlineSchemeColor: SchemeColor.primary,
        toggleButtonsBorderSchemeColor: SchemeColor.primary,
        segmentedButtonSchemeColor: SchemeColor.primary,
        inputDecoratorSchemeColor: SchemeColor.primary,
        inputDecoratorIsFilled: false,
        inputDecoratorBorderSchemeColor: SchemeColor.primary,
        inputDecoratorBorderWidth: 0.5,
        inputDecoratorRadius: 12,
        inputDecoratorPrefixIconSchemeColor: SchemeColor.onSurface,
        inputSelectionHandleSchemeColor: SchemeColor.primaryContainer,
        alignedDropdown: true,
        useInputDecoratorThemeInDialogs: true,
        navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
        navigationBarMutedUnselectedLabel: false,
        navigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
        navigationBarMutedUnselectedIcon: false,
        navigationBarIndicatorSchemeColor: SchemeColor.primary,
        navigationBarIndicatorOpacity: 1.00,
        navigationBarElevation: 0.0,
        navigationRailSelectedLabelSchemeColor: SchemeColor.primary,
        navigationRailMutedUnselectedLabel: false,
        navigationRailSelectedIconSchemeColor: SchemeColor.onPrimary,
        navigationRailMutedUnselectedIcon: false,
        navigationRailIndicatorSchemeColor: SchemeColor.primary,
        navigationRailIndicatorOpacity: 1.00,
        navigationRailBackgroundSchemeColor: SchemeColor.surface,
        cardRadius: 16.0,
        popupMenuRadius: 8.0,
        dialogRadius: 16.0,
        bottomSheetRadius: 16.0,
      ),
      keyColors: const FlexKeyColors(
        useSecondary: true,
        useTertiary: true,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      fontFamily: GoogleFonts.notoSans().fontFamily,
    );

    final lightTheme = baseTheme.copyWith(
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.black12, // More faded black
            width: 1.2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.black12, // More faded black
            width: 1.2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.black26, // Slightly less faded black
            width: 1.5,
          ),
        ),
        hintStyle:const TextStyle(
          color: Colors.black38,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        side: const BorderSide(
          color: Colors.black12, // More faded black
          width: 1.2,
        ),
      ),
    );

    return lightTheme;
  }
}

