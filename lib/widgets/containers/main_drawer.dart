import 'package:flutter/material.dart';

class mainDrawer extends StatelessWidget {
  mainDrawer({
    Key? key,
  }) : super(key: key);

  final List<Map<String, String>> pages = [
    {
      'name': 'calculadora de IMC',
      'route': '/CalculatorPage',
    },
    {
      'name': 'Tarefas',
      'route': '/TaskPage',
    },
    {
      'name': 'Configurações',
      'route': '/TaskPage',
    },
    {
      'name': 'Sair',
      'route': '/',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xff01E8F0),
              width: double.infinity,
              height: 200,
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Color(0xff01E8F0),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://upload.wikimedia.org/wikipedia/commons/a/a6/Ioasys_logo.png"),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Usuario',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: double.maxFinite,
              child: ListView.builder(
                itemCount: pages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 60,
                    width: 100,
                    color: Colors.transparent,
                    child: ListTile(
                      title: Text(pages[index]['name']!),
                      onTap: () {
                        Navigator.pushNamed(context, pages[index]['route']!);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
