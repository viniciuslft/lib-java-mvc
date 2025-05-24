<%-- 
    Document   : listar
    Created on : 23 de mai. de 2025, 23:37:21
    Author     : Vinicius
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Livro" %>
<html>
<head>
    <title>Lista de Livros</title>
    <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { padding: 8px; border: 1px solid #ccc; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h2>Livros Cadastrados</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Título</th>
            <th>Autor</th>
            <th>Editora</th>
            <th>Ano</th>
            <th>ISBN</th>
            <th>Qtd</th>
            <th>Categoria</th>
            <th>Ações</th>
        </tr>
        <%
            List<Livro> livros = (List<Livro>) request.getAttribute("livros");
            if (livros != null && !livros.isEmpty()) {
                for (Livro l : livros) {
        %>
        <tr>
            <td><%= l.getId() %></td>
            <td><%= l.getTitulo() %></td>
            <td><%= l.getAutor() %></td>
            <td><%= l.getEditora() %></td>
            <td><%= l.getAnoPublicacao() %></td>
            <td><%= l.getIsbn() %></td>
            <td><%= l.getQuantidadeDisponivel() %></td>
            <td><%= l.getCategoria() %></td>
            <td>
                <a href="<%= request.getContextPath() %>/livro?acao=editar&id=<%= l.getId() %>">Editar</a> |
                <a href="<%= request.getContextPath() %>/livro?acao=excluir&id=<%= l.getId() %>" onclick="return confirm('Deseja excluir este livro?');">Excluir</a>
            </td>
        </tr>
        <%      }
            } else {
        %>
        <tr><td colspan="9">Nenhum livro encontrado.</td></tr>
        <% } %>
    </table>

    <br/>
    <a href="<%= request.getContextPath() %>/view/livro/cadastro.jsp">Cadastrar novo livro</a>
</body>
</html>

