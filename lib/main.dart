import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'global/strings.dart';
import 'global/styles.dart';
import 'global/themes.dart';
import 'global/vars.dart';
import 'store/language_store.dart';
import 'store/theme_store.dart';
import 'widget/page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      Provider<ThemeStore>(create: (_) => ThemeStore()),
      Provider<LanguageStore>(create: (_) => LanguageStore()),
    ],
    child: const NatiePortfolio(),
  ));
}

class NatiePortfolio extends StatelessWidget {
  const NatiePortfolio({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return MaterialApp(
          title: Strings.title,
          debugShowCheckedModeBanner: false,
          // Theme
          themeMode: context.read<ThemeStore>().activeTheme,
          theme: Themes.light,
          darkTheme: Themes.dark,
          // Locale
          locale: Strings.locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          // Pages
          home: Builder(builder: (context) {
            Strings.init(context);
            Styles.init(context);
            Vars.init(context);
            return const HomePage();
          }),
        );
      },
    );
  }
}