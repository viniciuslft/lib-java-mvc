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
import model.Emprestimo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/usuario/emprestimos")
public class EmprestimosPorUsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idUsuario = Integer.parseInt(request.getParameter("id"));

        try {
            List<Emprestimo> lista = new EmprestimoDAO().listarPorUsuario(idUsuario);
            request.setAttribute("emprestimos", lista);
            request.setAttribute("idUsuario", idUsuario);
            request.getRequestDispatcher("/view/emprestimo/emprestimos-usuario.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("mensagemErro", "Erro ao buscar empréstimos do usuário.");
            request.setAttribute("destinoVoltar", request.getContextPath() + "/emprestimo?acao=listar");
            request.getRequestDispatcher("/view/erro.jsp").forward(request, response);
        }
    }
}

