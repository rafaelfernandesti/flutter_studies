import 'package:flutter_files/database/Dao/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContactDAO.sqlContato);
    },
    version: 1,
    //onDowngrade: onDatabaseDowngradeDelete, //código usado para apagar o BD após realizar downgrade
  );
}
