import 'package:flutter/material.dart';
import '../styles.dart';

// ignore: must_be_immutable
class MainButton extends StatelessWidget {
  String text;
  Function() onPressed;
  Color color;
  Color shadowColor;
  Color backgroundColor;
  double width;

  MainButton(
      {Key? key,
      required this.onPressed,
      required this.color,
      this.backgroundColor = const Color.fromARGB(255, 1, 232, 240),
      this.shadowColor = const Color(0x4C00FFF0),
      this.text = "",
      this.width = 300})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //=============================================\\
      //Size and color of button
      width: width,
      height: MediaQuery.of(context).size.width / 8,
      decoration: BoxDecoration(
        color: backgroundColor,
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
        child: Text(text,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: color,
            )),
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
      ),
    );
  }
}
