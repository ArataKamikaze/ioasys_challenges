import 'package:flutter/material.dart';
import '../styles.dart';

// ignore: must_be_immutable
class MainButton extends StatelessWidget {
  var text;
  Function() onPressed;
  var color;
  var shadowColor;

  MainButton({
    Key? key,
    required this.onPressed,
    required this.color,
    Color shadowColor = const Color(0x4C00FFF0),
    String text = "",
  }) : super(key: key) {
    this.text = text;
    this.shadowColor = shadowColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //=============================================\\
      //Size and color of button
      width: MediaQuery.of(context).size.width - 100,
      height: MediaQuery.of(context).size.width / 8,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 1, 232, 240),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        boxShadow: [
          CustomBoxShadow(color: shadowColor),
        ],
      ),
      //=============================================\\
      //

      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
      ),
    );
  }
}
