import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;
  const Editor(
      {super.key, this.controlador, this.rotulo, this.dica, this.icone});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          iconColor: const Color.fromARGB(255, 128, 51, 244),
          labelText: rotulo,
          hintText: dica,
          hintStyle: const TextStyle(fontSize: 24.0),
          labelStyle: const TextStyle(fontSize: 24.0),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
