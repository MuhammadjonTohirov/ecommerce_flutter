// import 'package:charts_flutter/flutter.dart' as charts;
import 'package:ecommerce/helpers/colors.dart';
import 'package:ecommerce/helpers/metrics.dart';
import 'package:ecommerce/models/dashboard/dashboard_card_item.dart';
import 'package:ecommerce/screens/dashboard/dashboard_screen.dart';
import 'package:ecommerce/screens/products/products_screen.dart';
import 'package:ecommerce/widgets/dashboard/dashboard_card_item_view.dart';
import 'package:ecommerce/widgets/home/home_left_menu.dart';
import 'package:flutter/material.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenBody();
  }
}

class _HomeScreenBody extends State<HomeScreenBody> {
  double lastMenuWidth = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidthType screenType = widthTypeWith(context);

    return Container(
      color: Theme.of(context).backgroundColor,
      child: Row(
        children: [
          Container(
            child: HomeLeftMenu(),
          ),
          Expanded(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical, child: ProductsScreen()),
          )
        ],
      ),
    );
  }
}
