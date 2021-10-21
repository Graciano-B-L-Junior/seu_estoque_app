import 'package:app_estoque/Telas/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(color: Colors.yellow.shade600)),
        backgroundColor: Colors.white70,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white, foregroundColor: Colors.black),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.yellow.shade600,
        )),
    home: const Home(),
  ));
}
