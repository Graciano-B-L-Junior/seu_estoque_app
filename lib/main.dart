import 'package:app_estoque/Telas/home_page.dart';
import 'package:flutter/material.dart';

void main() {
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
