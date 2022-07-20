import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:natie_portfolio/global/dimens.dart';
import 'package:natie_portfolio/global/styles.dart';
import 'package:natie_portfolio/model/project.dart';

import 'list_view.dart';

class CardItem extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const CardItem({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.all(Dimens.cardItemPadding),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}

class ProjectItem extends StatelessWidget {
  final Project p;

  const ProjectItem(this.p, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardItem(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PaddedColumn(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              padding: const EdgeInsets.symmetric(
                  vertical: Dimens.projectItemContentPadding),
              children: [
                Text(p.title,
                    style: Styles.headerStyle.copyWith(color: p.color)),
                if (p.completionDate != null)
                  Text(
                    DateFormat.yMMMd(
                            Localizations.localeOf(context).languageCode)
                        .format(p.completionDate!),
                    style: Styles.subHeaderStyle.copyWith(color: p.color),
                  ),
                Text(p.description, softWrap: true),
              ],
            ),
          ),
          if (p.imageUrls.isNotEmpty) Image.network(p.imageUrls[0]),
        ],
      ),
    );
  }
}