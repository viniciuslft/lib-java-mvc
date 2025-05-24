<%-- 
    Document   : editar
    Created on : 23 de mai. de 2025, 23:09:27
    Author     : Vinicius
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Usuario" %>
<%@ include file="../components/header.jsp" %>
<%
    Usuario u = (Usuario) request.getAttribute("usuario");
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Editar Usuário</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="mb-4"><i class="fas fa-pen"></i> Editar Usuário</h2>

    <form action="${pageContext.request.contextPath}/usuario/editar" method="post" class="row g-3">
        <input type="hidden" name="id" value="<%= u.getId() %>">

        <div class="col-md-6">
            <label for="nome" class="form-label">Nome</label>
            <input type="text" class="form-control" id="nome" name="nome" value="<%= u.getNome() %>" required>
        </div>

        <div class="col-md-6">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" value="<%= u.getEmail() %>" required>
        </div>

        <div class="col-md-6">
            <label for="telefone" class="form-label">Telefone</label>
            <input type="text" class="form-control" id="telefone" name="telefone" value="<%= u.getTelefone() %>">
        </div>

        <div class="col-md-6">
            <label for="endereco" class="form-label">Endereço</label>
            <input type="text" class="form-control" id="endereco" name="endereco" value="<%= u.getEndereco() %>">
        </div>

        <div class="col-md-6">
            <label for="tipoUsuario" class="form-label">Tipo de Usuário</label>
            <select class="form-select" id="tipoUsuario" name="tipoUsuario" required>
                <option value="ESTUDANTE" <%= u.getTipoUsuario().equals("ESTUDANTE") ? "selected" : "" %>>Estudante</option>
                <option value="PROFESSOR" <%= u.getTipoUsuario().equals("PROFESSOR") ? "selected" : "" %>>Professor</option>
                <option value="FUNCIONARIO" <%= u.getTipoUsuario().equals("FUNCIONARIO") ? "selected" : "" %>>Funcionário</option>
            </select>
        </div>

        <div class="col-12">
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-save"></i> Salvar Alterações
            </button>
            <a href="<%= request.getContextPath() %>/usuario/listar" class="btn btn-secondary ms-2">
                <i class="fas fa-arrow-left"></i> Voltar
            </a>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
