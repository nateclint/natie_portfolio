import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:natie_portfolio/global/dimens.dart';
import 'package:natie_portfolio/global/router.dart';
import 'package:natie_portfolio/global/strings.dart';
import 'package:natie_portfolio/data/model/project.dart';
import 'package:natie_portfolio/store/animation_store.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../global/vars.dart';
import 'animated_view.dart';
import 'image_view.dart';
import 'list_view.dart';
import 'text_view.dart';

class CardItem extends StatefulWidget {
  final Widget child;
  final EdgeInsets padding;
  final VoidCallback? onPressed;
  final bool hoverFeedback;
  final double hoverScale;
  final Duration hoverAnimationSpeed;

  const CardItem({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.all(Dimens.cardItemPadding),
    this.onPressed,
    this.hoverFeedback = false,
    this.hoverScale = 1.2,
    this.hoverAnimationSpeed = Vars.animationFast,
  }) : super(key: key);

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return AnimatedHover(
      scaleOnHover: widget.hoverScale,
      duration: widget.hoverAnimationSpeed,
      onPressed: widget.onPressed,
      feedback: widget.hoverFeedback,
      child: Card(
        child: Padding(
          padding: widget.padding,
          child: widget.child,
        ),
      ),
    );
  }
}

class ProjectItem extends StatelessWidget {
  final Project project;

  const ProjectItem(this.project, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${Routes.project}/${project.id}',
      child: CardItem(
        onPressed: () =>
            Navigator.of(context).pushNamed(Routes.project, arguments: project),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PaddedColumn(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                padding: const EdgeInsets.symmetric(
                    vertical: Dimens.projectItemContentPadding),
                children: [
                  TextView.header(
                    text: project.title,
                    color: project.color,
                  ),
                  if (project.completionDate != null)
                    TextView.subheader(
                        textCallback: () =>
                            DateFormat.yMMMMd(Strings.language.name)
                                .format(project.completionDate!),
                        color: project.color),
                  Observer(builder: (context) {
                    return TextView(
                      text: Strings.isEn
                          ? project.description
                          : project.descriptionVi,
                      spaced: true,
                      textAlign: TextAlign.justify,
                      softWrap: true,
                    );
                  }),
                ],
              ),
            ),
            if (project.imageUrls.isNotEmpty)
              RoundedImageView(
                project.imageUrls[0],
                width: Dimens.projectItemImageWidth,
              ),
          ],
        ),
      ),
    );
  }
}

class FunctionalityItem extends StatefulWidget {
  final Project project;
  final int index;

  const FunctionalityItem(this.project, this.index, {Key? key})
      : super(key: key);

  @override
  State<FunctionalityItem> createState() => _FunctionalityItemState();
}

class _FunctionalityItemState extends State<FunctionalityItem> {
  late Project _p;
  late int _i;

  Widget _contentCard = Container();
  final AnimationStore _visibleAni = AnimationStore();

  @override
  void initState() {
    super.initState();
    _p = widget.project;
    _i = widget.index;
  }

  void _initContentCard() {
    _contentCard = Observer(builder: (context) {
      List<String> f;
      if (Strings.isEn) {
        f = _p.functionalities.isNotEmpty
            ? _p.functionalities
            : _p.functionalitiesVi;
      } else {
        f = _p.functionalitiesVi.isNotEmpty
            ? _p.functionalitiesVi
            : _p.functionalities;
      }
      if (f.length < _i) return Container();
      return SizedBox(
        width: Dimens.projectDetailsFuncWidth,
        child: CardItem(
          hoverFeedback: true,
          child: TextView(
            text: f[_i],
            textAlign: TextAlign.center,
            spaced: true,
            softWrap: true,
            padding: const EdgeInsets.symmetric(
                horizontal: Dimens.projectDetailsFuncPadding,
                vertical: Dimens.projectDetailsFuncPadding),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    _initContentCard();
    return VisibilityDetector(
      key: Key('${_p.id}_$_i'),
      onVisibilityChanged: (visibility) {
        if (visibility.visibleFraction > .5) {
          if (!_visibleAni.willStart) _visibleAni.start();
        }
      },
      child: FadeSlideAnimation(
        offset: _visibleAni.willStart
            ? Offset.zero
            : const Offset(0, -Dimens.projectDetailsFuncOffset),
        opacity: _visibleAni.willStart ? 1 : 0,
        duration: Vars.animationFast,
        child: _contentCard,
      ),
    );
  }
}