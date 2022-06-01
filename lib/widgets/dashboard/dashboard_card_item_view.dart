import 'package:ecommerce/helpers/media_provider.dart';
import 'package:ecommerce/helpers/metrics.dart';
import 'package:ecommerce/models/dashboard/dashboard_card_item.dart';
import 'package:ecommerce/widgets/common/graphs/mini_graph.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class DashboardCardItemView extends StatelessWidget {
  late final DashboardCardItem item;

  DashboardCardItemView(DashboardCardItem item, {Key? key}) : super(key: key) {
    this.item = item;
  }

  @override
  Widget build(BuildContext context) {
    WidthType type = widthTypeWith(context);
    bool isSmall = type == WidthType.small;

    return Container(
      width: 273, //isSmall ? 273 : Design.responsiveWidth(273),
      height: 118,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: ui.Color(item.backgroundColor),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 15,
                offset: Offset(0, 2))
          ]),
      alignment: Alignment.center,
      child: Container(
        child: Column(
          children: [
            Spacer(),
            Row(
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
                Spacer(),
                LayoutBuilder(
                  builder: (_, builder) => Container(
                    width: 110,
                    height: 40,
                    child: CustomPaint(
                      painter: MiniLineGraph(),
                    ),
                  ),
                )
              ],
            ),
            Spacer(),
            Row(
              children: [
                valuesView(),
                Spacer(),
                Container(
                  child: Image.asset(
                    item.perentageIcon == null
                        ? Media.iconArrowUp
                        : item.perentageIcon!,
                    color: item.percentageColor,
                  ),
                  width: 24,
                  height: 24,
                ),
                Text(
                  item.percentageStr,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
        padding: EdgeInsets.only(left: 16, right: 16),
      ),
      margin: EdgeInsets.only(left: 16, right: 16),
    );
  }

  Widget valuesView() {
    if (this.item.extras.isNotEmpty) {
      var texts = this.item.extras.map((item) {
        return Text(
          item,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.white.withOpacity(0.6)),
        );
      }).toList();

      texts.insert(
          0,
          Text(
            item.value,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ));

      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: texts,
      );
    }
    return Text(
      item.value,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
    );
  }
}
