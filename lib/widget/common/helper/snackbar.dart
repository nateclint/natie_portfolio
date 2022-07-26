import 'package:flutter/material.dart';

enum SnackbarType {
  info,
  positive,
  negative,
}

class Snackbars {
  static showSnackbar(BuildContext context, SnackbarType type, String text,
      {String? actionLabel, VoidCallback? onAction}) {
    final ms = ScaffoldMessenger.of(context);
    ms.clearSnackBars();
    switch (type) {
      case SnackbarType.info:
        ms.showSnackBar(InfoSnackbar(
          context: context,
          text: text,
          actionLabel: actionLabel,
          onAction: onAction,
        ));
        return;
      case SnackbarType.positive:
        ms.showSnackBar(PositiveSnackbar(
          context: context,
          text: text,
          actionLabel: actionLabel,
          onAction: onAction,
        ));
        return;
      case SnackbarType.negative:
        ms.showSnackBar(NegativeSnackbar(
          context: context,
          text: text,
          actionLabel: actionLabel,
          onAction: onAction,
        ));
        return;
    }
  }
}

class InfoSnackbar extends SnackBar {
  final BuildContext context;
  final String text;
  final String? actionLabel;
  final VoidCallback? onAction;

  InfoSnackbar({
    Key? key,
    required this.context,
    required this.text,
    this.actionLabel,
    this.onAction,
  }) : super(
          key: key,
          content: Text(text),
          action: actionLabel == null
              ? null
              : SnackBarAction(
                  label: actionLabel,
                  onPressed: onAction ?? () {},
                ),
        );
}

class PositiveSnackbar extends SnackBar {
  final BuildContext context;
  final String text;
  final String? actionLabel;
  final VoidCallback? onAction;

  PositiveSnackbar({
    Key? key,
    required this.context,
    required this.text,
    this.actionLabel,
    this.onAction,
  }) : super(
          key: key,
          content: Text(text),
          backgroundColor: Theme.of(context).primaryColor,
          action: actionLabel == null
              ? null
              : SnackBarAction(
                  label: actionLabel,
                  onPressed: onAction ?? () {},
                ),
        );
}

class NegativeSnackbar extends SnackBar {
  final BuildContext context;
  final String text;
  final String? actionLabel;
  final VoidCallback? onAction;

  NegativeSnackbar({
    Key? key,
    required this.context,
    required this.text,
    this.actionLabel,
    this.onAction,
  }) : super(
          key: key,
          content: Text(text),
          backgroundColor: Theme.of(context).errorColor,
          action: actionLabel == null
              ? null
              : SnackBarAction(
                  label: actionLabel,
                  onPressed: onAction ?? () {},
                ),
        );
}