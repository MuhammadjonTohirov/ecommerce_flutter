import 'package:ecommerce/helpers/colors.dart';
import 'package:ecommerce/helpers/global_methods.dart';
import 'package:ecommerce/helpers/media_provider.dart';
import 'package:ecommerce/helpers/metrics.dart';
import 'package:ecommerce/models/sales/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductItemView extends StatefulWidget {
  late final ProductItem product;

  ProductItemView(this.product);

  @override
  State<ProductItemView> createState() => _ProductItemViewState();
}

class _ProductItemViewState extends State<ProductItemView> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: mainBody(context),
      onHover: (event) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovering = false;
        });
      },
    );
  }

  Widget mainBody(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      margin: EdgeInsets.only(bottom: 8),
      constraints: BoxConstraints(
        maxWidth: Design.responsiveWidth(240),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color:
                isHovering ? Colors.black.withOpacity(0.1) : Colors.transparent,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        child: MaterialButton(
          onPressed: () {},
          child: Container(
            child: contentBody(),
            padding: EdgeInsets.all(8),
          ),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget contentBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Image.asset(widget.product.image, fit: BoxFit.cover),
          height: Design.responsiveWidth(224),
          width: Design.responsiveWidth(224),
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            this.widget.product.name,
            maxLines: 1,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            widget.product.price,
            maxLines: 1,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            this.widget.product.description,
            maxLines: 2,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: ColorPack.secondaryText,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 122,
              child: RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                itemSize: 18,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  appLog(rating);
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Row(children: [
                Container(
                  width: 24,
                  height: 24,
                  child: Icon(Icons.favorite),
                  margin: EdgeInsets.only(right: 8),
                ),
                Text("Like"),
              ]),
            ),
          ],
        ),
      ],
    );
  }
}
