import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class CalculatorPageController {
  void playOneShotAnimation(RiveAnimationController controller) {
    if (controller.isActive == false) {
      controller.isActive = true;
    }
  }

  Map<dynamic, dynamic> calculate(
      {context, required weightController, required heightController}) {
    var weight = double.parse(weightController.text);
    var height = double.parse(heightController.text);
    var imc = weight / (height * height);
    var status = "aaaaa";
    var textColor = const Color(0xff01f00b);
    if (imc <= 18.5) {
      status = "Magreza";
      textColor = const Color(0xffCFA305);
    } else if (imc > 18.5 && imc <= 24.9) {
      status = "Peso Normal";
      textColor = const Color(0xff01f00b);
    } else if (imc > 24.9 && imc <= 30) {
      status = "Sobrepeso";
      textColor = const Color(0xffffb61a);
    } else {
      status = "Obeso";
      textColor = const Color(0xfffe4a49);
    }
    return {
      "status": status + ', IMC = ${imc.toStringAsFixed(2)}.',
      'color': textColor
    };
  }
}
