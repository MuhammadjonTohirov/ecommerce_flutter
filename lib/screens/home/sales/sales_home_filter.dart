import 'package:ecommerce/widgets/common/widgets/fields/drop_down_field.dart';
import 'package:ecommerce/widgets/common/widgets/fields/price_field.dart';
import 'package:flutter/material.dart';

class HomeFilterView extends StatelessWidget {
  late final TextEditingController fromPriceController =
      TextEditingController();
  late final TextEditingController toPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          Container(
            child: PriceField(this.fromPriceController, "FROM"),
            width: 150,
            height: 36,
            margin: EdgeInsets.only(top: 8),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            child: PriceField(this.toPriceController, "TO"),
            width: 150,
            height: 36,
            margin: EdgeInsets.only(top: 8),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            width: 150,
            height: 36,
            // padding: EdgeInsets.only(left: 8, right: 8),
            margin: EdgeInsets.only(top: 8),
            child: DropDownTextField(
              ["Price", "Discount", "Newest."],
              "Sort By",
            ),
          ),
        ],
      ),
    );
  }
}
