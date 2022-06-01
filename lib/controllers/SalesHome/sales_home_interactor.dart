import 'package:ecommerce/models/sales/category.dart';
import 'package:ecommerce/network/app_network.dart';
import 'package:flutter/foundation.dart';

class SalesHomeInteractor {
  SalesHomeInteractor();

  void loadProducts(Function(List<ProductItem>) completion) {
    AppNetwork.instance.getProducts((products) {
      var productList = products.map((e) {
        var id = e.id;
        var price = e.singlePrice;
        var imageUrl = e.images.first.image;
        return ProductItem(
          "$id",
          e.product.title,
          "$imageUrl",
          "$price",
        );
      }).toList();

      completion(productList);
    });
  }
}
