import 'package:sqflite/sqflite.dart';
import 'package:test_dao_sqflite/banco/conexao.dart';
import 'package:test_dao_sqflite/model/usuario.dart';

class UsuarioDAO {
  Future<bool> salvar(Usuario usuario) async {
    Database db = await Conexao.abrirConexao();
    const sql =
        'INSERT INTO usuario (id, nome, veiculo, senha) VALUES (?,?,?,?)';
    var linhasAfetadas = await db.rawInsert(sql,
        [usuario.id, usuario.nome, usuario.veiculo, usuario.senha.toString()]);
    return linhasAfetadas > 0;
  }

  Future<bool> alterar(Usuario usuario) async {
    const sql = 'UPDATE usuario SET nome=?, veiculo=?, senha=? WHERE id = ?';
    Database db = await Conexao.abrirConexao();
    var linhasAfetadas = await db.rawUpdate(sql,
        [usuario.id, usuario.nome, usuario.veiculo, usuario.senha.toString()]);
    return linhasAfetadas > 0;
  }

  Future<Usuario> consultar(int id) async {
    late Database db;
    try {
      const sql = 'SELECT * FROM usuario WHERE id = ?';
      db = await Conexao.abrirConexao();
      Map<String, Object?> resultado = (await db.rawQuery(sql, [id])).first;
      if (resultado.isEmpty) throw Exception('Sem registros com este ID');
      Usuario usuario = Usuario(
          id: resultado['id'] as int,
          nome: resultado['nome'].toString(),
          veiculo: resultado['veiculo'].toString(),
          senha: resultado['senha'].toString());
      return usuario;
    } catch (e) {
      throw Exception('classe UsuarioDAO, método consultar');
    } finally {
      db.close();
    }
  }

  Future<bool> excluir(int id) async {
    late Database db;
    try {
      const sql = 'DELETE FROM usuario WHERE id = ?';
      db = await Conexao.abrirConexao();
      int linhasAfetadas = await db.rawDelete(sql, [id]);
      return linhasAfetadas > 0;
    } catch (e) {
      throw Exception('classe UsuarioDAO, método excluir');
    } finally {
      db.close();
    }
  }
}
