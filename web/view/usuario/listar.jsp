<%-- 
    Document   : listar
    Created on : 23 de mai. de 2025, 22:52:59
    Author     : Vinicius
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Usuario" %>
<html>
<head>
    <title>Lista de Usuários</title>
</head>
<body>
    <h2>Usuários Cadastrados</h2>
    
    <form action="<%= request.getContextPath() %>/usuario/listar" method="get">
        <label>Buscar por nome:</label>
        <input type="text" name="nome" value="<%= request.getAttribute("nomeBuscado") != null ? request.getAttribute("nomeBuscado") : "" %>">
        <input type="submit" value="Buscar">
        <a href="<%= request.getContextPath() %>/usuario/listar">Limpar</a>
    </form>
    
    <br/>

    <table border="1" cellpadding="5">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Email</th>
            <th>Telefone</th>
            <th>Endereço</th>
            <th>Tipo</th>
            <th>Data de Cadastro</th>
        </tr>
        <%
            List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
            if (usuarios != null && !usuarios.isEmpty()) {
                for (Usuario u : usuarios) {
        %>
        <tr>
            <td><%= u.getId() %></td>
            <td><%= u.getNome() %></td>
            <td><%= u.getEmail() %></td>
            <td><%= u.getTelefone() %></td>
            <td><%= u.getEndereco() %></td>
            <td><%= u.getTipoUsuario() %></td>
            <td><%= u.getDataCadastro() %></td>
            <td>
                <a href="<%= request.getContextPath() %>/usuario/editar?id=<%= u.getId() %>">Editar</a> |
                <a href="<%= request.getContextPath() %>/usuario/excluir?id=<%= u.getId() %>" onclick="return confirm('Tem certeza que deseja excluir este usuário?');">Excluir</a>
                <a href="<%= request.getContextPath() %>/usuario/emprestimos?id=<%= u.getId() %>">Ver empréstimos</a>
            </td>


        </tr>
        <%      }
            } else {
        %>
        <tr><td colspan="7">Nenhum usuário encontrado.</td></tr>
        <% } %>
    </table>

    <br/>
    <a href="<%= request.getContextPath() %>/view/usuario/cadastro.jsp">Cadastrar novo usuário</a>
</body>
</html>
