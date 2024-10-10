import 'package:my_app/models/contatos.dart';
import 'package:my_app/screens/contatos/formularioContatos.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Contatos';

class ListaContatos extends StatefulWidget {
  final List<Contatos> _contatos = [];
  @override
  State<StatefulWidget> createState() {
    return ListaContatosState();
  }
}

class ListaContatosState extends State<ListaContatos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          _tituloAppBar,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 128, 51, 244),
      ),
      body: ListView.builder(
        itemCount: widget._contatos.length,
        itemBuilder: (context, indice) {
          final contato = widget._contatos[indice];
          return ItemContato(contato);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 185, 103, 232),
        onPressed: () {
          // tela de formulário
          Navigator.push<Contatos>(context,
              MaterialPageRoute(builder: (context) {
            return FormularioContatos(); // formulário de contatos
          })).then((contatoRecebido) => _atualizaContato(contatoRecebido));
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _atualizaContato(Contatos? contatoRecebido) {
    if (contatoRecebido != null) {
      setState(() {
        widget._contatos.add(contatoRecebido);
      });
    }
  }
}

class ItemContato extends StatelessWidget {
  final Contatos _contato;
  const ItemContato(this._contato, {super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(
          Icons.person,
          color: Color.fromARGB(255, 128, 51, 244),
        ),
        title: Text(_contato.nome),
        subtitle: Text(_contato.telefone),
      ),
    );
  }
}
