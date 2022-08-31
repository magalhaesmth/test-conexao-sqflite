import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:test_dao_sqflite/banco/conexao.dart';
import 'package:test_dao_sqflite/dao/entregaDAO.dart';
import 'package:test_dao_sqflite/model/empresa.dart';
import 'package:test_dao_sqflite/model/entrega.dart';

void main() {
  late Database db;
  late EntregaDAO entregaDAO;
  late Entrega entrega;

  setUp(() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    String caminho = join(await getDatabasesPath(), 'banco.db');
    deleteDatabase(caminho);
    db = await Conexao.abrirConexao();
    var empresa = Empresa(id: 1, nome: "Eduardo Doce", endereco: "Rua Atalaia");

    entregaDAO = EntregaDAO();
    entrega = Entrega(
        id: 1,
        nome_entregador: "Matheuzinho",
        valor_entrega: "7,00",
        data_entrega: "30/08/2022",
        empresa: empresa);
  });

  tearDownAll(() {
    db.close();
  });

  group('Testando a classe EntregaDAO', () {
    test('Testando o metodo salvar empresa', () async {
      var resultado = await entregaDAO.salvar(entrega);
      expect(resultado, true);
    });

   /* test('Testando o metodo alterar empresa', () async {
      await entregaDAO.salvar(entrega);
      var empresaAtualizada = Entrega(
          id: 1,
          nome_entregador: "Renatinho",
          valor_entrega: "5,00",
          data_entrega: "29/08/2022");
      var resultado = await entregaDAO.alterar(empresaAtualizada);
      expect(resultado, true);
    });

    test('Testando excluir entrega', () async {
      await entregaDAO.salvar(entrega);
      var resultado = await entregaDAO.excluir(1);
      expect(resultado, true);
    });

    test('Consultando apenas um', () async {
      await entregaDAO.salvar(entrega);
      var resultado = await entregaDAO.consultar(1);
      expect(resultado, isInstanceOf<Entrega>());
    });*/
  });
}
