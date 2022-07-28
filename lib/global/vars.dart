import 'package:flutter/material.dart';

class Vars {
  static BuildContext? _context;

  static void init(BuildContext context) => _context = context;

  static const animationFast = Duration(milliseconds: 300);
  static const animationSlow = Duration(milliseconds: 600);
  static const animationSluggish = Duration(milliseconds: 1200);

  static const assets = {
  'android' : 'assets/tech/android.svg',
  'firebase' : 'assets/tech/firebase.svg',
  'fit': 'assets/brand/fit.png',
  'flutter' : 'assets/tech/flutter.svg',
  'hcmus': 'assets/brand/hcmus.svg',
  'java' : 'assets/tech/java.svg',
  'jitsi' : 'assets/tech/jitsi.svg',
  'markdown' : 'assets/tech/markdown.svg',
  'ml_kit' : 'assets/tech/ml_kit.png',
  'mongodb' : 'assets/tech/mongodb.svg',
  'moodle' : 'assets/tech/moodle.svg',
  'sqlite' : 'assets/tech/sqlite.svg',
};
}