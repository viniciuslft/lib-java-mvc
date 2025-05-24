package controller;

import dao.UsuarioDAO;
import model.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

@WebServlet("/usuario")
public class UsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Pega dados do formulário
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        String endereco = request.getParameter("endereco");
        String tipoUsuario = request.getParameter("tipoUsuario");
        
        Usuario usuario = new Usuario();
        usuario.setNome(nome);
        usuario.setEmail(email);
        usuario.setTelefone(telefone);
        usuario.setEndereco(endereco);
        usuario.setTipoUsuario(tipoUsuario);
        usuario.setDataCadastro(new Date());

        try {
            UsuarioDAO dao = new UsuarioDAO();
            dao.cadastrar(usuario);
            response.sendRedirect("view/usuario/sucesso.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("view/usuario/erro.jsp");
        }
    }
}
