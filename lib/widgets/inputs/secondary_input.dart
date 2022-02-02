import 'package:flutter/material.dart';
import '../styles/box_shadow.dart';

class SecondaryInput extends StatelessWidget {
  late final label;
  late final controller;
  late final keyboardType;
  late final onChanged;
  late final onSubmited;
  late final textInputAction;
  late final hint;
  late final width;
  late final backgroundColor;
  late final textColor;
  late final obscure;
  late final leftButton;
  late final maxLenght;
  late final padding;
  late final shadowColor;

  SecondaryInput(
      {Key? key,
      label = "",
      context,
      required TextEditingController controller,
      TextInputType keyboardType = TextInputType.text,
      Function(String)? onChanged,
      Function(String)? onSubmited,
      TextInputAction textInputAction = TextInputAction.next,
      String hint = "Type here",
      double width = 0,
      Color backgroundColor = Colors.white,
      Color textColor = Colors.black,
      bool obscure = false,
      bool leftButton = false,
      int maxLenght = 0,
      Color shadowColor = const Color(0x4c000000),
      double padding = 16})
      : super(key: key) {
    this.label = label;
    this.controller = controller;
    this.keyboardType = keyboardType;
    this.onChanged = onChanged;
    this.onSubmited = onSubmited;
    this.textInputAction = textInputAction;
    this.hint = hint;
    this.width = width;
    this.backgroundColor = backgroundColor;
    this.textColor = textColor;
    this.obscure = obscure;
    this.leftButton = leftButton;
    this.maxLenght = maxLenght;
    this.padding = padding;
    this.shadowColor = shadowColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (width == 0) ? MediaQuery.of(context).size.width / 1.17582 : width,
      decoration: BoxDecoration(
        boxShadow: [CustomBoxShadow(color: shadowColor)],
      ),
      child: TextFormField(
        maxLength: (maxLenght == 0) ? null : maxLenght,
        controller: controller,
        onChanged: onChanged,
        onFieldSubmitted: onSubmited,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        obscureText: obscure,
        style: TextStyle(
          fontSize: 16,
          color: textColor,
          fontWeight: FontWeight.normal,
          fontFamily: "Roboto",
        ),
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(
            borderRadius: leftButton
                ? BorderRadius.only(
                    topLeft: Radius.circular(13),
                    bottomLeft: Radius.circular(13))
                : BorderRadius.circular(13.0),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          hintStyle: TextStyle(color: textColor),
          filled: true,
          contentPadding: EdgeInsets.all(padding),
          fillColor: backgroundColor,
          hintText: hint,
        ),
      ),
    );
  }
}
