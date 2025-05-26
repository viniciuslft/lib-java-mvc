<%-- 
    Document   : erro
    Created on : 25 de mai. de 2025, 10:15:16
    Author     : Vinicius
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="components/header.jsp" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Erro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="alert alert-danger">
        <h4 class="alert-heading"><i class="fas fa-exclamation-triangle"></i> Ocorreu um erro</h4>
        <p><%= request.getAttribute("mensagemErro") != null ? request.getAttribute("mensagemErro") : "Algo inesperado aconteceu." %></p>
        <hr>
        <a href="<%= request.getAttribute("destinoVoltar") != null ? request.getAttribute("destinoVoltar") : request.getContextPath() + "/index.html" %>" class="btn btn-outline-danger">
            <i class="fas fa-arrow-left"></i> 
            Voltar
        </a>
    </div>
</div>

</body>
</html>

