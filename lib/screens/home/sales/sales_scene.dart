import 'package:ecommerce/helpers/colors.dart';
import 'package:ecommerce/helpers/media_provider.dart';
import 'package:ecommerce/helpers/metrics.dart';
import 'package:ecommerce/screens/home/sales/views/search_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SalesScene extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: appBar(context),
      body: bodyWidget(context),
      drawer: navigationDrawerWidget(context),
    );
  }

  Widget navigationDrawerWidget(BuildContext context) {
    return Drawer(
      child: SafeArea(child: Text("Google")),
      backgroundColor: Theme.of(context).backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }

  Widget bodyWidget(BuildContext context) {
    return Center(
      child: Column(children: [
        Container(
          child: topBody(context),
          padding: EdgeInsets.only(top: 2, left: 2, right: 8, bottom: 8),
        )
      ]),
    );
  }

  Widget topBody(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SearchField(),
        ),
        Container(
          child: IconButton(
            splashRadius: 20,
            icon: Image.asset(
              Media.iconDashboard2,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {},
          ),
          padding: EdgeInsets.only(left: 8),
        ),
      ],
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      elevation: 0.5,
      leading: IconButton(
        tooltip: MaterialLocalizations.of(context).drawerLabel,
        onPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },
        splashRadius: 24,
        icon: Image.asset(
          Media.iconMenu,
          height: 32,
          width: 32,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      title: const Text(
        "SalesScene",
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        CupertinoButton(
          padding: EdgeInsets.only(right: 8),
          onPressed: () {},
          child: Image.asset(
            Media.imageDefault3,
            height: 32,
          ),
        ),
      ],
      centerTitle: true,
    );
  }
}
