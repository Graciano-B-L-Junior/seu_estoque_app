import 'package:app_estoque/Telas/cadastrar_produto.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indiceBottomNavBar = 1;
  List telas = [CadastrarProduto()];
  Card retornaCarta(String tituloCarta, IconData icone, int indiceTela) {
    return Card(
      child: InkWell(
        splashColor: Colors.yellow,
        onTap: () {},
        child: Container(
          width: MediaQuery.of(context).size.width * 0.43,
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icone),
              SizedBox(
                height: 20,
              ),
              Text(tituloCarta)
            ],
          ),
        ),
      ),
    );
  }

  Card retornaCartaFA(String tituloCarta, IconData icone, int indiceTela) {
    return Card(
      child: InkWell(
        splashColor: Colors.yellow,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => telas[indiceTela]));
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.43,
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                icone,
                size: 40,
                color: Colors.yellow.shade600,
              ),
              SizedBox(
                height: 20,
              ),
              Text(tituloCarta)
            ],
          ),
        ),
      ),
    );
  }

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
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    retornaCartaFA("Seu estoque", FontAwesomeIcons.box, 0),
                    retornaCartaFA(
                        "Cadastrar produto", FontAwesomeIcons.boxOpen, 0)
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    retornaCartaFA(
                        "Atualizar produto", FontAwesomeIcons.penAlt, 0),
                    retornaCartaFA("Deletar produto", FontAwesomeIcons.trash, 0)
                  ],
                ),
              ],
            ),
          )),
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
