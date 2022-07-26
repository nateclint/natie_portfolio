import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:natie_portfolio/global/router.dart';
import 'package:natie_portfolio/global/strings.dart';
import 'package:natie_portfolio/global/vars.dart';
import 'package:natie_portfolio/widget/common/buttons.dart';
import 'package:natie_portfolio/widget/common/list_view.dart';
import 'package:natie_portfolio/global/dimens.dart';
import 'package:natie_portfolio/global/styles.dart';
import 'package:natie_portfolio/data/model/project.dart';

class ProjectPage extends StatefulWidget {
  final Project project;

  const ProjectPage({Key? key, required this.project}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  late Project _project;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  PreferredSizeWidget _appBar = AppBar();
  Widget _body = Container();

  var _initDone = false;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _project = widget.project;
    WidgetsBinding.instance
        .addPostFrameCallback((_) => setState(() => _initDone = true));
  }

  void _initAppBar() {
    _appBar = AppBar(
      leading: IconBtn(
        tooltipText: AppLocalizations.of(context)!.back,
        child: const Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.of(context).pop(),
      ),
      centerTitle: true,
      title: AnimatedOpacity(
        opacity: _initDone ? 1 : 0,
        duration: Vars.animationFast,
        child: TextBtn(
          child: Text(_project.title),
          textStyle: Theme.of(context).appBarTheme.titleTextStyle,
          hasFeedback: false,
          onPressed: () => _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOut,
          ),
        ),
      ),
      actions: const [LanguageBtn(), ThemeBtn()],
    );
  }

  void _initBody() {
    _body = Observer(builder: (context) {
      final isEn = Strings.language == Language.en;
      return SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.pageContentPaddingHorizontal,
          vertical: Dimens.pageContentPaddingVertical,
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: PaddedColumn(
            padding: const EdgeInsets.symmetric(
                vertical: Dimens.projectItemPadding),
            children: [
              Text(_project.title,
                  style: Styles.headerStyle.copyWith(color: _project.color)),
              if (_project.completionDate != null)
                Text(
                  DateFormat.yMMMMd(Strings.language.name)
                      .format(_project.completionDate!),
                  style:
                      Styles.subHeaderStyle.copyWith(color: _project.color),
                ),
              Text(
                isEn ? _project.description : _project.descriptionVi,
                style: Styles.spacedTextStyle,
                textAlign: TextAlign.justify,
                softWrap: true,
              ),
            ],
          ),
        ),
      );
    });
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
          key: _scaffoldKey,
          appBar: _appBar,
          body: _body,
        ),
      ),
    );
  }
}