<%-- 
    Document   : listar
    Created on : 23 de mai. de 2025, 23:47:59
    Author     : Vinicius
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Emprestimo" %>
<html>
<head>
    <title>Lista de Empréstimos</title>
    <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { padding: 8px; border: 1px solid #ccc; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h2>Empréstimos Registrados</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>ID Usuário</th>
            <th>ID Livro</th>
            <th>Data Empréstimo</th>
            <th>Devolução Prevista</th>
            <th>Devolução Real</th>
            <th>Status</th>
            <th>Ações</th>
        </tr>
        <%
            List<Emprestimo> emprestimos = (List<Emprestimo>) request.getAttribute("emprestimos");
            if (emprestimos != null && !emprestimos.isEmpty()) {
                for (Emprestimo e : emprestimos) {
        %>
        <tr>
            <td><%= e.getId() %></td>
            <td><%= e.getIdUsuario() %></td>
            <td><%= e.getIdLivro() %></td>
            <td><%= e.getDataEmprestimo() %></td>
            <td><%= e.getDataDevolucaoPrevista() %></td>
            <td><%= e.getDataDevolucaoReal() != null ? e.getDataDevolucaoReal() : "-" %></td>
            <td><%= e.getStatus() %></td>
            <td>
                <% if ("ATIVO".equals(e.getStatus())) { %>
                    <a href="<%= request.getContextPath() %>/emprestimo?acao=devolver&id=<%= e.getId() %>" onclick="return confirm('Confirmar devolução?');">Devolver</a>
                    <a href="<%= request.getContextPath() %>/emprestimo?acao=renovar&id=<%= e.getId() %>" onclick="return confirm('Renovar empréstimo por +7 dias?');">Renovar</a>
                <% } else { %>
                    -
                <% } %>
            </td>
        </tr>
        <%      }
            } else {
        %>
        <tr><td colspan="8">Nenhum empréstimo encontrado.</td></tr>
        <% } %>
    </table>

    <br/>
    <a href="<%= request.getContextPath() %>/emprestimo?acao=novo">Registrar novo empréstimo</a>
</body>
</html>
