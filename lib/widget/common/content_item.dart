import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:natie_portfolio/global/dimens.dart';
import 'package:natie_portfolio/global/router.dart';
import 'package:natie_portfolio/global/strings.dart';
import 'package:natie_portfolio/global/styles.dart';
import 'package:natie_portfolio/data/model/project.dart';

import 'image_view.dart';
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
  final Project project;

  const ProjectItem(this.project, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      final isEn = Strings.language == Language.en;
      return InkWell(
        onTap: () =>
            Navigator.of(context).pushNamed(Routes.project, arguments: project),
        child: Hero(
          tag: '${Routes.project}/${project.id}',
          child: CardItem(
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
                      Text(project.title,
                          style: Styles.headerStyle
                              .copyWith(color: project.color)),
                      if (project.completionDate != null)
                        Text(
                          DateFormat.yMMMMd(Strings.language.name)
                              .format(project.completionDate!),
                          style: Styles.subHeaderStyle
                              .copyWith(color: project.color),
                        ),
                      Text(
                        isEn ? project.description : project.descriptionVi,
                        style: Styles.spacedTextStyle,
                        textAlign: TextAlign.justify,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
                if (project.imageUrls.isNotEmpty)
                  RoundedImageView(project.imageUrls[0]),
              ],
            ),
          ),
        ),
      );
    });
  }
}