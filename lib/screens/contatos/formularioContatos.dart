import 'package:flutter/material.dart';
import 'package:my_app/models/contatos.dart';
import 'package:my_app/components/editor.dart';

const _tituloAppBar = 'Cadastro de Contatos';
const _rotuloCampoNome = 'Nome';
const _dicaCampoNome = 'Digite o nome completo';
const _rotuloCampoEndereco = 'Endereço';
const _dicaCampoEndereco = 'Digite o endereço';
const _rotuloCampoTelefone = 'Telefone';
const _dicaCampoTelefone = '(00) 00000-0000';
const _rotuloCampoEmail = 'E-mail';
const _dicaCampoEmail = 'exemplo@email.com';
const _rotuloCampoCpf = 'CPF';
const _dicaCampoCpf = '000.000.000-00';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioContatos extends StatelessWidget {
  final TextEditingController _controladorCampoNome = TextEditingController();
  final TextEditingController _controladorCampoEndereco =
      TextEditingController();
  final TextEditingController _controladorCampoTelefone =
      TextEditingController();
  final TextEditingController _controladorCampoEmail = TextEditingController();
  final TextEditingController _controladorCampoCpf = TextEditingController();

  FormularioContatos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          _tituloAppBar,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 128, 51, 244),
      ),
      body: Column(
        children: <Widget>[
          Editor(
            controlador: _controladorCampoNome,
            rotulo: _rotuloCampoNome,
            dica: _dicaCampoNome,
          ),
          Editor(
            controlador: _controladorCampoEndereco,
            rotulo: _rotuloCampoEndereco,
            dica: _dicaCampoEndereco,
          ),
          Editor(
            controlador: _controladorCampoTelefone,
            rotulo: _rotuloCampoTelefone,
            dica: _dicaCampoTelefone,
          ),
          Editor(
            controlador: _controladorCampoEmail,
            rotulo: _rotuloCampoEmail,
            dica: _dicaCampoEmail,
          ),
          Editor(
            controlador: _controladorCampoCpf,
            rotulo: _rotuloCampoCpf,
            dica: _dicaCampoCpf,
          ),
          ElevatedButton(
            child: const Text(_textoBotaoConfirmar),
            onPressed: () {
              _criaContato(
                context,
                _controladorCampoNome,
                _controladorCampoEndereco,
                _controladorCampoTelefone,
                _controladorCampoEmail,
                _controladorCampoCpf,
              );
            },
          ),
        ],
      ),
    );
  }

  void _criaContato(
    BuildContext context,
    TextEditingController controladorCampoNome,
    TextEditingController controladorCampoEndereco,
    TextEditingController controladorCampoTelefone,
    TextEditingController controladorCampoEmail,
    TextEditingController controladorCampoCpf,
  ) {
    final String nome = controladorCampoNome.text;
    final String endereco = controladorCampoEndereco.text;
    final String telefone = controladorCampoTelefone.text;
    final String email = controladorCampoEmail.text;
    final String cpf = controladorCampoCpf.text;

    if (nome.isNotEmpty &&
        endereco.isNotEmpty &&
        telefone.isNotEmpty &&
        email.isNotEmpty &&
        cpf.isNotEmpty) {
      final contatoCriado = Contatos(nome, endereco, telefone, email, cpf);
      debugPrint('Criando Contato: $contatoCriado');
      Navigator.pop(context, contatoCriado); // Retorna o contato criado
    }
  }
}
