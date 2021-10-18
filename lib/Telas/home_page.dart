import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indiceBottomNavBar = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Seu Stock",
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: const <Widget>[
            SizedBox(
              height: 20,
            ),
            Text("Teste")
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2_outlined), label: "Estoque"),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Pesquisa"),
        ],
        currentIndex: indiceBottomNavBar,
        iconSize: 40,
        onTap: (valor) {
          setState(() {
            indiceBottomNavBar = valor;
          });
        },
      ),
    );
  }
}
