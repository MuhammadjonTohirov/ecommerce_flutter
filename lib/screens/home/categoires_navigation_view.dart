import 'package:ecommerce/helpers/colors.dart';
import 'package:ecommerce/helpers/media_provider.dart';
import 'package:ecommerce/models/sales/category.dart';
import 'package:flutter/material.dart';

class CategoiresNavigationView extends StatefulWidget {
  ValueChanged onCategoryChanged;

  List<ProductCateogry> categories = [
    ProductCateogry("Clothing & Shoes", Media.iconHanger),
    ProductCateogry("Entertainment", Media.iconCinema),
    ProductCateogry("Music", Media.iconConcert),
    ProductCateogry("Sport & Lifestyle", Media.iconFitness),
    ProductCateogry("Pets", Media.iconPets),
    ProductCateogry("Kitchen Accessories", Media.iconRestaurant),
    ProductCateogry("Travel Equipment", Media.iconObservation),
    ProductCateogry("Growing & Garden", Media.iconBarley),
    ProductCateogry("Electrical Tools", Media.iconPowerstation),
    ProductCateogry("Mother Care", Media.iconBabysitter),
    ProductCateogry("Toys & Entertainment", Media.iconNuclearStation),
    ProductCateogry("Vintage", Media.iconShipWheel),
  ];

  CategoiresNavigationView(this.onCategoryChanged);

  @override
  State<CategoiresNavigationView> createState() =>
      _CategoiresNavigationViewState();
}

class _CategoiresNavigationViewState extends State<CategoiresNavigationView> {
  late String selectedCategoryId = "";

  _CategoiresNavigationViewState() {}

  @override
  Widget build(BuildContext context) {
    this.selectedCategoryId = this.selectedCategoryId.isEmpty
        ? widget.categories.first.id
        : this.selectedCategoryId;
    return categoriesView(context);
  }

  Widget categoriesView(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(top: 24),
      child: Wrap(
        children: widget.categories.map((category) {
          return Container(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: MaterialButton(
              child: sectionTabItem(
                context,
                category.name,
                category.image,
                category.id == selectedCategoryId,
              ),
              onPressed: () {
                setState(() {
                  selectedCategoryId = category.id;
                });
                widget.onCategoryChanged(category.id);
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget sectionTabItem(BuildContext context, String title, String iconName,
      [bool isSelected = false]) {
    var color = !isSelected ? Colors.black87 : ColorPack.primary;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 20,
            height: 20,
            child: Image.asset(
              iconName,
              color: color,
            ),
          ),
          SizedBox(height: 6),
          Text(
            title,
            style: TextStyle(color: color),
          ),
        ],
      ),
    );
  }
}
