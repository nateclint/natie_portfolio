import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:natie_portfolio/global/styles.dart';

/// A Text widget nested in some of the most used widgets.
class TextView extends StatelessWidget {
  final String? text;
  final String Function()? textCallback;
  final Color? color;
  final TextStyle? style;
  final bool spaced;
  final EdgeInsets padding;
  final TextAlign textAlign;
  final bool softWrap;

  Widget get textWidget => Text(
        text ?? textCallback!(),
        textAlign: textAlign,
        softWrap: softWrap,
        style: style?.copyWith(
          color: color ?? style?.color,
          letterSpacing: spaced
              ? Styles.spacedTextStyle.letterSpacing
              : style?.letterSpacing,
        ),
      );

  const TextView({
    Key? key,
    this.text,
    this.textCallback,
    this.color,
    this.style,
    this.spaced = false,
    this.padding = EdgeInsets.zero,
    this.textAlign = TextAlign.start,
    this.softWrap = false,
  })  : assert(text != null && textCallback == null ||
            textCallback != null && text == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: text != null
          ? textWidget
          : Observer(builder: (context) => textWidget),
    );
  }
}

class HeaderTextView extends TextView {
  HeaderTextView({
    Key? key,
    String? text,
    String Function()? textCallback,
    Color? color,
    bool spaced = false,
    EdgeInsets padding = EdgeInsets.zero,
    TextAlign textAlign = TextAlign.start,
    bool softWrap = false,
  }) : super(
          key: key,
          text: text,
          textCallback: textCallback,
          color: color,
          style: Styles.headerStyle,
          spaced: spaced,
          padding: padding,
          textAlign: textAlign,
          softWrap: softWrap,
        );
}

class SubheaderTextView extends TextView {
  SubheaderTextView({
    Key? key,
    String? text,
    String Function()? textCallback,
    Color? color,
    bool spaced = false,
    EdgeInsets padding = EdgeInsets.zero,
    TextAlign textAlign = TextAlign.start,
    bool softWrap = false,
  }) : super(
          key: key,
          text: text,
          textCallback: textCallback,
          color: color,
          style: Styles.subHeaderStyle,
          spaced: spaced,
          padding: padding,
          textAlign: textAlign,
          softWrap: softWrap,
        );
}

class FooterTextView extends TextView {
  FooterTextView({
    Key? key,
    String? text,
    String Function()? textCallback,
    Color? color,
    bool spaced = false,
    EdgeInsets padding = EdgeInsets.zero,
    TextAlign textAlign = TextAlign.start,
    bool softWrap = false,
  }) : super(
          key: key,
          text: text,
          textCallback: textCallback,
          color: color,
          style: Styles.footerStyle,
          spaced: spaced,
          padding: padding,
          textAlign: textAlign,
          softWrap: softWrap,
        );
}