import 'package:my_app/components/editor.dart';
import 'package:my_app/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferência';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';
const _rotuloCampoNumeroConta = 'Número da Conta';
const _dicaCampoNumeroConta = '0000';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  FormularioTransferencia({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar, style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 128, 51, 244),
      ),
      body: Column(
        children: <Widget>[
          Editor(
            controlador: _controladorCampoNumeroConta,
            rotulo: _rotuloCampoNumeroConta,
            dica: _dicaCampoNumeroConta,
          ),
          Editor(
              controlador: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              dica: _dicaCampoValor,
              icone: Icons.monetization_on),
          ElevatedButton(
            child: const Text(_textoBotaoConfirmar),
            onPressed: () {
              _criaTransferencia(context, _controladorCampoNumeroConta,
                  _controladorCampoValor);
            },
          ),
        ],
      ),
    );
  }
}

void _criaTransferencia(
    BuildContext context, controladorCampoNumeroConta, controladorCampoValor) {
  final int? numeroConta = int.tryParse(controladorCampoNumeroConta.text);
  final double? valor = double.tryParse(controladorCampoValor.text);
  if (numeroConta != null && valor != null) {
    final transferenciaCriada = Transferencia(valor, numeroConta);
    debugPrint('Criando Transferência');
    debugPrint('$transferenciaCriada');
    Navigator.pop(context, transferenciaCriada);
  }
}
