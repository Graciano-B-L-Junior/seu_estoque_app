import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CadastrarProduto extends StatefulWidget {
  const CadastrarProduto({Key? key}) : super(key: key);

  @override
  _CadastrarProdutoState createState() => _CadastrarProdutoState();
}

class _CadastrarProdutoState extends State<CadastrarProduto> {
  final _formKey = GlobalKey<FormState>();
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
                    decoration: InputDecoration(
                        icon: FaIcon(FontAwesomeIcons.box),
                        labelText: "Nome do produto"),
                    validator: (String? value) {
                      return (value != null || value!.isEmpty)
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
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: FaIcon(FontAwesomeIcons.moneyBillAlt),
                        labelText: "Preço de custo"),
                    validator: (String? value) {
                      return (value != null || value!.isEmpty)
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
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: FaIcon(FontAwesomeIcons.solidMoneyBillAlt),
                        labelText: "Preço de venda"),
                    validator: (String? value) {
                      return (value != null || value!.isEmpty)
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
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: FaIcon(FontAwesomeIcons.cubes),
                        labelText: "Quantidade do produto"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    decoration: InputDecoration(
                        icon: FaIcon(FontAwesomeIcons.tag),
                        labelText: "Qual a categoria do produto"),
                  ),
                ),
                SizedBox(
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
                SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text("Toque na camera para tirar foto do produto"),
                ),
                SizedBox(
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
                      onPressed: () {},
                      child: Text("Cadastrar produto")),
                )
              ],
            ),
          )),
        ));
  }
}
