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

class ProjectPage extends StatefulWidget {
  final Project project;

  const ProjectPage({Key? key, required this.project}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  late Project _project;

  PreferredSizeWidget _appBar = AppBar();
  Widget _body = Container();

  final AnimationStore introAni = AnimationStore();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _project = widget.project;
    WidgetsBinding.instance.addPostFrameCallback((_) => introAni.start());
  }

  void _initAppBar() {
    _appBar = AppBar(
      leading: const BackBtn(),
      centerTitle: true,
      title: Observer(builder: (context) {
        return AnimatedOpacity(
          opacity: introAni.willStart ? 1 : 0,
          duration: Vars.animationFast,
          child: TextBtn(
            child: Text(_project.title),
            textStyle: Theme.of(context).appBarTheme.titleTextStyle,
            hasFeedback: false,
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
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            ProjectBanner(
              project: _project,
              actionLabel: Observer(
                  builder: (context) =>
                      Text(AppLocalizations.of(context)!.explore)),
              onAction: () => _scrollController.animateTo(
                Dimens.bannerHeight,
                duration: Vars.animationSlow,
                curve: Curves.easeOut,
              ),
            ),
            Container(height: 1000),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _initAppBar();
    _initBody();

    return Hero(
      tag: '${Routes.project}/${_project.id}',
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