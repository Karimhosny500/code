import 'package:flutter/material.dart';

import 'package:final_skate/common/theme.dart';

class MainTextFieldNoIcon extends StatelessWidget {
  const MainTextFieldNoIcon({
    Key? key,
    required this.hintText,
    this.icon,
    this.textEditingController,
    this.validatorText,
    this.invalidText,
    required this.prefixIconExist,
    this.sizedBox = 32,
    this.minLines = 1,
    this.maxLines = 1,
  }) : super(key: key);

  final String hintText;
  final IconData? icon;
  final TextEditingController? textEditingController;
  final String? validatorText;
  final String? invalidText;
  final bool prefixIconExist;
  final double? sizedBox;
  final int? minLines;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 1,
        ),
        TextFormField(
          // style: const TextStyle(color: Colors.white),
          autofocus: true,
          controller: textEditingController,
          validator: (val) => val!.isEmpty
              ? validatorText
              : !val.contains('@') || !val.contains('.')
                  ? invalidText
                  : null,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle:
                const TextStyle(fontFamily: 'Poppins', color: Colors.white),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: white),
            ),
          ),
        ),
      ],
    );
  }
}
