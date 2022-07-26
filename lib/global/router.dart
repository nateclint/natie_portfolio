import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:natie_portfolio/data/model/project.dart';
import 'package:natie_portfolio/widget/common/helper/snackbar.dart';
import 'package:natie_portfolio/widget/page/home_page.dart';
import 'package:natie_portfolio/widget/page/project_page.dart';

import 'strings.dart';
import 'styles.dart';
import 'vars.dart';

class Routes {
  static const home = '/';
  static const about = '/about';
  static const project = '/project';
}

class Router {
  static BuildContext? _context;

  static void init(BuildContext context) {
    _context = context;
  }

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    try {
      switch (settings.name) {
        case Routes.home:
          return MaterialPageRoute(
              builder: (_) => Builder(builder: (context) {
                    Strings.init(context);
                    Styles.init(context);
                    Vars.init(context);
                    return const HomePage();
                    // return ProjectPage(project: Projects.nieNote);
                  }));
        case Routes.project:
          if (settings.arguments is! Project) {
            throw 'Type ${settings.arguments.runtimeType} is not Project';
          }
          return MaterialPageRoute(
              builder: (_) => Builder(builder: (context) {
                    return ProjectPage(project: settings.arguments as Project);
                  }));
        default:
          Snackbars.showSnackbar(
              _context!,
              SnackbarType.negative,
              AppLocalizations.of(_context!)!
                  .route_unknown(settings.name ?? ''));
          return null;
      }
    } catch (e) {
      if (kDebugMode) debugPrint('Error navigating to ${settings.name}: $e');
      return null;
    }
  }
}