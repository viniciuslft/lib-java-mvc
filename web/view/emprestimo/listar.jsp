<%-- 
    Document   : listar
    Created on : 23 de mai. de 2025, 23:47:59
    Author     : Vinicius
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Emprestimo" %>
<%@ include file="../components/header.jsp" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Lista de Empréstimos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="mb-4"><i class="fas fa-book"></i> Empréstimos Registrados</h2>

    <div class="table-responsive">
        <table class="table table-striped table-hover align-middle">
            <thead class="table-primary">
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
            </thead>
            <tbody>
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
                            <a href="<%= request.getContextPath() %>/emprestimo?acao=devolver&id=<%= e.getId() %>"
                               class="btn btn-sm btn-success mb-1"
                               onclick="return confirm('Confirmar devolução?');">
                                <i class="fas fa-undo-alt"></i> Devolver
                            </a>
                            <a href="<%= request.getContextPath() %>/emprestimo?acao=renovar&id=<%= e.getId() %>"
                               class="btn btn-sm btn-warning"
                               onclick="return confirm('Renovar empréstimo por +7 dias?');">
                                <i class="fas fa-clock"></i> Renovar
                            </a>
                        <% } else { %>
                            <span class="text-muted">-</span>
                        <% } %>
                    </td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="8" class="text-center">Nenhum empréstimo encontrado.</td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

    <div class="mt-4">
        <a class="btn btn-primary" href="<%= request.getContextPath() %>/emprestimo?acao=novo">
            <i class="fas fa-plus"></i> Registrar Novo Empréstimo
        </a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
