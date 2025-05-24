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
}
