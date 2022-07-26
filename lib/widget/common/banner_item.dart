import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:natie_portfolio/data/model/project.dart';
import 'package:natie_portfolio/global/dimens.dart';
import 'package:natie_portfolio/global/strings.dart';
import 'package:natie_portfolio/global/styles.dart';
import 'package:natie_portfolio/global/vars.dart';
import 'package:natie_portfolio/store/animation_store.dart';

import 'buttons.dart';
import 'image_view.dart';
import 'list_view.dart';

class BannerItem extends StatefulWidget {
  final Widget title;
  final Widget description;
  final String imageUrl;
  final Color? primary;
  final Widget? actionLabel;
  final VoidCallback? onAction;

  const BannerItem({
    Key? key,
    required this.title,
    required this.description,
    this.imageUrl = '',
    this.primary,
    this.actionLabel,
    this.onAction,
  }) : super(key: key);

  @override
  State<BannerItem> createState() => _BannerItemState();
}

class _BannerItemState extends State<BannerItem> {
  late Widget _title;
  late Widget _description;
  late String _imageUrl;
  late Color _primary;
  late Widget? _actionLabel;
  late VoidCallback? _onAction;

  Size _screenSize = const Size(0, 0);
  Color _textColor = Colors.white;
  Color _actionColor = Colors.white;
  Widget _leftSide = Container();
  Widget _rightSide = Container();

  final AnimationStore introAni = AnimationStore();

  @override
  void initState() {
    super.initState();
    _title = widget.title;
    _description = widget.description;
    _imageUrl = widget.imageUrl;
    _primary = widget.primary ?? Theme.of(context).primaryColor;
    _actionLabel = widget.actionLabel;
    _onAction = widget.onAction;
  }

  void _initValues() {
    _screenSize = MediaQuery.of(context).size;
    _textColor = _primary.computeLuminance() > .5 ? Colors.black : Colors.white;
    final hsl = HSLColor.fromColor(_primary);
    _actionColor =
        hsl.withLightness((hsl.lightness + .2).clamp(0, 1)).toColor();
  }

  void _initLeftSide() {
    _leftSide = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.bannerPaddingHorizontal,
        vertical: Dimens.bannerPaddingVertical,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: Dimens.bannerContentLeftMaxWidth,
        ),
        child: PaddedColumn(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          padding:
              const EdgeInsets.symmetric(vertical: Dimens.bannerContentPadding),
          children: [
            Material(
              child: _title,
              color: Colors.transparent,
              textStyle: Styles.bannerTitleStyle.copyWith(color: _textColor),
            ),
            Material(
              child: _description,
              color: Colors.transparent,
              textStyle:
                  Styles.bannerDescriptionStyle.copyWith(color: _textColor),
            ),
            if (_actionLabel != null)
              Padding(
                padding: const EdgeInsets.all(Dimens.bannerActionOffset),
                child: ElevatedBtn(
                  padding: const EdgeInsets.symmetric(
                    vertical: Dimens.bannerActionPaddingVertical,
                    horizontal: Dimens.bannerActionPaddingHorizontal,
                  ),
                  child: Material(
                    child: _actionLabel,
                    color: Colors.transparent,
                    textStyle: Styles.bannerActionStyle,
                  ),
                  onPressed: _onAction,
                  color: _actionColor,
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _initRightSide() {
    _rightSide = Align(
      alignment: Alignment.bottomRight,
      child: ImageView(
        _imageUrl,
        errorWidget: const Icon(Icons.error),
        onFinish: () => introAni.start(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _initValues();
    _initLeftSide();
    _initRightSide();
    return Container(
      width: _screenSize.width,
      height: Dimens.bannerHeight,
      color: _primary,
      child: Observer(builder: (context) {
        return Stack(
          children: [
            AnimatedSlide(
              offset: introAni.willStart
                  ? Offset.zero
                  : const Offset(Dimens.bannerSlideOffset, 0),
              duration: Vars.animationSluggish,
              curve: Curves.easeOut,
              child: AnimatedOpacity(
                opacity: introAni.willStart ? 1 : 0,
                duration: Vars.animationFast,
                child: _rightSide,
              ),
            ),
            AnimatedSlide(
              offset: introAni.willStart
                  ? Offset.zero
                  : const Offset(-Dimens.bannerSlideOffset, 0),
              duration: Vars.animationSluggish,
              curve: Curves.easeOut,
              child: AnimatedOpacity(
                opacity: introAni.willStart ? 1 : 0,
                duration: Vars.animationFast,
                child: _leftSide,
              ),
            ),
          ],
        );
      }),
    );
  }
}

class ProjectBanner extends StatelessWidget {
  final Project project;
  final Widget? actionLabel;
  final VoidCallback? onAction;

  const ProjectBanner({
    Key? key,
    required this.project,
    this.actionLabel,
    this.onAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BannerItem(
      title: Text(project.title),
      description: Observer(builder: (context) {
        final isEn = Strings.language == Language.en;
        return Text(isEn ? project.description : project.descriptionVi);
      }),
      imageUrl: project.imageUrls.isNotEmpty ? project.imageUrls[0] : '',
      primary: project.color,
      actionLabel: actionLabel,
      onAction: onAction,
    );
  }
}