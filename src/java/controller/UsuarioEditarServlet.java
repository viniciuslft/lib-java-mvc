/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Vinicius
 */

package controller;

import dao.UsuarioDAO;
import model.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/usuario/editar")
public class UsuarioEditarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Usuario usuario = new UsuarioDAO().buscarPorId(id);
            request.setAttribute("usuario", usuario);
            request.getRequestDispatcher("/view/usuario/editar.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("mensagemErro", "Erro ao buscar dados do usuário para edição.");
            request.getRequestDispatcher("/view/erro.jsp").forward(request, response);
        }
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Usuario u = new Usuario();
        u.setId(Integer.parseInt(request.getParameter("id")));
        u.setNome(request.getParameter("nome"));
        u.setEmail(request.getParameter("email"));
        u.setTelefone(request.getParameter("telefone"));
        u.setEndereco(request.getParameter("endereco"));
        u.setTipoUsuario(request.getParameter("tipoUsuario"));

        try {
            new UsuarioDAO().atualizar(u);
            response.sendRedirect("listar");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("mensagemErro", "Erro ao atualizar dados do usuário.");
            request.setAttribute("destinoVoltar", request.getContextPath() + "/usuario/listar");
            request.getRequestDispatcher("/view/erro.jsp").forward(request, response);
        }
    }
}

