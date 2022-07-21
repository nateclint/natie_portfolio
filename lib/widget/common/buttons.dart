import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:natie_portfolio/global/dimens.dart';
import 'package:natie_portfolio/global/strings.dart';
import 'package:natie_portfolio/global/styles.dart';
import 'package:natie_portfolio/store/language_store.dart';
import 'package:natie_portfolio/store/theme_store.dart';
import 'package:provider/provider.dart';

import 'image_view.dart';

class IconBtn extends StatelessWidget {
  final Widget child;
  final String tooltipText;
  final VoidCallback? onPressed;

  const IconBtn({
    Key? key,
    required this.child,
    this.tooltipText = '',
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltipText,
      waitDuration: const Duration(seconds: 1),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Theme.of(context).colorScheme.onSurface,
          padding: EdgeInsets.zero,
          shape: const CircleBorder(),
        ),
        child: child,
        onPressed: onPressed,
      ),
    );
  }
}

class TextBtn extends StatelessWidget {
  final Widget child;
  final TextStyle? textStyle;
  final bool hasFeedback;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;

  const TextBtn({
    Key? key,
    required this.child,
    this.textStyle,
    this.hasFeedback = true,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(
      horizontal: Dimens.btnPaddingHorizontal,
      vertical: Dimens.btnPaddingVertical,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(textStyle?.color),
        padding: MaterialStateProperty.all(padding),
        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Dimens.btnRadius)),
        )),
        textStyle: MaterialStateProperty.all(textStyle),
        splashFactory: hasFeedback ? null : NoSplash.splashFactory,
        overlayColor:
            hasFeedback ? null : MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}

class ElevatedBtn extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final bool circular;

  const ElevatedBtn({
    Key? key,
    required this.child,
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
      child: child,
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
        if (Strings.language == Language.en) {
          imageUrl = enImageUrl;
          placeholder = 'en';
        } else {
          imageUrl = viImageUrl;
          placeholder = 'vi';
        }
        // Build the button
        return IconBtn(
          tooltipText: AppLocalizations.of(context)!.language,
          child: ImageView(
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
          tooltipText: AppLocalizations.of(context)!.theme,
          child: isDarkMode
              ? const Icon(CupertinoIcons.moon)
              : const Icon(CupertinoIcons.sun_min),
          onPressed: () => themeStore
              .setActiveTheme(isDarkMode ? ThemeMode.light : ThemeMode.dark),
        );
      },
    );
  }
}