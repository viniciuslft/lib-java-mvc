<%-- 
    Document   : emprestimos-usuario
    Created on : 23 de mai. de 2025, 23:58:42
    Author     : Vinicius
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Emprestimo" %>
<%@ include file="../components/header.jsp" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Empréstimos do Usuário</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="mb-4"><i class="fas fa-book-open-reader"></i> Empréstimos do Usuário ID: <%= request.getAttribute("idUsuario") %></h2>

    <div class="table-responsive">
        <table class="table table-striped table-hover align-middle">
            <thead class="table-primary">
                <tr>
                    <th>ID</th>
                    <th>ID Livro</th>
                    <th>Data Empréstimo</th>
                    <th>Devolução Prevista</th>
                    <th>Devolução Real</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
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
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="6" class="text-center">Nenhum empréstimo encontrado.</td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

    <div class="mt-4">
        <a href="<%= request.getContextPath() %>/usuario/listar" class="btn btn-secondary">
            <i class="fas fa-arrow-left"></i> Voltar para Lista de Usuários
        </a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>