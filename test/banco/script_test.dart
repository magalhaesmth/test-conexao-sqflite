import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_dao_sqflite/banco/script.dart';

main() {
  setUp(() {});

  group('Testando o script do banco', () {
    test('Testando o script de comando do banco', () {
      expect(criarBanco, isInstanceOf<List<String>>());
    });

    test('Testando o script de comando do banco vazio', () {
      expect(criarBanco, isNotEmpty);
    });

    test('Testando o script de comando do banco é nulo', () {
      expect(criarBanco, isNotNull);
    });
  });
}
