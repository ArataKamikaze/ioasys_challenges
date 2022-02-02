import 'package:flutter/material.dart';

class MainInput extends StatelessWidget {
  late final hint;
  late final label;
  late final keyboardType;
  late final width;
  MainInput({
    Key? key,
    hint = "",
    label = "",
    keyboardType = TextInputType.number,
    required this.controller,
    width = 300,
  }) : super(key: key) {
    this.hint = hint;
    this.label = label;
    this.keyboardType = keyboardType;
    this.width = width;
  }

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      child: TextFormField(
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'Text está vazio';
          }
          return null;
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: -10, bottom: 20),
          hintText: "",
          label: Text(label),
        ),
        keyboardType: keyboardType,
        controller: controller,
      ),
    );
  }
}
