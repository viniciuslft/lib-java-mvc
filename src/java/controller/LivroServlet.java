/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author Vinicius
 */

import dao.LivroDAO;
import model.Livro;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/livro")
public class LivroServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        try {
            LivroDAO dao = new LivroDAO();

            if ("editar".equals(acao)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Livro livro = dao.buscarPorId(id);
                request.setAttribute("livro", livro);
                request.getRequestDispatcher("/view/livro/editar.jsp").forward(request, response);

            } else if ("excluir".equals(acao)) {
                int id = Integer.parseInt(request.getParameter("id"));
                dao.excluir(id);
                response.sendRedirect("livro?acao=listar");

            } else if ("buscar".equals(acao)) {
                String termo = request.getParameter("termo");
                List<Livro> livros = dao.buscar(termo);
                request.setAttribute("livros", livros);
                request.setAttribute("termoBuscado", termo);
                request.getRequestDispatcher("/view/livro/listar.jsp").forward(request, response);

            } else if ("disponiveis".equals(acao)) {
                List<Livro> livros = dao.listarDisponiveis();
                request.setAttribute("livros", livros);
                request.getRequestDispatcher("/view/livro/listar.jsp").forward(request, response);
            } else {
                List<Livro> lista = dao.listarTodos();
                request.setAttribute("livros", lista);
                request.getRequestDispatcher("/view/livro/listar.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("view/livro/erro.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Livro l = new Livro();
        l.setTitulo(request.getParameter("titulo"));
        l.setAutor(request.getParameter("autor"));
        l.setEditora(request.getParameter("editora"));
        l.setAnoPublicacao(Integer.parseInt(request.getParameter("anoPublicacao")));
        l.setIsbn(request.getParameter("isbn"));
        l.setQuantidadeDisponivel(Integer.parseInt(request.getParameter("quantidadeDisponivel")));
        l.setCategoria(request.getParameter("categoria"));
        l.setDescricao(request.getParameter("descricao"));

        String id = request.getParameter("id"); // usado para saber se é editar

        try {
            LivroDAO dao = new LivroDAO();

            if (id != null && !id.isEmpty()) {
                l.setId(Integer.parseInt(id));
                dao.atualizar(l);
            } else {
                dao.cadastrar(l);
            }

            response.sendRedirect("livro?acao=listar");

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("view/livro/erro.jsp");
        }
    }
}

