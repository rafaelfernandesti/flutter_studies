class Contact{
  final int id;
  final String nome;
  final int conta;

  Contact(this.id, this.nome, this.conta);

  @override
  String toString() {
    return 'Contacts{nome: $nome, conta: $conta}';
  }
}