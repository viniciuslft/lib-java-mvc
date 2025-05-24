<%-- 
    Document   : editar
    Created on : 23 de mai. de 2025, 23:39:51
    Author     : Vinicius
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Livro" %>
<%@ include file="../components/header.jsp" %>
<%
    Livro l = (Livro) request.getAttribute("livro");
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Editar Livro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="mb-4"><i class="fas fa-pen"></i> Editar Livro</h2>

    <form action="<%= request.getContextPath() %>/livro" method="post" class="row g-3">
        <input type="hidden" name="id" value="<%= l.getId() %>">

        <div class="col-md-6">
            <label for="titulo" class="form-label">Título</label>
            <input type="text" class="form-control" id="titulo" name="titulo" value="<%= l.getTitulo() %>" required>
        </div>

        <div class="col-md-6">
            <label for="autor" class="form-label">Autor</label>
            <input type="text" class="form-control" id="autor" name="autor" value="<%= l.getAutor() %>" required>
        </div>

        <div class="col-md-6">
            <label for="editora" class="form-label">Editora</label>
            <input type="text" class="form-control" id="editora" name="editora" value="<%= l.getEditora() %>">
        </div>

        <div class="col-md-6">
            <label for="anoPublicacao" class="form-label">Ano de Publicação</label>
            <input type="number" class="form-control" id="anoPublicacao" name="anoPublicacao" value="<%= l.getAnoPublicacao() %>">
        </div>

        <div class="col-md-6">
            <label for="isbn" class="form-label">ISBN</label>
            <input type="text" class="form-control" id="isbn" name="isbn" value="<%= l.getIsbn() %>">
        </div>

        <div class="col-md-6">
            <label for="quantidadeDisponivel" class="form-label">Quantidade Disponível</label>
            <input type="number" class="form-control" id="quantidadeDisponivel" name="quantidadeDisponivel" value="<%= l.getQuantidadeDisponivel() %>">
        </div>

        <div class="col-md-6">
            <label for="categoria" class="form-label">Categoria</label>
            <input type="text" class="form-control" id="categoria" name="categoria" value="<%= l.getCategoria() %>">
        </div>

        <div class="col-12">
            <label for="descricao" class="form-label">Descrição</label>
            <textarea class="form-control" id="descricao" name="descricao" rows="4"><%= l.getDescricao() %></textarea>
        </div>

        <div class="col-12">
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-save"></i> Salvar Alterações
            </button>
            <a href="<%= request.getContextPath() %>/livro?acao=listar" class="btn btn-secondary ms-2">
                <i class="fas fa-arrow-left"></i> Voltar
            </a>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
