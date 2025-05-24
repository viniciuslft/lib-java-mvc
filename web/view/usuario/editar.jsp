<%-- 
    Document   : editar
    Created on : 23 de mai. de 2025, 23:09:27
    Author     : Vinicius
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Usuario" %>
<%
    Usuario u = (Usuario) request.getAttribute("usuario");
%>
<html>
<head><title>Editar Usuário</title></head>
<body>
    <h2>Editar Usuário</h2>
    <form action="${pageContext.request.contextPath}/usuario/editar" method="post">
        <input type="hidden" name="id" value="<%= u.getId() %>" />

        Nome: <input type="text" name="nome" value="<%= u.getNome() %>"><br/>
        Email: <input type="email" name="email" value="<%= u.getEmail() %>"><br/>
        Telefone: <input type="text" name="telefone" value="<%= u.getTelefone() %>"><br/>
        Endereço: <input type="text" name="endereco" value="<%= u.getEndereco() %>"><br/>
        Tipo: 
        <select name="tipoUsuario">
            <option value="ESTUDANTE" <%= u.getTipoUsuario().equals("ESTUDANTE") ? "selected" : "" %>>Estudante</option>
            <option value="PROFESSOR" <%= u.getTipoUsuario().equals("PROFESSOR") ? "selected" : "" %>>Professor</option>
            <option value="FUNCIONARIO" <%= u.getTipoUsuario().equals("FUNCIONARIO") ? "selected" : "" %>>Funcionário</option>
        </select><br/><br/>

        <input type="submit" value="Salvar alterações">
    </form>
</body>
</html>

