import 'package:flutter/cupertino.dart';

class PaddedColumn extends StatelessWidget {
  final EdgeInsets padding;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final bool paddingStartAndEnd;
  final List<Widget> children;

  const PaddedColumn({
    Key? key,
    required this.padding,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.paddingStartAndEnd = false,
    this.children = const <Widget>[],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      children: children.map((child) {
        final noPad = !paddingStartAndEnd &&
            (child == children.first || child == children.last);
        return Padding(
          padding: noPad ? EdgeInsets.zero : padding,
          child: child,
        );
      }).toList(),
    );
  }
}

class PaddedRow extends StatelessWidget {
  final EdgeInsets padding;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final bool paddingStartAndEnd;
  final List<Widget> children;

  const PaddedRow({
    Key? key,
    required this.padding,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.paddingStartAndEnd = false,
    this.children = const <Widget>[],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      children: children.map((child) {
        final noPad = !paddingStartAndEnd &&
            (child == children.first || child == children.last);
        return Padding(
          padding: noPad ? EdgeInsets.zero : padding,
          child: child,
        );
      }).toList(),
    );
  }
}