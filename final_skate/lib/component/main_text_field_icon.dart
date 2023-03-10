import 'package:flutter/material.dart';

import 'package:final_skate/common/theme.dart';

class MainTextField extends StatelessWidget {
  const MainTextField({
    Key? key,
    required this.hintText,
    this.onediting,
    this.onchange,
    this.icon,
    this.textEditingController,
    this.validatorText,
    this.invalidText,
    required this.prefixIconExist,
    this.sizedBox = 32,
    this.minLines = 1,
    this.maxLines = 1,
    this.obscureText = false,
  }) : super(key: key);

  final String hintText;
  final IconData? icon;
  final TextEditingController? textEditingController;
  final String? validatorText;
  final String? invalidText;
  final void Function()? onediting;
  final bool prefixIconExist;
  final double? sizedBox;
  final int? minLines;
  final int? maxLines;
  final bool? obscureText;
  final void Function(String)? onchange;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: sizedBox,
        ),
        TextFormField(
          style: const TextStyle(color: Colors.white),
          onChanged: onchange,
          onEditingComplete: onediting,
          obscureText: obscureText!,
          autofocus: false,
          controller: textEditingController,
          validator: (val) => val!.isEmpty
              ? validatorText
              : !val.contains('@') || !val.contains('.')
                  ? invalidText
                  : null,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: white,
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey[300],
              fontFamily: 'Poppins',
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: white),
            ),
          ),
        ),
      ],
    );
  }
}
