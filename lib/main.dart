import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'firebase_options.dart';
import 'global/styles.dart';
import 'global/themes.dart';
import 'global/vars.dart';
import 'page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const NatiePortfolio());
}

class NatiePortfolio extends StatelessWidget {
  const NatiePortfolio({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Styles.init(context);
    Vars.init(context);

    return MaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      themeMode: ThemeMode.system,
      theme: Themes.light,
      darkTheme: Themes.dark,
      home: const HomePage(),
    );
  }
}