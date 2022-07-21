import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:natie_portfolio/global/dimens.dart';
import 'package:natie_portfolio/global/strings.dart';
import 'package:natie_portfolio/global/styles.dart';
import 'package:natie_portfolio/data/model/project.dart';
import 'package:natie_portfolio/store/language_store.dart';
import 'package:provider/provider.dart';

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
    return Observer(
      builder: (context) {
        final isEn = Strings.language == Language.en;
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
                        DateFormat.yMMMMd(Strings.language.name)
                            .format(p.completionDate!),
                        style: Styles.subHeaderStyle.copyWith(color: p.color),
                      ),
                    Text(
                      isEn ? p.description : p.descriptionVi,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              if (p.imageUrls.isNotEmpty) Image.network(p.imageUrls[0]),
            ],
          ),
        );
      },
    );
  }
}