import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:test_dao_sqflite/banco/conexao.dart';

void main() async {
  late Database db;

  setUp(() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    db = await Conexao.abrirConexao();
  });

  tearDownAll(() {
    db.close();
  });

  group('teste de conexao', () {
    test('testando conexao aberta', () {
      expect(db.isOpen, true);
    });
  });
}
