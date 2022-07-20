import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:natie_portfolio/common/buttons.dart';
import 'package:natie_portfolio/common/content_item.dart';
import 'package:natie_portfolio/common/image_view.dart';
import 'package:natie_portfolio/global/styles.dart';
import 'package:natie_portfolio/model/project.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({
    Key? key,
    this.title = 'Gia Hưng - Mobile Developer',
  }) : super(key: key);

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
      title: Text(widget.title),
      actions: [
        IconBtn(
          icon: const Icon(CupertinoIcons.search),
          onPressed: () {},
        ),
        IconBtn(
          // icon: const ImageView(
          //   width: 20,
          //   imageUrl: 'https://flagcdn.com/w20/vn.png',
          //   placeholder: Text('vi', style: TextStyle(fontFamily: 'monospace')),
          // ),
          icon: const ImageView(
            width: 20,
            imageUrl: 'https://flagcdn.com/w20/us.png',
            placeholder: Text('en', style: TextStyle(fontFamily: 'monospace')),
          ),
          onPressed: () {},
        ),
        IconBtn(
          icon: const Icon(CupertinoIcons.sun_min),
          // icon: const Icon(CupertinoIcons.moon),
          onPressed: () {},
        ),
      ],
    );
  }

  void _initBody() {
    _body = ListView(
      children: [
        ProjectItem(Projects.nieNote),
      ],
    );
  }

  void _initDrawer() {
    _drawer = Drawer(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // App icon
                      Container(height: 8),
                      Text(
                        'Navigate to',
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