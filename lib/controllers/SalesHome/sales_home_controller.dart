import 'package:ecommerce/controllers/SalesHome/sales_home_interactor.dart';
import 'package:ecommerce/models/sales/category.dart';
import 'package:ecommerce/helpers/media_provider.dart';

class SalesHomeController {
  late List<ProductItem> products = [];
  var interactor = SalesHomeInteractor();
  late Function updateState;

  SalesHomeController() {
    products.add(
      ProductItem("Printer", Media.imageProduct1, "\$54",
          "Eligible for Shipping To Mars or somewhere else"),
    );

    products.add(
      ProductItem("Shoes", Media.imageProduct2, "\$10",
          "Lee Pucker design. Leather botinki for handsome designers. Free shipping."),
    );

    products.add(
      ProductItem("Cat", Media.imageProduct3, "\$100",
          "Timesaving kitten to save months on development. Playful, cute, cheap!"),
    );

    products.add(
      ProductItem("Lamp", Media.imageProduct4, "\$10",
          "Plastic useless plugs and tubes for high-fidelity prototyping. Fit & Eat!"),
    );
  }

  void loadProducts() {
    interactor.loadProducts((p0) {
      this.products = p0;
      this.updateState();
    });
  }
}
