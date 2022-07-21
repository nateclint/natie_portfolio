import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:natie_portfolio/global/strings.dart';
import 'package:natie_portfolio/widget/common/buttons.dart';
import 'package:natie_portfolio/widget/common/content_item.dart';
import 'package:natie_portfolio/widget/common/list_view.dart';
import 'package:natie_portfolio/global/dimens.dart';
import 'package:natie_portfolio/global/styles.dart';
import 'package:natie_portfolio/data/model/project.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  PreferredSizeWidget _appBar = AppBar();
  Widget _body = Container();
  Widget _drawer = Container();

  void _initAppBar() {
    _appBar = AppBar(
      leading: IconBtn(
        icon: const Icon(Icons.menu_rounded),
        onPressed: () => _scaffoldKey.currentState!.openDrawer(),
      ),
      centerTitle: true,
      title: Observer(builder: (_) => Text(Strings.title)),
      actions: [
        IconBtn(
          icon: const Icon(CupertinoIcons.search),
          onPressed: () {},
        ),
        const LanguageBtn(),
        const ThemeBtn(),
      ],
    );
  }

  void _initBody() {
    _body = SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.pageContentPaddingHorizontal,
        vertical: Dimens.pageContentPaddingVertical,
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: Dimens.pageContentMaxWidth),
          child: PaddedColumn(
            padding:
                const EdgeInsets.symmetric(vertical: Dimens.projectItemPadding),
            children: Projects.values
                .where((p) => p.featured)
                .map((p) => ProjectItem(p))
                .toList(),
          ),
        ),
      ),
    );
  }

  void _initDrawer() {
    _drawer = Drawer(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.drawerPadding),
        child: CardItem(
          child: ListView(
            children: [
              DrawerHeader(
                child: PaddedColumn(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  padding: const EdgeInsets.symmetric(
                      vertical: Dimens.drawerItemPadding),
                  children: [
                    // App icon
                    Text(
                      AppLocalizations.of(context)!.navigate_to,
                      style: Styles.headerStyle
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _initAppBar();
    _initBody();
    _initDrawer();

    return Scaffold(
      key: _scaffoldKey,
      appBar: _appBar,
      drawer: _drawer,
      body: _body,
    );
  }
}