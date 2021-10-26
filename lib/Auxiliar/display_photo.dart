import 'dart:io';

import 'package:flutter/material.dart';

class Displayfoto extends StatelessWidget {
  final String imagePath;
  const Displayfoto({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Foto Tirada')),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.file(File(imagePath)),
      ),
    );
  }
}
