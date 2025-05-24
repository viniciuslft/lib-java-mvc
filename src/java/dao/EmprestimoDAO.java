/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author Vinicius
 */

import model.Emprestimo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmprestimoDAO {

    public void registrar(Emprestimo e) throws SQLException {
        Connection conn = ConnectionFactory.getConnection();
        String sql = "INSERT INTO emprestimos (id_usuario, id_livro, data_emprestimo, data_devolucao_prevista, status) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, e.getIdUsuario());
        stmt.setInt(2, e.getIdLivro());
        stmt.setDate(3, new java.sql.Date(e.getDataEmprestimo().getTime()));
        stmt.setDate(4, new java.sql.Date(e.getDataDevolucaoPrevista().getTime()));
        stmt.setString(5, e.getStatus());
        stmt.executeUpdate();
        stmt.close();
        conn.close();
    }

    public List<Emprestimo> listarTodos() throws SQLException {
        List<Emprestimo> lista = new ArrayList<>();
        Connection conn = ConnectionFactory.getConnection();
        String sql = "SELECT * FROM emprestimos ORDER BY data_emprestimo DESC";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Emprestimo e = new Emprestimo();
            e.setId(rs.getInt("id"));
            e.setIdUsuario(rs.getInt("id_usuario"));
            e.setIdLivro(rs.getInt("id_livro"));
            e.setDataEmprestimo(rs.getDate("data_emprestimo"));
            e.setDataDevolucaoPrevista(rs.getDate("data_devolucao_prevista"));
            e.setDataDevolucaoReal(rs.getDate("data_devolucao_real"));
            e.setStatus(rs.getString("status"));
            lista.add(e);
        }

        rs.close();
        stmt.close();
        conn.close();
        return lista;
    }

    public void registrarDevolucao(int id, Date dataDevolucao) throws SQLException {
        Connection conn = ConnectionFactory.getConnection();
        String sql = "UPDATE emprestimos SET data_devolucao_real = ?, status = 'DEVOLVIDO' WHERE id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setDate(1, new java.sql.Date(dataDevolucao.getTime()));
        stmt.setInt(2, id);
        stmt.executeUpdate();
        stmt.close();
        conn.close();
    }

    public void atualizarStatusAtrasado() throws SQLException {
        Connection conn = ConnectionFactory.getConnection();
        String sql = "UPDATE emprestimos SET status = 'ATRASADO' WHERE data_devolucao_real IS NULL AND data_devolucao_prevista < CURDATE()";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.executeUpdate();
        stmt.close();
        conn.close();
    }
}

