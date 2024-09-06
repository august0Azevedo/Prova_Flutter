import 'package:flutter/material.dart';

class Pedra extends StatelessWidget {
const Pedra ({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
return Expanded(
child: Container(
decoration: BoxDecoration(
  image: DecorationImage(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAKa3dsh-9feVInKjN1U1h7MKPvYmml2pSoA&s')),
  shape: BoxShape.circle,
),
  margin: EdgeInsets.all(10),
  height: 100,
  
),
);
}
}