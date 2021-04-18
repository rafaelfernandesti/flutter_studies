class Contact{
  final String nome;
  final int conta;

  Contact(this.nome, this.conta);

  @override
  String toString() {
    return 'Contacts{nome: $nome, conta: $conta}';
  }
}