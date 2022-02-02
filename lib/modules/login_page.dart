import 'package:flutter/material.dart';
import 'imc_calculator/calculator_page.dart';
import '../widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage(BuildContext context, {Key? key}) : super(key: key);
  static const String routeName = "/";
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();

  @override
  void dispose() {
    _userController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 232, 240),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
            ),
            Container(
              padding: const EdgeInsets.only(left: 120, right: 120),
              child: Image.network(
                  'https://cdn.discordapp.com/attachments/248537186943631361/933517743704125450/unknown.png'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: Text(
                  "Seja bem vindo!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SecondaryInput(
              width: 350,
              shadowColor: Color(0x4c025B56),
              padding: 20,
              controller: _userController,
              hint: "Usuário",
            ),
            SizedBox(
              height: 20,
            ),
            SecondaryInput(
              width: 350,
              shadowColor: Color(0x4c025B56),
              padding: 20,
              controller: _passController,
              hint: "Senha",
            ),
            const SizedBox(
              height: 30,
            ),
            MainButton(
              width: 350,
              onPressed: /*() {
                Navigator.pushNamed(context, TestePage.routeName);
              }*/
                  _login,
              color: Colors.white,
              backgroundColor: Colors.black,
              text: "ENTRAR",
            ),
          ],
        ),
      ),
    );
  }

  void _login() {
    Navigator.pushNamed(context, CalculatorPage.routeName);
  }
}
