import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:natie_portfolio/global/router.dart';
import 'package:natie_portfolio/global/vars.dart';
import 'package:natie_portfolio/store/animation_store.dart';
import 'package:natie_portfolio/widget/common/banner_item.dart';
import 'package:natie_portfolio/widget/common/buttons.dart';
import 'package:natie_portfolio/global/dimens.dart';
import 'package:natie_portfolio/data/model/project.dart';
import 'package:natie_portfolio/widget/common/content_item.dart';
import 'package:natie_portfolio/widget/common/image_view.dart';
import 'package:natie_portfolio/widget/common/list_view.dart';
import 'package:natie_portfolio/widget/common/text_view.dart';

class ProjectPage extends StatefulWidget {
  final Project project;

  const ProjectPage({Key? key, required this.project}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  late Project _p;

  PreferredSizeWidget _appBar = AppBar();
  Widget _body = Container();

  final AnimationStore _introAni = AnimationStore();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _p = widget.project;
    WidgetsBinding.instance.addPostFrameCallback((_) => _introAni.start());
  }

  void _initAppBar() {
    _appBar = AppBar(
      leading: const BackBtn(),
      centerTitle: true,
      title: Observer(builder: (context) {
        return AnimatedOpacity(
          opacity: _introAni.willStart ? 1 : 0,
          duration: Vars.animationFast,
          child: TextBtn(
            child: TextView(text: _p.title),
            textStyle: Theme.of(context).appBarTheme.titleTextStyle,
            hoverFeedback: false,
            onPressed: () => _scrollController.animateTo(
              0,
              duration: Vars.animationSlow,
              curve: Curves.easeOut,
            ),
          ),
        );
      }),
      actions: const [LanguageBtn(), ThemeBtn()],
    );
  }

  void _initBody() {
    _body = SingleChildScrollView(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.pageContentPaddingHorizontal,
        vertical: Dimens.pageContentPaddingVertical,
      ),
      child: PaddedColumn(
        paddingStartAndEnd: false,
        padding: const EdgeInsets.symmetric(
            vertical: Dimens.projectDetailsPaddingVertical),
        children: [
          // Banner
          ProjectBanner(
            project: _p,
            onAction: () => _scrollController.animateTo(
              Dimens.bannerHeight,
              duration: Vars.animationSlow,
              curve: Curves.easeOut,
            ),
          ),

          // Functionalities
          TextView.header(
            text: AppLocalizations.of(context)!.what_you_can_do(_p.title),
            color: _p.color,
          ),
          PaddedColumn(
            paddingStartAndEnd: false,
            padding: const EdgeInsets.symmetric(
                vertical: Dimens.projectDetailsFuncPadding),
            children: List.generate(
                max(_p.functionalities.length, _p.functionalitiesVi.length),
                (i) => FunctionalityItem(_p, i)),
          ),

          // Technology used
          // FIXME: Need a background to add visibility to the icons
          TextView.header(
            text: AppLocalizations.of(context)!.tech_used,
            color: _p.color,
          ),
          Wrap(
            spacing: Dimens.projectDetailsTechPaddingHorizontal,
            runSpacing: Dimens.projectDetailsTechPaddingVertical,
            children: _p.tech.split(',').map((tech) {
              final src = Vars.assets[tech] ?? '';
              return SvgImageView(src,
                  width: Dimens.projectDetailsTechSize,
                  height: Dimens.projectDetailsTechSize,
                  fit: BoxFit.fitHeight);
            }).toList(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _initAppBar();
    _initBody();

    return Hero(
      tag: '${Routes.project}/${_p.id}',
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(side: BorderSide.none),
        child: Scaffold(
          appBar: _appBar,
          body: _body,
        ),
      ),
    );
  }
}