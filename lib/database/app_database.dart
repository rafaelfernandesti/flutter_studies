import 'package:flutter_files/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'bytebank.db');
  //final String path = join(await getDatabasesPath(), 'bytebank.db'); // MESMO CÓDIGO DAS DUAS LINHAS ACIMA
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute('CREATE TABLE tb_contacts('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'account_number INTEGER)');
    },
    version: 1,
    //onDowngrade: onDatabaseDowngradeDelete, //código usado para apagar o BD após realizar downgrade
  );
}

Future<int> save(Contact contact) async {
  final Database db = await createDatabase();
  Map(); //qual a utilidade desta linha?
  final Map<String, dynamic> contactMap = Map();
  //contactMap['id'] = contact.id; linha não utilizada para geração automática de ID
  contactMap['name'] = contact.nome;
  contactMap['account_number'] = contact.conta;
  return db.insert('tb_contacts', contactMap);
}

Future<List<Contact>> findAll() async {
  final Database db = await createDatabase();
  final List<Map<String, dynamic>> resultado = await db.query('tb_contacts');
  final List<Contact> listaContatos = [];
  for (Map<String, dynamic> row in resultado) {
    final Contact contact = Contact(
      row['id'],
      row['name'],
      row['account_number'],
    );
    listaContatos.add(contact);
  }
  return listaContatos;
}
