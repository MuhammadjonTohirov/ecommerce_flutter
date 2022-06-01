import 'package:ecommerce/helpers/colors.dart';
import 'package:ecommerce/helpers/metrics.dart';
import 'package:ecommerce/models/dashboard/dashboard_card_item.dart';
import 'package:ecommerce/widgets/dashboard/dashboard_card_item_view.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart' as chart;

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  Widget body(BuildContext context) {
    WidthType screenType = widthTypeWith(context);
    Map<String, double> dataMap = {
      "Fergana branch": 60,
      "Quva branch": 40,
    };
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          child: cardsView(screenType),
        ),
        Container(
          height: 300,
          decoration: BoxDecoration(
              color: ColorPack.background,
              boxShadow: [
                BoxShadow(
                  color: Colors.black87.withOpacity(0.1),
                  offset: Offset(2, 4),
                  blurRadius: 10,
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(16))),
          margin: EdgeInsets.all(24),
          child: chart.PieChart(
            ringStrokeWidth: 32,
            chartRadius: 130,
            chartType: chart.ChartType.ring,
            dataMap: dataMap,
            chartLegendSpacing: 50,
            initialAngleInDegree: 0,
            legendOptions: chart.LegendOptions(
                legendPosition: chart.LegendPosition.bottom,
                showLegendsInRow: true,
                legendShape: BoxShape.rectangle),
          ),
        ),
        SizedBox(height: 300)
      ],
    );
  }

  Widget cardsView(WidthType screen) {
    switch (screen) {
      case WidthType.large:
        return largeScreenCards();
      case WidthType.medium:
        return mediumScreenCards();
      case WidthType.small:
        return smallScreenCards();
    }
  }

  List<DashboardCardItem> cards() {
    DashboardCardItem card3 =
        DashboardCardItem("Total profit", "\$ 2 000", -2, 0xFF2D9CDB);
    card3.extras = ["21 600 000 sum", "€ 1900"];

    return [
      DashboardCardItem("New costumers", "120", 13, 0xFF6FCF97),
      DashboardCardItem("Active users", "100", 10, 0xFFF2C94C),
      card3
    ];
  }

  Widget smallScreenCards() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: cards()
          .map((e) => Container(
                padding: EdgeInsets.only(top: 16),
                child: DashboardCardItemView(e),
              ))
          .toList(),
    );
  }

  Widget mediumScreenCards() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: cards()
            .map((e) => Container(
                  child: DashboardCardItemView(e),
                ))
            .toList(),
      ),
    );
  }

  Widget largeScreenCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: cards()
          .map((e) => Container(
                child: DashboardCardItemView(e),
              ))
          .toList(),
    );
  }
}
