import 'package:flutter/material.dart';

class Tesoura extends StatelessWidget {
const Tesoura ({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
return Expanded(
child: Container(
decoration: BoxDecoration(
    image: DecorationImage(image: NetworkImage('https://static.thenounproject.com/png/341564-200.png')),
  shape: BoxShape.circle
),
  margin: EdgeInsets.all(10),
  height: 100,
),
);
}
}