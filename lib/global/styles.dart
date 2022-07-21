import 'package:flutter/material.dart';

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

  // Widget styles
  static const TextStyle iconBtnPlaceholderStyle =
      TextStyle(fontFamily: 'monospace');
}