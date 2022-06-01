import 'package:ecommerce/helpers/media_provider.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              Media.iconList,
              width: 24,
              height: 24,
              color: Colors.grey,
            ),
            Image.asset(Media.iconDashboard2, width: 24, height: 24),
            button()
          ],
        ),
        Text("ProductsScreen"),
        Text("ProductsScreen"),
      ],
    );
  }

  Widget button() {
    return Container(
      height: 24,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      child: Center(
        child: Row(children: [
          SizedBox(width: 4),
          Image.asset(Media.iconDashboard2, width: 24, height: 24),
          Text("Button"),
          SizedBox(width: 8),
        ]),
      ),
    );
  }
}
