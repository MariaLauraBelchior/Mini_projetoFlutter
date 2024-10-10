import 'package:flutter/material.dart';
import 'package:my_app/screens/trasnferencia/lista.dart';
import 'package:my_app/screens/contatos/listaContatos.dart';

void main() => runApp(BankApp());

class BankApp extends StatelessWidget {
  const BankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _indiceAtual = 0; // Controla a tela atual

  final List<Widget> _telas = [
    ListaTransferencia(), // Tela de Transferências
    ListaContatos(), // Tela de Contatos (criar a tela ListaContatos)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_indiceAtual == 0 ? 'Transferências' : 'Contatos'),
      ),
      body: _telas[_indiceAtual], // Mostra a tela de acordo com o índice
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual, // Índice da tela atual
        onTap: (index) {
          setState(() {
            _indiceAtual = index; // Atualiza o índice para mudar de tela
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Transferências',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Contatos',
          ),
        ],
      ),
    );
  }
}
