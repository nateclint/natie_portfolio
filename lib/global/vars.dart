import 'package:flutter/material.dart';

class Vars {
  static BuildContext? _context;

  static void init(BuildContext context) => _context = context;

  static const animationFast = Duration(milliseconds: 300);
  static const animationSlow = Duration(milliseconds: 600);
}