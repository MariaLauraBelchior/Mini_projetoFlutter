class Contatos {
  final String nome;
  final String endereco;
  final String telefone;
  final String email;
  final String CPF;

  Contatos(this.nome, this.endereco, this.telefone, this.email, this.CPF);

  @override
  String toString() {
    return 'Contatos{Nome: $nome, endereço: $endereco, Telefone: $telefone, E-mail: $email, CPF: $CPF}';
  }
}
