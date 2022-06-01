import 'package:ecommerce/controllers/SalesHome/sales_home_controller.dart';
import 'package:ecommerce/helpers/colors.dart';
import 'package:ecommerce/helpers/global_methods.dart';
import 'package:ecommerce/helpers/media_provider.dart';
import 'package:ecommerce/helpers/metrics.dart';
import 'package:ecommerce/screens/home/categoires_navigation_view.dart';
import 'package:ecommerce/screens/home/product_item_view.dart';
import 'package:ecommerce/screens/home/sales/sales_home_filter.dart';
import 'package:ecommerce/widgets/common/widgets/expandable_button.dart';
import 'package:flutter/material.dart';

class SalesHomeWidget extends StatefulWidget {
  SalesHomeWidget({Key? key}) {
    this.controller = SalesHomeController();
  }

  late SalesHomeController controller;

  @override
  State<SalesHomeWidget> createState() => _SalesHomeWidgetState();
}

class _SalesHomeWidgetState extends State<SalesHomeWidget> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      // this.widget.controller.loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.controller.updateState = () {
      setState(() {});
    };

    return Scaffold(
      appBar: AppBar(
        title: topBar(context),
        elevation: 0.3,
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: mainScrollView(context),
      ),
    );
  }

  Widget mainScrollView(BuildContext context) {
    return SingleChildScrollView(
      child: Text("Greater good"),
    );
  }

  Widget body(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("number of products ${widget.controller.products.length}"),
        Container(
          child: CategoiresNavigationView((category) {
            print(category);
          }),
        ),
        Container(
          child: rightBody(context),
        ),
      ],
    );
  }

  Widget rightBody(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32),
      width: Design.widthByPercentage(40),
      child: Column(
        children: [
          Container(
            child: HomeFilterView(),
            alignment: Alignment.topLeft,
          ),
          Container(
            decoration: BoxDecoration(
              color: ColorPack.background,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(1, 2),
                  blurRadius: 4,
                )
              ],
            ),
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            alignment: Alignment.topLeft,
            child: products(context),
          ),
        ],
      ),
    );
  }

  Widget products(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      runAlignment: WrapAlignment.start,
      spacing: 16,
      children:
          widget.controller.products.map((e) => ProductItemView(e)).toList(),
    );
  }

  Widget leftBody(BuildContext context) {
    return Container(
      width: Design.responsiveWidth(300),
      child: Column(
        children: [
          ExpandableButton("Home", [
            ExpandableButton("Forks", []),
            ExpandableButton("Dishes", []),
          ]),
          ExpandableButton("Electronics", [
            ExpandableButton("Laptop", [
              ExpandableButton("Apple", []),
              ExpandableButton("Acer", []),
            ]),
            ExpandableButton("Mobile phone", []),
          ]),
          ExpandableButton("Button", [ExpandableButton("Child", [])]),
        ],
      ),
    );
  }

  Widget topBar(BuildContext context) {
    return Row(
      children: [
        Image.asset(Media.logo, height: 50),
        Expanded(
          child: Container(
            height: 42,
            decoration: BoxDecoration(
              color: ColorPack.secondaryBackground,
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(
                  color: ColorPack.textGrey,
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                ),
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorPack.textGrey,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.cancel, color: ColorPack.textGrey),
                  onPressed: () {},
                  splashRadius: 16,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          child: Stack(
            children: [
              Container(
                width: 32,
                height: 32,
                child: Padding(
                  child: Image.asset(Media.iconCart),
                  padding:
                      EdgeInsets.only(left: 4, right: 4, top: 0, bottom: 0),
                ),
              ),
              Positioned(
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                      color: ColorPack.red, shape: BoxShape.circle),
                  alignment: Alignment.center,
                  child: Text(
                    "2",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                top: 0,
                right: 0,
              ),
            ],
          ),
          onTap: () {
            appLog("On Tap Cart");
          },
        ),
      ],
    );
  }
}
