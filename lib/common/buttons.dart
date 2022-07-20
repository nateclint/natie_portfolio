import 'package:flutter/material.dart';
import 'package:natie_portfolio/global/dimens.dart';
import 'package:natie_portfolio/global/strings.dart';

import 'image_view.dart';

class IconBtn extends StatelessWidget {
  final Widget icon;
  final Function()? onPressed;

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
  final Function()? onPressed;
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
  final Lang language;
  final Function()? onPressed;

  const LanguageBtn({
    Key? key,
    required this.language,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imageUrl;
    switch (language) {
      case Lang.vi:
        imageUrl = 'https://flagcdn.com/w20/vn.png';
        break;
      case Lang.en:
        imageUrl = 'https://flagcdn.com/w20/us.png';
        break;
    }

    return IconBtn(
      icon: ImageView(
        width: Dimens.iconBtnSize,
        imageUrl: imageUrl,
        placeholder: Text(
          language.name,
          style: const TextStyle(fontFamily: 'monospace'),
        ),
      ),
      onPressed: onPressed,
    );
  }
}