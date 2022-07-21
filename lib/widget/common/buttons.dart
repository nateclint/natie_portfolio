import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:natie_portfolio/global/dimens.dart';
import 'package:natie_portfolio/global/strings.dart';
import 'package:natie_portfolio/global/styles.dart';
import 'package:natie_portfolio/store/language_store.dart';
import 'package:natie_portfolio/store/theme_store.dart';
import 'package:provider/provider.dart';

import 'image_view.dart';

class IconBtn extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;

  const IconBtn({
    Key? key,
    this.icon = const Icon(Icons.question_mark_rounded),
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Theme.of(context).colorScheme.onSurface,
        padding: EdgeInsets.zero,
        shape: const CircleBorder(),
      ),
      child: icon,
      onPressed: onPressed,
    );
  }
}

class ElevatedBtn extends StatelessWidget {
  final Widget text;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final bool circular;

  const ElevatedBtn({
    Key? key,
    this.text = const Text(''),
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(
      horizontal: Dimens.btnPaddingHorizontal,
      vertical: Dimens.btnPaddingVertical,
    ),
    this.circular = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: padding,
        shape: circular
            ? const CircleBorder()
            : const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimens.btnRadius)),
              ),
      ),
      onPressed: onPressed,
      child: text,
    );
  }
}

class LanguageBtn extends StatelessWidget {
  final enImageUrl = 'https://flagcdn.com/w20/us.png';
  final viImageUrl = 'https://flagcdn.com/w20/vn.png';

  const LanguageBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        // Get data from store
        final languageStore = context.read<LanguageStore>();
        String imageUrl, placeholder;
        switch (Strings.language) {
          case Language.system:
          case Language.en:
            imageUrl = enImageUrl;
            placeholder = 'en';
            break;
          case Language.vi:
            imageUrl = viImageUrl;
            placeholder = 'vi';
            break;
        }
        // Build the button
        return IconBtn(
          icon: ImageView(
            width: Dimens.iconBtnSize,
            imageUrl: imageUrl,
            placeholder: Text(
              placeholder,
              style: Styles.iconBtnPlaceholderStyle,
            ),
          ),
          onPressed: () => languageStore.setActiveLanguage(
              imageUrl == enImageUrl ? Language.vi : Language.en),
        );
      },
    );
  }
}

class ThemeBtn extends StatelessWidget {
  const ThemeBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final themeStore = context.read<ThemeStore>();
        final isDarkMode = themeStore.activeTheme == ThemeMode.dark;
        return IconBtn(
          icon: isDarkMode
              ? const Icon(CupertinoIcons.moon)
              : const Icon(CupertinoIcons.sun_min),
          onPressed: () => themeStore
              .setActiveTheme(isDarkMode ? ThemeMode.light : ThemeMode.dark),
        );
      },
    );
  }
}