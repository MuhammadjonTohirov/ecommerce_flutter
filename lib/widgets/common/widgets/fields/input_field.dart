// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ecommerce/helpers/colors.dart';
import 'package:ecommerce/widgets/common/widgets/fields/field_container.dart';

class InputField extends StatefulWidget {
  late final TextEditingController controller;
  late final String hint;
  late final String placeholder;
  late bool isPassword = false;

  InputField(this.controller, this.hint, this.placeholder,
      {Key? key, this.isPassword = false});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return FieldContainer(
        TextField(
          obscureText: widget.isPassword,
          controller: this.widget.controller,
          onTap: () {},
          inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
          decoration: InputDecoration(
            hintText: widget.placeholder,
            hintStyle: TextStyle(color: ColorPack.secondaryText.withAlpha(120)),
            border: InputBorder.none,
          ),
        ),
        widget.hint);
  }
}
