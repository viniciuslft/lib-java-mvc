package dao;

import model.Usuario;
import java.sql.*;
import java.util.*;

public class UsuarioDAO {

    public void cadastrar(Usuario u) throws SQLException {
        Connection conn = ConnectionFactory.getConnection();
        String sql = "INSERT INTO usuarios (nome, email, telefone, endereco, tipo_usuario, data_cadastro) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, u.getNome());
        stmt.setString(2, u.getEmail());
        stmt.setString(3, u.getTelefone());
        stmt.setString(4, u.getEndereco());
        stmt.setString(5, u.getTipoUsuario());
        stmt.setDate(6, new java.sql.Date(u.getDataCadastro().getTime()));
        stmt.executeUpdate();
        stmt.close();
        conn.close();
    }

    public List<Usuario> listarTodos() throws SQLException {
        List<Usuario> lista = new ArrayList<>();
        Connection conn = ConnectionFactory.getConnection();
        String sql = "SELECT * FROM usuarios";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Usuario u = new Usuario();
            u.setId(rs.getInt("id"));
            u.setNome(rs.getString("nome"));
            u.setEmail(rs.getString("email"));
            u.setTelefone(rs.getString("telefone"));
            u.setEndereco(rs.getString("endereco"));
            u.setTipoUsuario(rs.getString("tipo_usuario"));
            u.setDataCadastro(rs.getDate("data_cadastro"));
            lista.add(u);
        }

        rs.close();
        stmt.close();
        conn.close();

        return lista;
    }
    
    public Usuario buscarPorId(int id) throws SQLException {
        Connection conn = ConnectionFactory.getConnection();
        String sql = "SELECT * FROM usuarios WHERE id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();

        Usuario u = null;
        if (rs.next()) {
            u = new Usuario();
            u.setId(rs.getInt("id"));
            u.setNome(rs.getString("nome"));
            u.setEmail(rs.getString("email"));
            u.setTelefone(rs.getString("telefone"));
            u.setEndereco(rs.getString("endereco"));
            u.setTipoUsuario(rs.getString("tipo_usuario"));
            u.setDataCadastro(rs.getDate("data_cadastro"));
        }

        rs.close();
        stmt.close();
        conn.close();
        return u;
    }
    
    public List<Usuario> buscarPorNome(String nome) throws SQLException {
        List<Usuario> lista = new ArrayList<>();
        Connection conn = ConnectionFactory.getConnection();
        String sql = "SELECT * FROM usuarios WHERE nome LIKE ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, "%" + nome + "%");
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Usuario u = new Usuario();
            u.setId(rs.getInt("id"));
            u.setNome(rs.getString("nome"));
            u.setEmail(rs.getString("email"));
            u.setTelefone(rs.getString("telefone"));
            u.setEndereco(rs.getString("endereco"));
            u.setTipoUsuario(rs.getString("tipo_usuario"));
            u.setDataCadastro(rs.getDate("data_cadastro"));
            lista.add(u);
        }

        rs.close();
        stmt.close();
        conn.close();

        return lista;
    }


    public void atualizar(Usuario u) throws SQLException {
        Connection conn = ConnectionFactory.getConnection();
        String sql = "UPDATE usuarios SET nome=?, email=?, telefone=?, endereco=?, tipo_usuario=? WHERE id=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, u.getNome());
        stmt.setString(2, u.getEmail());
        stmt.setString(3, u.getTelefone());
        stmt.setString(4, u.getEndereco());
        stmt.setString(5, u.getTipoUsuario());
        stmt.setInt(6, u.getId());
        stmt.executeUpdate();
        stmt.close();
        conn.close();
    }
    
    public void excluir(int id) throws SQLException {
        Connection conn = ConnectionFactory.getConnection();
        String sql = "DELETE FROM usuarios WHERE id=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);
        stmt.executeUpdate();
        stmt.close();
        conn.close();
    }


}
