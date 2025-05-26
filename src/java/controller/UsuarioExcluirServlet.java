/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author Vinicius
 */
import dao.UsuarioDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/usuario/excluir")
public class UsuarioExcluirServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            new UsuarioDAO().excluir(id);
            response.sendRedirect("listar");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("mensagemErro", "Não foi possível excluir o usuário. Ele pode estar vinculado a um ou mais empréstimos.");
            request.setAttribute("destinoVoltar", request.getContextPath() + "/usuario/listar");
            request.getRequestDispatcher("/view/erro.jsp").forward(request, response);
        }
    }
}
