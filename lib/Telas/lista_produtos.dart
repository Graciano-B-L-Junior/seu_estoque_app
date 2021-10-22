import 'package:app_estoque/Auxiliar/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListaProdutos extends StatefulWidget {
  const ListaProdutos({Key? key}) : super(key: key);

  @override
  _ListaProdutosState createState() => _ListaProdutosState();
}

class _ListaProdutosState extends State<ListaProdutos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<QuerySnapshot>(
            future: BancoDeDados.instance.produtos.get(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("Something went wrong");
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          subtitle: Text(
                              "Quantidade: ${snapshot.data!.docs[index]['quantidade']}"),
                          title: Text(
                              "${snapshot.data!.docs[index]['nomeProduto']}"),
                          leading: FaIcon(
                            FontAwesomeIcons.box,
                            color: Colors.yellow.shade600,
                          ),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: FaIcon(
                                FontAwesomeIcons.penAlt,
                                color: Colors.yellow.shade600,
                              )),
                        ),
                      );
                    });
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
