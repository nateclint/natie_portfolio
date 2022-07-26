import 'package:flutter/material.dart';

import 'dimens.dart';

class Styles {
  static BuildContext? _context;

  static void init(BuildContext context) => _context = context;

  /// Common styles
  static TextStyle get headerStyle => TextStyle(
        color: Theme.of(_context!).primaryColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get subHeaderStyle => TextStyle(
        color: Theme.of(_context!).primaryColor,
        fontSize: 14,
      );
  static const TextStyle footerStyle = TextStyle(
    color: Colors.black54,
  );
  static const TextStyle spacedTextStyle = TextStyle(
    letterSpacing: 0.5,
  );

  // Widget styles
  static const TextStyle iconBtnErrorStyle =
      TextStyle(fontFamily: 'monospace');
}

class Themes {
  static ThemeData get light => _generateTheme(from: ThemeData.light());

  static ThemeData get dark => _generateTheme(from: ThemeData.dark());

  static ThemeData _generateTheme({required ThemeData from}) {
    final initialTheme = ThemeData(primarySwatch: Colors.amber);
    return initialTheme.copyWith(
      // Global style
      backgroundColor: from.backgroundColor,
      brightness: from.brightness,
      colorScheme: initialTheme.colorScheme.copyWith(
        surface: from.colorScheme.surface,
        onSurface: from.colorScheme.onSurface,
        surfaceVariant: from.colorScheme.surfaceVariant,
        onSurfaceVariant: from.colorScheme.onSurfaceVariant,
        inverseSurface: from.colorScheme.inverseSurface,
        onInverseSurface: from.colorScheme.onInverseSurface,
      ),
      dialogBackgroundColor: from.dialogBackgroundColor,
      dividerTheme: from.dividerTheme.copyWith(
        color: from.colorScheme.onSurface.withOpacity(.25),
      ),
      hintColor: from.colorScheme.onSurface.withOpacity(.25),
      scaffoldBackgroundColor: from.scaffoldBackgroundColor,
      textTheme: from.textTheme,

      // Widget style
      appBarTheme: from.appBarTheme.copyWith(
        backgroundColor: from.colorScheme.surface,
        foregroundColor: from.colorScheme.onSurface,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: from.colorScheme.onSurface.withOpacity(.75),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBarTheme: from.bottomNavigationBarTheme.copyWith(
        backgroundColor: from.colorScheme.surface,
        selectedIconTheme: IconThemeData(
          color: initialTheme.primaryColor,
          size: from.iconTheme.size ?? 24 * 1.25,
        ),
        selectedItemColor: initialTheme.primaryColor,
        unselectedIconTheme: IconThemeData(
          color: from.colorScheme.onSurface.withOpacity(.5),
        ),
        unselectedItemColor: from.colorScheme.onSurface.withOpacity(.5),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: from.colorScheme.surface,
      ),
      cardTheme: CardTheme(
        color: from.colorScheme.surface,
        elevation: Dimens.cardElevation,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Dimens.cardRadius)),
        ),
      ),
      chipTheme: ChipThemeData(
        shape: StadiumBorder(
            side: BorderSide(color: initialTheme.primaryColor)),
        backgroundColor: initialTheme.primaryColor.withOpacity(.25),
        selectedColor: initialTheme.primaryColor.withOpacity(.75),
      ),
      drawerTheme: from.drawerTheme.copyWith(
        backgroundColor: Colors.transparent,
        width: Dimens.drawerWidth,
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: from.colorScheme.surface,
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Dimens.cardRadius)),
        ),
      ),
    );
  }
}