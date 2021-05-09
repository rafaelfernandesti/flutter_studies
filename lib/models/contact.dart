class Contact{
  final int id;
  final String nome;
  final int conta;

  Contact(this.id, this.nome, this.conta);

  Contact.fromJson(Map<String,dynamic> json) :
      id = json['id'],
      nome = json['nome'],
      conta = json['conta'];

  Map<String,dynamic> toJson() => {
    'name': nome,
    'accountNumber': conta,
  };

  @override
  String toString() {
    return 'Contatos {id: $id, nome: $nome, conta: $conta}';
  }


}