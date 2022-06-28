import 'package:ecommerce/helpers/colors.dart';
import 'package:ecommerce/helpers/global_methods.dart';
import 'package:ecommerce/helpers/media_provider.dart';
import 'package:ecommerce/helpers/metrics.dart';
import 'package:ecommerce/models/sales/category.dart';
import 'package:ecommerce/widgets/common/widgets/buttons/simple_button.dart';
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

  BoxDecoration mainBodyDecoration() {
    if (isWeb()) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color:
                isHovering ? Colors.black.withOpacity(0.1) : Colors.transparent,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      );
    }

    return BoxDecoration(
      borderRadius: BorderRadius.circular(8),
    );
  }

  Widget mainBody(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      margin: EdgeInsets.only(bottom: 8),
      constraints: BoxConstraints(
        maxWidth: Design.responsiveWidth(200),
      ),
      decoration: mainBodyDecoration(),
      child: SimpleButton(
        onPressed: () {
          appLog("On pres product item");
        },
        child: Padding(
          child: contentBody(),
          padding: EdgeInsets.all(4),
        ),
      ),
    );
  }

  Widget contentBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(widget.product.image, fit: BoxFit.cover),
        Container(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            this.widget.product.name,
            maxLines: 1,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: Text(
            widget.product.price,
            maxLines: 1,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          height: 40,
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
        Container(
          child: RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            itemSize: 14,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            cartButton(),
            likeButton("Like", Media.iconHeart),
          ],
        )
      ],
    );
  }

  Widget cartButton() {
    return Container(
      margin: EdgeInsets.only(top: 4),
      // clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
        border: Border.all(
          width: 1,
          color: ColorPack.primary,
        ),
      ),
      child: SimpleButton(
        onPressed: () {
          appLog("On pres cart button");
        },
        child: Container(
          alignment: Alignment.center,
          child: Image.asset(
            Media.iconCart,
            width: 20,
            height: 20,
            fit: BoxFit.scaleDown,
            color: ColorPack.primary,
          ),
          width: 32,
          height: 32,
        ),
      ),
    );
  }

  Widget likeButton(String text, String? iconName, {Function? onPressed}) {
    return Container(
      height: 32,
      margin: EdgeInsets.only(top: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        border: Border.all(
          color: ColorPack.primary,
          width: 1,
        ),
      ),
      child: SimpleButton(
        child: Padding(
          child: Row(children: [
            if (iconName != null)
              Container(
                padding: EdgeInsets.all(3),
                width: 20,
                height: 20,
                child: Image.asset(iconName),
                margin: EdgeInsets.only(right: 8),
              ),
            Text(text),
            SizedBox(width: 4)
          ]),
          padding: EdgeInsets.all(2),
        ),
        onPressed: () {},
      ),
    );
  }
}
