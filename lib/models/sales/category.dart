import 'package:uuid/uuid.dart';

abstract class Identifiable {
  late final String id;
}

class ProductCateogry implements Identifiable {
  late final String name; // late filan one time initialization and non-nullable
  late final String image;

  ProductCateogry(this.name, this.image);

  @override
  String id = Uuid().v4();
}

class ProductItem {
  late final String name;
  late final String image;
  late final String price;
  late final String description;

  ProductItem(this.name, this.image, this.price, this.description);
}
