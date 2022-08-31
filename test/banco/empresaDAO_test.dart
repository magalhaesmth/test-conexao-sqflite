import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:test_dao_sqflite/banco/conexao.dart';
import 'package:test_dao_sqflite/dao/empresaDAO.dart';
import 'package:test_dao_sqflite/model/empresa.dart';

void main() {
  late Database db;
  late EmpresaDAO empresaDAO;
  late Empresa empresa;

  setUp(() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    String caminho = join(await getDatabasesPath(), 'banco.db');
    deleteDatabase(caminho);
    db = await Conexao.abrirConexao();

    empresaDAO = EmpresaDAO();
    empresa =
        Empresa(id: 1, nome: "Andrey Imports", endereco: "Avenida Parana");
  });

  tearDownAll(() {
    db.close();
  });

  group('Testando a classe empresa', () {
    test('Testando o metodo salvar empresa', () async {
      var resultado = await empresaDAO.salvar(empresa);
      expect(resultado, true);
    });

    test('Testando o metodo alterar empresa', () async {
      await empresaDAO.salvar(empresa);
      var empresaAtualizada = Empresa(
          id: 1, nome: "Matheus Import", endereco: "Avenida Joao Gomes");
      var resultado = await empresaDAO.alterar(empresaAtualizada);
      expect(resultado, true);
    });
  });
}
