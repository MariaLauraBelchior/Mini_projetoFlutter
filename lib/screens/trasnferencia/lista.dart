import 'package:my_app/models/transferencia.dart';
import 'package:my_app/screens/trasnferencia/formulario.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Transferências';

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencias = [];
  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar,
            style: TextStyle(
              color: Colors.white,
            )),
        backgroundColor: const Color.fromARGB(255, 128, 51, 244),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 185, 103, 232),
        onPressed: () {
          Navigator.push<Transferencia>(context,
              MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          })).then((transferenciaRecebida) => _atualiza(transferenciaRecebida));
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _atualiza(Transferencia? transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      setState(() {
        widget._transferencias.add(transferenciaRecebida);
      });
    }
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;
  const ItemTransferencia(this._transferencia, {super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on,
            color: Color.fromARGB(255, 128, 51, 244)),
        title: Text(_transferencia.valor.toString()), //Dinheiro
        subtitle: Text(_transferencia.numeroConta.toString()), //Conta
      ),
    );
  }
}
