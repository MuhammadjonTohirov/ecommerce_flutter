import 'package:ecommerce/widgets/common/widgets/drop_down_search/dropdown_search.dart';
import 'package:ecommerce/widgets/common/widgets/fields/field_container.dart';
import 'package:ecommerce/widgets/common/widgets/fields/price_field.dart';
import 'package:flutter/material.dart';

class DropDownTextField extends StatefulWidget {
  late final List<String> sortTypes;
  late final String hintText;
  DropDownTextField(this.sortTypes, this.hintText, {Key? key})
      : super(key: key);
  @override
  State<DropDownTextField> createState() => _DropDownTextFieldState();
}

class _DropDownTextFieldState extends State<DropDownTextField> {
  @override
  Widget build(BuildContext context) {
    return FieldContainer(
      DropdownSearch<String>(
        mode: Mode.MENU,
        showSelectedItems: true,
        items: widget.sortTypes,
        dropdownSearchDecoration: InputDecoration(
          hintText: widget.hintText,
          border: InputBorder.none,
        ),
        popupItemDisabled: (String s) => s.contains("Disabled"),
        onChanged: print,
        maxHeight: widget.sortTypes.length * 50,
        selectedItem: widget.sortTypes.first,
      ),
      "Sort by",
    );
  }
}
