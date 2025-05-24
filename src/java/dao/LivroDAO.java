/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author Vinicius
 */

import model.Livro;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LivroDAO {

    public void cadastrar(Livro l) throws SQLException {
        Connection conn = ConnectionFactory.getConnection();
        String sql = "INSERT INTO livros (titulo, autor, editora, ano_publicacao, isbn, quantidade_disponivel, categoria, descricao) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, l.getTitulo());
        stmt.setString(2, l.getAutor());
        stmt.setString(3, l.getEditora());
        stmt.setInt(4, l.getAnoPublicacao());
        stmt.setString(5, l.getIsbn());
        stmt.setInt(6, l.getQuantidadeDisponivel());
        stmt.setString(7, l.getCategoria());
        stmt.setString(8, l.getDescricao());
        stmt.executeUpdate();
        stmt.close();
        conn.close();
    }

    public List<Livro> listarTodos() throws SQLException {
        List<Livro> lista = new ArrayList<>();
        Connection conn = ConnectionFactory.getConnection();
        String sql = "SELECT * FROM livros ORDER BY titulo";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Livro l = new Livro();
            l.setId(rs.getInt("id"));
            l.setTitulo(rs.getString("titulo"));
            l.setAutor(rs.getString("autor"));
            l.setEditora(rs.getString("editora"));
            l.setAnoPublicacao(rs.getInt("ano_publicacao"));
            l.setIsbn(rs.getString("isbn"));
            l.setQuantidadeDisponivel(rs.getInt("quantidade_disponivel"));
            l.setCategoria(rs.getString("categoria"));
            l.setDescricao(rs.getString("descricao"));
            lista.add(l);
        }

        rs.close();
        stmt.close();
        conn.close();

        return lista;
    }

    public Livro buscarPorId(int id) throws SQLException {
        Connection conn = ConnectionFactory.getConnection();
        String sql = "SELECT * FROM livros WHERE id=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();

        Livro l = null;
        if (rs.next()) {
            l = new Livro();
            l.setId(rs.getInt("id"));
            l.setTitulo(rs.getString("titulo"));
            l.setAutor(rs.getString("autor"));
            l.setEditora(rs.getString("editora"));
            l.setAnoPublicacao(rs.getInt("ano_publicacao"));
            l.setIsbn(rs.getString("isbn"));
            l.setQuantidadeDisponivel(rs.getInt("quantidade_disponivel"));
            l.setCategoria(rs.getString("categoria"));
            l.setDescricao(rs.getString("descricao"));
        }

        rs.close();
        stmt.close();
        conn.close();
        return l;
    }

    public void atualizar(Livro l) throws SQLException {
        Connection conn = ConnectionFactory.getConnection();
        String sql = "UPDATE livros SET titulo=?, autor=?, editora=?, ano_publicacao=?, isbn=?, quantidade_disponivel=?, categoria=?, descricao=? WHERE id=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, l.getTitulo());
        stmt.setString(2, l.getAutor());
        stmt.setString(3, l.getEditora());
        stmt.setInt(4, l.getAnoPublicacao());
        stmt.setString(5, l.getIsbn());
        stmt.setInt(6, l.getQuantidadeDisponivel());
        stmt.setString(7, l.getCategoria());
        stmt.setString(8, l.getDescricao());
        stmt.setInt(9, l.getId());
        stmt.executeUpdate();
        stmt.close();
        conn.close();
    }

    public void excluir(int id) throws SQLException {
        Connection conn = ConnectionFactory.getConnection();
        String sql = "DELETE FROM livros WHERE id=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);
        stmt.executeUpdate();
        stmt.close();
        conn.close();
    }
}

