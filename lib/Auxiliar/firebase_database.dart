import 'package:cloud_firestore/cloud_firestore.dart';

class BancoDeDados {
  static BancoDeDados instance = BancoDeDados();

  CollectionReference _usuarios =
      FirebaseFirestore.instance.collection('usuarios');

  CollectionReference get usuarios {
    return _usuarios;
  }

  Future<void> adicionarProduto(String categoria, String nomeProduto,
      double precoCusto, double precoVenda, int quantidade) {
    return _usuarios
        .doc('glaeda')
        .collection('produto')
        .add({
          'categoria': categoria,
          'nomeProduto': nomeProduto,
          'precoCusto': precoCusto,
          'precoVenda': precoVenda,
          'quantidade': quantidade,
        })
        .then((value) {})
        .catchError((erro) {});
  }
}
