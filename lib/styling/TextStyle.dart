import 'package:flutter/material.dart';

class TextStyle1 extends StatelessWidget {
  const TextStyle1({super.key, required Text child});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 43, left: 30),
          child: Container(),
        ));
  }
}
