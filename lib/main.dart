import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'global/styles.dart';
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
      title: 'A life of Natie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,

        cardTheme: CardTheme(
          color: Theme.of(context).colorScheme.surface,
          elevation: 8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
          backgroundColor: Theme.of(context).colorScheme.surface,
          foregroundColor: Theme.of(context).colorScheme.onSurface,
          centerTitle: true,
        ),
        drawerTheme: Theme.of(context).drawerTheme.copyWith(
          backgroundColor: Colors.transparent,
          width: 400,
        ),
      ),
      home: const HomePage(),
    );
  }
}