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
import model.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/usuario/listar")
public class UsuarioListarServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nomeBusca = request.getParameter("nome");

        try {
            UsuarioDAO dao = new UsuarioDAO();
            List<Usuario> usuarios;

            if (nomeBusca != null && !nomeBusca.trim().isEmpty()) {
                usuarios = dao.buscarPorNome(nomeBusca);
            } else {
                usuarios = dao.listarTodos();
            }

            request.setAttribute("usuarios", usuarios);
            request.setAttribute("nomeBuscado", nomeBusca);
            request.getRequestDispatcher("/view/usuario/listar.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("/view/usuario/erro.jsp");
        }
    }
}
