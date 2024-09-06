import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';  // Importando o pacote
import 'package:prova_flutter/views/home_page.dart';
import 'package:prova_flutter/components/iniciar.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    ),
  );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _isLoading = false;

  void _startLoading() {
    setState(() {
      _isLoading = true;
    });

    // Simula um carregamento de 3 segundos
    Future.delayed(Duration(seconds: 1), () {  // Alterando para 3 segundos
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).push(_createRoute());
    });
  }

  Route _createRoute() {
    return PageRouteBuilder(
      transitionDuration: Duration(seconds: 1), // Duração da animação de fade
      pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return FadeTransition(
          opacity: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading
            ? SpinKitThreeBounce(  // Substituindo o CircularProgressIndicator
                color: Colors.black,
                size: 50.0,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: _startLoading,
                    child: Iniciar(),
                  ),
                ],
              ),
      ),
    );
  }
}