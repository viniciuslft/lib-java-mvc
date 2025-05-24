<%-- 
    Document   : cadastro
    Created on : 23 de mai. de 2025, 23:36:57
    Author     : Vinicius
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cadastro de Livro</title>
</head>
<body>
    <h2>Cadastro de Livro</h2>

    <form action="<%= request.getContextPath() %>/livro" method="post">
        Título: <input type="text" name="titulo" required><br/><br/>
        Autor: <input type="text" name="autor" required><br/><br/>
        Editora: <input type="text" name="editora"><br/><br/>
        Ano de Publicação: <input type="number" name="anoPublicacao"><br/><br/>
        ISBN: <input type="text" name="isbn"><br/><br/>
        Quantidade Disponível: <input type="number" name="quantidadeDisponivel" value="1"><br/><br/>
        Categoria: <input type="text" name="categoria"><br/><br/>
        Descrição:<br/>
        <textarea name="descricao" rows="4" cols="50"></textarea><br/><br/>

        <input type="submit" value="Cadastrar Livro">
    </form>

    <br/>
    <a href="<%= request.getContextPath() %>/livro?acao=listar">Voltar para a lista</a>
</body>
</html>

