import 'package:flutter/material.dart';

class Vars {
  static BuildContext? _context;

  static void init(BuildContext context) => _context = context;
}