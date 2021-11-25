import 'package:cloud_firestore/cloud_firestore.dart';

class BancoDeDados {
  static BancoDeDados instance = BancoDeDados();

  final CollectionReference _usuarios =
      FirebaseFirestore.instance.collection('usuarios');
  final CollectionReference _produtos = FirebaseFirestore.instance
      .collection('usuarios')
      .doc('glaeda')
      .collection('produto');

  CollectionReference get usuarios {
    return _usuarios;
  }

  CollectionReference get produtos {
    return _produtos;
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

  Future<void> adicionarProdutoComFoto(
      String categoria,
      String nomeProduto,
      double precoCusto,
      double precoVenda,
      int quantidade,
      String caminhoFoto) {
    return _usuarios
        .doc('glaeda')
        .collection('produto')
        .add({
          'categoria': categoria,
          'nomeProduto': nomeProduto,
          'precoCusto': precoCusto,
          'precoVenda': precoVenda,
          'quantidade': quantidade,
          'foto': caminhoFoto
        })
        .then((value) {})
        .catchError((erro) {});
  }
}
