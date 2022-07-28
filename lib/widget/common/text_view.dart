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

  TextView.header({
    Key? key,
    this.text,
    this.textCallback,
    this.color,
    this.spaced = false,
    this.padding = EdgeInsets.zero,
    this.textAlign = TextAlign.start,
    this.softWrap = false,
  })  : style = Styles.headerStyle,
        assert(text != null && textCallback == null ||
            textCallback != null && text == null),
        super(key: key);

  TextView.subheader({
    Key? key,
    this.text,
    this.textCallback,
    this.color,
    this.spaced = false,
    this.padding = EdgeInsets.zero,
    this.textAlign = TextAlign.start,
    this.softWrap = false,
  })  : style = Styles.subheaderStyle,
        assert(text != null && textCallback == null ||
            textCallback != null && text == null),
        super(key: key);

  TextView.footer({
    Key? key,
    this.text,
    this.textCallback,
    this.color,
    this.spaced = false,
    this.padding = EdgeInsets.zero,
    this.textAlign = TextAlign.start,
    this.softWrap = false,
  })  : style = Styles.footerStyle,
        assert(text != null && textCallback == null ||
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