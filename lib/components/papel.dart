import 'package:flutter/material.dart';

class Papel extends StatelessWidget {
const Papel ({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
return Expanded(
child: Container(
decoration: BoxDecoration(
  image: DecorationImage(image: NetworkImage('https://cdn-icons-png.flaticon.com/512/827/827980.png')),
  shape: BoxShape.circle
),
  margin: EdgeInsets.all(10),
  height: 100,
),
);
}
}