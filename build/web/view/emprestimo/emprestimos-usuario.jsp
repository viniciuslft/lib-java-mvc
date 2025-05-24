<%-- 
    Document   : emprestimos-usuario
    Created on : 23 de mai. de 2025, 23:58:42
    Author     : Vinicius
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Emprestimo" %>
<html>
<head>
    <title>Empréstimos do Usuário</title>
</head>
<body>
    <h2>Empréstimos do Usuário ID: <%= request.getAttribute("idUsuario") %></h2>

    <table border="1" cellpadding="5">
        <tr>
            <th>ID</th>
            <th>ID Livro</th>
            <th>Data Empréstimo</th>
            <th>Devolução Prevista</th>
            <th>Devolução Real</th>
            <th>Status</th>
        </tr>
        <%
            List<Emprestimo> lista = (List<Emprestimo>) request.getAttribute("emprestimos");
            if (lista != null && !lista.isEmpty()) {
                for (Emprestimo e : lista) {
        %>
        <tr>
            <td><%= e.getId() %></td>
            <td><%= e.getIdLivro() %></td>
            <td><%= e.getDataEmprestimo() %></td>
            <td><%= e.getDataDevolucaoPrevista() %></td>
            <td><%= e.getDataDevolucaoReal() != null ? e.getDataDevolucaoReal() : "-" %></td>
            <td><%= e.getStatus() %></td>
        </tr>
        <%  } } else { %>
        <tr><td colspan="6">Nenhum empréstimo encontrado.</td></tr>
        <% } %>
    </table>

    <br/>
    <a href="<%= request.getContextPath() %>/usuario/listar">Voltar para lista de usuários</a>
</body>
</html>
