import 'package:flutter/material.dart';
import 'package:prova_flutter/components/papel.dart';
import 'package:prova_flutter/components/pedra.dart';
import 'package:prova_flutter/components/tesoura.dart';
import 'dart:math';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _escolhaUsuario = '';
  String _escolhaComputador = '';
  String _resultado = '';
  bool _carregando = false;

  int _pontuacaoUsuario = 0;
  int _pontuacaoComputador = 0;

  final List<String> _opcoes = ['pedra', 'papel', 'tesoura'];

  // Função _obterImagemComputador:
  // Retorna a URL da imagem correspondente à escolha do computador.
  String _obterImagemComputador() {
    switch (_escolhaComputador) {
      case 'pedra':
        return 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAKa3dsh-9feVInKjN1U1h7MKPvYmml2pSoA&s';
      case 'papel':
        return 'https://cdn-icons-png.flaticon.com/512/827/827980.png';
      case 'tesoura':
        return 'https://static.thenounproject.com/png/341564-200.png';
      default:
        return '';
    }
  }

  // Função _fazerEscolha:
  // Recebe a escolha do usuário e gera uma escolha aleatória para o computador.
  // Compara as escolhas e determina o resultado do jogo.
  // Atualiza o estado do widget com as novas escolhas e o resultado.
  void _fazerEscolha(String escolha) {
    setState(() {
      _carregando = true;
      _escolhaUsuario = escolha;
      _escolhaComputador = '';
      _resultado = '';
    });

    Future.delayed(Duration(milliseconds: 800), () {
      final random = Random();
      final escolhaComputador = _opcoes[random.nextInt(_opcoes.length)];

      String resultado;
      if (escolha == escolhaComputador) {
        resultado = 'Empate!';
      } else if ((escolha == 'pedra' && escolhaComputador == 'tesoura') ||
          (escolha == 'papel' && escolhaComputador == 'pedra') ||
          (escolha == 'tesoura' && escolhaComputador == 'papel')) {
        resultado = 'Você ganhou!';
        _pontuacaoUsuario++;
      } else {
        resultado = 'Você perdeu!';
        _pontuacaoComputador++;
      }

      setState(() {
        _escolhaComputador = escolhaComputador;
        _resultado = resultado;
        _carregando = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Center(
                child: Text(
                  'Sua jogada',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _fazerEscolha('pedra'),
                    child: Pedra(),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _fazerEscolha('papel'),
                    child: Papel(),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _fazerEscolha('tesoura'),
                    child: Tesoura(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Center(
                child: Text(
                  'Jogada do computador:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(19, 158, 158, 158),
                      border: Border.all(color: const Color.fromARGB(40, 158, 158, 158)),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: _carregando
                        ? SpinKitSpinningCircle	(
                            color: Colors.black,
                            size: 50.0,
                          )
                        : _escolhaComputador.isNotEmpty
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  _obterImagemComputador(),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Center(
                                child: Text(
                                  'Escolha',
                                  style: TextStyle(fontSize: 16, color: Colors.black),
                                ),
                              ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Center(
                child: Text(
                  'Resultado: $_resultado',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 150,
              decoration: BoxDecoration(
                color: const Color.fromARGB(24, 158, 158, 158),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(55),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Placar',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Você: $_pontuacaoUsuario',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'X',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Computador: $_pontuacaoComputador',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}