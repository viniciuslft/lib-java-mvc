/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Vinicius
 */
package controller;

import dao.EmprestimoDAO;
import dao.UsuarioDAO;
import dao.LivroDAO;
import model.Emprestimo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

@WebServlet("/emprestimo")
public class EmprestimoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        try {
            EmprestimoDAO dao = new EmprestimoDAO();

            if ("devolver".equals(acao)) {
                int id = Integer.parseInt(request.getParameter("id"));
                dao.registrarDevolucao(id, new java.sql.Date(System.currentTimeMillis()));
                response.sendRedirect("emprestimo?acao=listar");

            } else if ("renovar".equals(acao)) {
                int id = Integer.parseInt(request.getParameter("id"));
                dao.renovar(id);
                response.sendRedirect("emprestimo?acao=listar");
            } else if ("novo".equals(acao)) {
                try {
                    UsuarioDAO usuarioDAO = new UsuarioDAO();
                    LivroDAO livroDAO = new LivroDAO();

                    request.setAttribute("usuarios", usuarioDAO.listarTodos());
                    request.setAttribute("livros", livroDAO.listarDisponiveis());

                    request.getRequestDispatcher("/view/emprestimo/registrar.jsp").forward(request, response);

                } catch (Exception ex) {
                    ex.printStackTrace();
                    response.sendRedirect("view/emprestimo/erro.jsp");
                }
            } else {
                dao.atualizarStatusAtrasado(); // Atualiza empréstimos vencidos
                List<Emprestimo> lista = dao.listarTodos();
                request.setAttribute("emprestimos", lista);
                request.getRequestDispatcher("/view/emprestimo/listar.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("view/emprestimo/erro.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Emprestimo e = new Emprestimo();
        e.setIdUsuario(Integer.parseInt(request.getParameter("idUsuario")));
        e.setIdLivro(Integer.parseInt(request.getParameter("idLivro")));
        e.setDataEmprestimo(new Date());

        // Define a devolução prevista para 7 dias após o empréstimo
        long seteDias = 7L * 24 * 60 * 60 * 1000;
        e.setDataDevolucaoPrevista(new Date(System.currentTimeMillis() + seteDias));

        e.setStatus("ATIVO");

        try {
            EmprestimoDAO dao = new EmprestimoDAO();
            dao.registrar(e);
            response.sendRedirect("emprestimo?acao=listar");

        } catch (SQLException ex) {
            ex.printStackTrace();
            response.sendRedirect("view/emprestimo/erro.jsp");
        }
    }
}

