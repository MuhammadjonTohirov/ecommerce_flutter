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
        color: Theme.of(context).appBarTheme.backgroundColor,
        borderRadius: BorderRadius.circular(32),
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
          disabledBorder: InputBorder.none,
          border: InputBorder.none,
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
