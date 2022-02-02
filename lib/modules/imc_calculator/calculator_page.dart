import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imc_calculator/widgets/styles/box_shadow.dart';
import 'package:rive/rive.dart';
import '../../widgets/widgets.dart';
import 'calculator_page_controller.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage(BuildContext context, {Key? key}) : super(key: key);
  static const String routeName = "/CalculatorPage";
  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  //controllers
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  late RiveAnimationController _menuAnimationController;
  CalculatorPageController mainController = CalculatorPageController();
  //
  //dispose of controllers
  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  //vars
  var calculatedOutput = "";
  var outputColor = Colors.white;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  //
  //
  @override
  void initState() {
    super.initState();
    _menuAnimationController = OneShotAnimation('go', autoplay: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: mainDrawer(),
      appBar: PreferredSize(
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              CustomBoxShadow(color: Color(0x7f00FFF0)),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(13),
            ),
          ),
          child: AppBar(
            toolbarHeight: 60,
            elevation: 0.0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(18),
              ),
            ),
            leading: GestureDetector(
              onTapDown: (_) {
                mainController.playOneShotAnimation(_menuAnimationController);
                Future.delayed(const Duration(seconds: 1),
                    () => _scaffoldKey.currentState?.openDrawer());
              },
              child: Container(
                padding: const EdgeInsets.all(7),
                height: 30,
                width: 30,
                child: RiveAnimation.asset(
                  "assets/icons/ioasys.riv",
                  fit: BoxFit.fitWidth,
                  controllers: [_menuAnimationController],
                ),
              ),
            ),
            title: const Text("Calculadora de IMC"),
            backgroundColor: const Color.fromARGB(255, 1, 232, 240),
          ),
        ),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              Text(
                calculatedOutput,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: outputColor,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              MainInput(
                controller: weightController,
                label: "Peso (Kg)",
                width: 300.0,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 30),
              MainInput(
                controller: heightController,
                label: "Altura (M)",
                width: 300.0,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 40),
              MainButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Map calcOutput = mainController.calculate(
                      context: context,
                      weightController: weightController,
                      heightController: heightController,
                    );
                    setState(() {
                      calculatedOutput = calcOutput['status'];
                      outputColor = calcOutput['color'];
                    });
                  }
                },
                /*mainController.calculate(
                    context: context,
                    weightController: _weightController,
                    heightController: _heightController),*/
                text: "calcular",
                color: const Color(0xFFffffff),
                shadowColor: const Color(0x7f00FFF0),
              )
            ],
          ),
        ),
      ),
    );
  }

  void returnHomePage() {
    Navigator.pop(context);
  }
}
