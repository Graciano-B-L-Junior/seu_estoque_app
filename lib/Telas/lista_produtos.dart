import 'package:app_estoque/Auxiliar/firebase_database.dart';
import 'package:flutter/material.dart';

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
        body: FutureBuilder(
            future: BancoDeDados.instance.usuarios.get(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Text("Something went wrong");
              }

              if (snapshot.hasData && !snapshot.data!.exists) {
                return Text("Document does not exist");
              }

              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                return Text(
                    "Full Name: ${data['full_name']} ${data['last_name']}");
              }

              return Text("loading");
            }));
  }
}
