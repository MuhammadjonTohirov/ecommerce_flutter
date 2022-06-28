import 'package:ecommerce/helpers/colors.dart';
import 'package:ecommerce/helpers/media_provider.dart';
import 'package:ecommerce/helpers/metrics.dart';
import 'package:ecommerce/models/sales/category.dart';
import 'package:ecommerce/screens/home/product_item_view.dart';
import 'package:ecommerce/screens/home/sales/views/search_field.dart';
import 'package:ecommerce/widgets/common/widgets/buttons/simple_button.dart';
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
      floatingActionButton: Stack(
        children: [
          cartButton(context),
          Positioned(
            child: Container(
              child: Text(
                "5",
                style: TextStyle(color: Colors.white, fontSize: 11),
              ),
              alignment: Alignment.center,
              width: 20,
              height: 20,
              decoration:
                  BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            ),
            top: 0,
            right: 0,
          ),
        ],
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      appBar: appBar(context),
      body: SafeArea(
        child: bodyWidget(context),
        bottom: false,
      ),
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
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                child: topBody(context),
                padding: EdgeInsets.only(top: 0, left: 0, right: 8, bottom: 0),
              ),
              Expanded(
                child: middleBody(context),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ],
      ),
    );
  }

  Widget cartButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Theme.of(context).backgroundColor,
      splashColor: ColorPack.primary.withOpacity(0.5),
      mini: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.asset(
        Media.iconCart,
        fit: BoxFit.scaleDown,
        width: 22,
        height: 22,
        color: ColorPack.primary,
      ),
    );
  }

  Widget topBody(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 12),
        Expanded(
          child: SearchField(),
        ),
        Container(
          child: IconButton(
            splashRadius: 20,
            icon: Image.asset(
              Media.iconDashboard2,
              color: ColorPack.primary,
            ),
            onPressed: () {},
          ),
          padding: EdgeInsets.only(left: 0),
        ),
      ],
    );
  }

  Widget middleBody(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(bottom: 50),
      physics: BouncingScrollPhysics(),
      child: Container(
        child: Wrap(
          spacing: 8,
          children: [
            ProductItemView(ProductItem("Mem", Media.imageProduct1, "\$200",
                "Lorem ipsum dolor set amet, google, moogle, poogle")),
            ProductItemView(ProductItem(
                "Mem", Media.imageProduct1, "\$200", "Lorem ipsum dolor set ")),
            ProductItemView(ProductItem("Mem", Media.imageProduct1, "\$200",
                "Lorem ipsum dolor set amet, google, moogle, poogle")),
            ProductItemView(ProductItem("Mem", Media.imageProduct1, "\$99",
                "Lorem ipsum dolor set amet, google, moogle, poogle")),
            ProductItemView(ProductItem("Mem", Media.imageProduct1, "\$200",
                "Lorem ipsum dolor set amet, google, moogle, poogle")),
            ProductItemView(ProductItem("Mem", Media.imageProduct1, "\$200",
                "Lorem ipsum dolor set amet, google, moogle, poogle")),
            ProductItemView(
              ProductItem("Mem", Media.imageProduct1, "\$200",
                  "Lorem ipsum dolor set amet, google, moogle, poogle"),
            ),
          ],
        ),
      ),
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
