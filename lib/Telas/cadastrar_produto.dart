import 'package:app_estoque/Auxiliar/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CadastrarProduto extends StatefulWidget {
  const CadastrarProduto({Key? key}) : super(key: key);

  @override
  _CadastrarProdutoState createState() => _CadastrarProdutoState();
}

class _CadastrarProdutoState extends State<CadastrarProduto> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nomeProduto = TextEditingController();
  TextEditingController precoCusto = TextEditingController();
  TextEditingController precoVenda = TextEditingController();
  TextEditingController quantidade = TextEditingController();
  TextEditingController categoria = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
              child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Cadastrar Produto",
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    controller: nomeProduto,
                    decoration: InputDecoration(
                        icon: FaIcon(FontAwesomeIcons.box),
                        labelText: "Nome do produto"),
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'Preencha o campo corretamente'
                          : null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    controller: precoCusto,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: FaIcon(FontAwesomeIcons.moneyBillAlt),
                        labelText: "Preço de custo"),
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'Preencha o campo corretamente'
                          : null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    controller: precoVenda,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: FaIcon(FontAwesomeIcons.solidMoneyBillAlt),
                        labelText: "Preço de venda"),
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'Preencha o campo corretamente'
                          : null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    controller: quantidade,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: FaIcon(FontAwesomeIcons.cubes),
                        labelText: "Quantidade do produto"),
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'Preencha o campo corretamente'
                          : null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    controller: categoria,
                    decoration: InputDecoration(
                        icon: FaIcon(FontAwesomeIcons.tag),
                        labelText: "Qual a categoria do produto"),
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'Preencha o campo corretamente'
                          : null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.center,
                  child: IconButton(
                      onPressed: () {},
                      icon: FaIcon(
                        FontAwesomeIcons.camera,
                        size: 35,
                        color: Colors.yellow.shade600,
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text("Toque na camera para tirar foto do produto"),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.yellow.shade600),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)))),
                      onPressed: () async {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate() == false) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Preencha todos os campos corretamente')),
                          );
                        } else {
                          await BancoDeDados.instance.adicionarProduto(
                              categoria.text,
                              nomeProduto.text,
                              double.parse(precoCusto.text),
                              double.parse(precoVenda.text),
                              int.parse(quantidade.text));
                          await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Atenção"),
                                  content: Text(
                                      "O produto foi cadastrado com sucesso!"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Retornar"))
                                  ],
                                );
                              });
                          Navigator.pop(context);
                        }
                      },
                      child: const Text("Cadastrar produto")),
                )
              ],
            ),
          )),
        ));
  }
}
