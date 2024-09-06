import 'package:flutter/material.dart';

class Iniciar extends StatelessWidget {
  const Iniciar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
      ),
      child: Center(
        child: Text(
          'Iniciar',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}