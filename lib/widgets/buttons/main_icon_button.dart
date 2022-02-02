import 'package:flutter/material.dart';
import '../styles.dart';

// ignore: must_be_immutable
class MainIconButton extends StatelessWidget {
  Icon icon;
  Function() onPressed;
  Color color;
  Color shadowColor;
  Color backgroundColor;
  double width;

  MainIconButton(
      {Key? key,
      required this.onPressed,
      required this.color,
      this.backgroundColor = const Color.fromARGB(255, 1, 232, 240),
      this.shadowColor = const Color(0x4C00FFF0),
      this.icon = const Icon(Icons.question_answer),
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
        child: icon,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(),
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
      ),
    );
  }
}
