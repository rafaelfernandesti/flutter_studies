import 'package:flutter_files/models/contact.dart';
import 'package:sqflite/sqflite.dart';

import '../app_database.dart';

class ContactDAO {
  static const String sqlContato = 'CREATE TABLE $_tbName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';
  static const String _tbName = 'tb_contacts';
  static const String _name = 'name';
  static const String _id = 'id';
  static const String _accountNumber = 'account_number';

  Future<int> save(Contact contact) async {
    final Database db = await createDatabase();
    Map(); //qual a utilidade desta linha?
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert('tb_contacts', contactMap);
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    //contactMap['id'] = contact.id; linha não utilizada para geração automática de ID
    contactMap[_name] = contact.name;
    contactMap[_accountNumber] = contact.accountNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> resultado = await db.query(_tbName);
    List<Contact> listaContatos = _toList(resultado);
    return listaContatos;
  }

  List<Contact> _toList(List<Map<String, dynamic>> resultado) {
    final List<Contact> listaContatos = [];
    for (Map<String, dynamic> row in resultado) {
      final Contact contact = Contact(
        row[_id],
        row[_name],
        row[_accountNumber],
      );
      listaContatos.add(contact);
    }
    return listaContatos;
  }

  Future<int> delete(int id) async {
    final Database db = await createDatabase();
    return db.delete(
      _tbName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(Contact contact) async {
    final Database db = await createDatabase();
    final Map<String, dynamic> contactMap = _toMap(contact);
    return db.update(
      _tbName,
      contactMap,
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }
}
