import 'package:flutter/material.dart';
import 'modules/task_list/tasks_page.dart';
import 'modules/login_page.dart';
import 'modules/imc_calculator/calculator_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder>{
      CalculatorPage.routeName: (BuildContext context) =>
          CalculatorPage(context),
      TasksPage.routeName: (BuildContext context) => TasksPage(context),
      LoginPage.routeName: (BuildContext context) => LoginPage(context),
    };

    return MaterialApp(
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 1, 232, 240)),
      title: 'IMCoasys',
      debugShowCheckedModeBanner: false,
      initialRoute: LoginPage.routeName,
      routes: routes,
    );
  }
}
