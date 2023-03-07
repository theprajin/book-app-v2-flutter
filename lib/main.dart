import 'package:flutter/material.dart';

import 'package:get/get.dart';

import './view/home_screen.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book App',
      theme: ThemeData(
        colorSchemeSeed: const Color.fromARGB(255, 15, 83, 19),
      ),
      home: const HomeScreen(),
    );
  }
}
