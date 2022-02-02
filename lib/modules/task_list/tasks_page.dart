import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:imc_calculator/modules/task_list/tasks_page_controller.dart';
import 'package:rive/rive.dart';
import '../../widgets/styles.dart';
import '../../widgets/widgets.dart';

class TasksPage extends StatefulWidget {
  static const String routeName = '/TaskPage';

  const TasksPage(context, {Key? key}) : super(key: key);

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  List<Map<String, dynamic>> tasklist = [
    {
      "check": true,
      "task": "fazer a calculadora de IMC",
    },
    {
      "check": false,
      "task": "fazer a lista de tarefas",
    },
    {
      "check": true,
      "task": "fazer o app bunitin",
    },
    {
      "check": false,
      "task": "fazer o conversor de moedas",
    }
  ];

  TasksPageController mainController = TasksPageController();
  late RiveAnimationController _menuAnimationController;
  final taskController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

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
        preferredSize: const Size.fromHeight(kToolbarHeight),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Row(
                children: [
                  MainInput(
                    label: "Tarefa",
                    controller: taskController,
                    width: 260.0,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  MainIconButton(
                    onPressed: () {
                      addTask(taskController);
                    },
                    color: Color(0xFF00D9FF),
                    width: 50,
                    icon: const Icon(Icons.add),
                  )
                ],
              ),
            ),
            (tasklist.isEmpty)
                ? Column(children: [
                    SizedBox(
                      height: 150,
                    ),
                    SizedBox(
                        width: 120,
                        child: Image.asset(
                          'assets/images/dog.png',
                          fit: BoxFit.fitWidth,
                        )),
                    const Text(
                      'Wow, Such Empty',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 25,
                          fontFamily: 'Poppins'),
                    )
                  ])
                : Container(
                    height: double.maxFinite,
                    child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: tasklist.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Dismissible(
                            key: UniqueKey(),
                            direction: DismissDirection.startToEnd,
                            onDismissed: (DismissDirection direction) {
                              tasklist.removeAt(index);
                            },
                            child: Container(
                              height: 80,
                              child: Center(
                                child: Container(
                                  height: 60,
                                  width: 350,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    boxShadow: [
                                      CustomBoxShadow(
                                        color: Color(0x10000000),
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    onTap: () {
                                      setState(() {
                                        tasklist[index]['check'] =
                                            !tasklist[index]['check'];
                                      });
                                    },
                                    contentPadding: EdgeInsets.symmetric(),
                                    title: Text(tasklist[index]['task']),
                                    leading: Checkbox(
                                      value: tasklist[index]['check'],
                                      onChanged: (bool) {},
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
          ],
        ),
      ),
    );
  }

  dynamic addTask(TextEditingController controller) {
    if (controller.text.isNotEmpty) {
      setState(() {
        tasklist.add({"check": false, "task": controller.text});
        controller.text = "";
      });
    }
    return 0;
  }
}
