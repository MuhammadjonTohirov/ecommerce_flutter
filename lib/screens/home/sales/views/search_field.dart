import 'package:ecommerce/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(50),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(
            color: ColorPack.textGrey,
            fontSize: 16,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withAlpha(50),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: ColorPack.textGrey,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.cancel,
              color: ColorPack.textGrey,
              size: 16,
            ),
            onPressed: () {},
            splashRadius: 16,
          ),
        ),
      ),
    );
  }
}
