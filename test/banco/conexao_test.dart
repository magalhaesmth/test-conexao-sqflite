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

  group('Teste de Conexão', () {
    test('Testando a conexão aberta', () {
      expect(db.isOpen, true);
    });

    test('Testando a conexão em consulta do Usuario', () async {
      var resultado = await db.query('usuario');
      expect(resultado.length, isInstanceOf<int>());
    });

    test('Testando a conexão em consulta das Entregas', () async {
      var resultado = await db.query('entrega');
      expect(resultado.length, isInstanceOf<int>());
    });
  });
}
