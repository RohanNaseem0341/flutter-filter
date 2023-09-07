import 'package:flutter/material.dart';
import 'package:project/Screens/1stScreen.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'HomePage',
      debugShowCheckedModeBanner: false,
      home: screen1(),
    );
  }
}
