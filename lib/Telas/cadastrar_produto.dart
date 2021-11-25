import 'dart:io';
import 'package:app_estoque/Auxiliar/camera_list.dart';
import 'package:app_estoque/Auxiliar/firebase_database.dart';
import 'package:app_estoque/Telas/tela_auxiliar/photo.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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

  List<CameraDescription> cameras = [];

  XFile foto = XFile("");

  bool isFirst = true;

  Widget mostraFoto() {
    if (foto.path == "" || foto.path.isEmpty) {
      return Container();
    } else {
      return Container(
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(60.0),
          child: Image.file(
            File(foto.path),
            fit: BoxFit.fill,
            width: 100,
            height: 100,
          ),
        ),
      );
    }
  }

  void cadastrarProduto() async {
    // Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState!.validate() == false) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos corretamente')),
      );
    } else {
      String custo = precoCusto.text.replaceAll(RegExp(r'[,]'), '.');
      String venda = precoVenda.text.replaceAll(RegExp(r'[,]'), '.');
      if (foto.path.isEmpty || foto.path == "") {
        await BancoDeDados.instance.adicionarProduto(
            categoria.text,
            nomeProduto.text,
            double.parse(custo),
            double.parse(venda),
            int.parse(quantidade.text));
      } else {
        await BancoDeDados.instance.adicionarProdutoComFoto(
            categoria.text,
            nomeProduto.text,
            double.parse(custo),
            double.parse(venda),
            int.parse(quantidade.text),
            foto.path);
      }
      await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Atenção"),
              content: Text("O produto foi cadastrado com sucesso!"),
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
  }

  void tirarFoto() async {
    var picture = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                photo(camera: ListaCameras.cams.first)));
    setState(() {
      foto = picture;
      print(foto.path);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final List<MaskTextInputFormatter> _mascara = [
    MaskTextInputFormatter(mask: '###,##', filter: {"#": RegExp(r'[0-9]')}),
  ];
  @override
  void dispose() {
    nomeProduto.dispose();
    precoCusto.dispose();
    precoVenda.dispose();
    quantidade.dispose();
    categoria.dispose();
    // TODO: implement dispose
    super.dispose();
  }

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
                    textAlign: TextAlign.left,
                    controller: precoCusto,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CentavosInputFormatter()
                    ],
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: "R\$ 00,00",
                        icon: FaIcon(FontAwesomeIcons.moneyBillAlt),
                        labelText: "Preço de custo"),
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'Preencha o campo corretamente'
                          : null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    controller: precoVenda,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CentavosInputFormatter()
                    ],
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: "R\$ 00,00",
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
                    decoration: const InputDecoration(
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
                    decoration: const InputDecoration(
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
                mostraFoto(),
                Container(
                  alignment: Alignment.center,
                  child: IconButton(
                      onPressed: tirarFoto,
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
                      onPressed: cadastrarProduto,
                      child: const Text("Cadastrar produto")),
                )
              ],
            ),
          )),
        ));
  }
}
