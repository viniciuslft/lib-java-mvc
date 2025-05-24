<%-- 
    Document   : registrar
    Created on : 24 de mai. de 2025, 00:09:14
    Author     : Vinicius
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Usuario, model.Livro" %>
<%@ include file="../components/header.jsp" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Registrar Empréstimo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="mb-4"><i class="fas fa-book-reader"></i> Registrar Novo Empréstimo</h2>

    <form action="<%= request.getContextPath() %>/emprestimo" method="post" class="row g-3">

        <div class="col-md-6">
            <label for="idUsuario" class="form-label">Usuário</label>
            <select name="idUsuario" id="idUsuario" class="form-select" required>
                <%
                    List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
                    for (Usuario u : usuarios) {
                %>
                <option value="<%= u.getId() %>"><%= u.getNome() %> (<%= u.getTipoUsuario() %>)</option>
                <%
                    }
                %>
            </select>
        </div>

        <div class="col-md-6">
            <label for="idLivro" class="form-label">Livro</label>
            <select name="idLivro" id="idLivro" class="form-select" required>
                <%
                    List<Livro> livros = (List<Livro>) request.getAttribute("livros");
                    for (Livro l : livros) {
                        if (l.getQuantidadeDisponivel() > 0) {
                %>
                <option value="<%= l.getId() %>"><%= l.getTitulo() %> - <%= l.getAutor() %></option>
                <%
                        }
                    }
                %>
            </select>
        </div>

        <div class="col-12">
            <button type="submit" class="btn btn-success">
                <i class="fas fa-check"></i> Registrar Empréstimo
            </button>
            <a href="<%= request.getContextPath() %>/emprestimo?acao=listar" class="btn btn-secondary ms-2">
                <i class="fas fa-arrow-left"></i> Voltar
            </a>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>