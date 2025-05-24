<%-- 
    Document   : editar
    Created on : 23 de mai. de 2025, 23:39:51
    Author     : Vinicius
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Livro" %>
<%
    Livro l = (Livro) request.getAttribute("livro");
%>
<html>
<head>
    <title>Editar Livro</title>
</head>
<body>
    <h2>Editar Livro</h2>

    <form action="<%= request.getContextPath() %>/livro" method="post">
        <input type="hidden" name="id" value="<%= l.getId() %>" />

        Título: <input type="text" name="titulo" value="<%= l.getTitulo() %>" required><br/><br/>
        Autor: <input type="text" name="autor" value="<%= l.getAutor() %>" required><br/><br/>
        Editora: <input type="text" name="editora" value="<%= l.getEditora() %>"><br/><br/>
        Ano de Publicação: <input type="number" name="anoPublicacao" value="<%= l.getAnoPublicacao() %>"><br/><br/>
        ISBN: <input type="text" name="isbn" value="<%= l.getIsbn() %>"><br/><br/>
        Quantidade Disponível: <input type="number" name="quantidadeDisponivel" value="<%= l.getQuantidadeDisponivel() %>"><br/><br/>
        Categoria: <input type="text" name="categoria" value="<%= l.getCategoria() %>"><br/><br/>
        Descrição:<br/>
        <textarea name="descricao" rows="4" cols="50"><%= l.getDescricao() %></textarea><br/><br/>

        <input type="submit" value="Salvar alterações">
    </form>

    <br/>
    <a href="<%= request.getContextPath() %>/livro?acao=listar">Voltar para a lista</a>
</body>
</html>

