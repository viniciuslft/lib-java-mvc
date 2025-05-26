<%-- 
    Document   : sucesso
    Created on : 25 de mai. de 2025, 10:32:46
    Author     : Vinicius
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="components/header.jsp" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Sucesso</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="alert alert-success">
        <h4 class="alert-heading"><i class="fas fa-check-circle"></i> Sucesso!</h4>
        <p><%= request.getAttribute("mensagemSucesso") != null ? request.getAttribute("mensagemSucesso") : "Operação realizada com sucesso." %></p>
        <hr>
        <a href="<%= request.getContextPath() %>/" class="btn btn-outline-success">
            <i class="fas fa-home"></i> Ir para a Página Inicial
        </a>
    </div>
</div>

</body>
</html>
