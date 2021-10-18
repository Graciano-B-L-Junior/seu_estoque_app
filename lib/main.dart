import 'package:app_estoque/Telas/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        backgroundColor: Colors.white70,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white, foregroundColor: Colors.black),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.yellow.shade500)),
    home: const Home(),
  ));
}
