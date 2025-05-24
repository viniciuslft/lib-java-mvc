<%-- 
    Document   : registrar
    Created on : 24 de mai. de 2025, 00:09:14
    Author     : Vinicius
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Usuario, model.Livro" %>
<html>
<head>
    <title>Registrar Empréstimo</title>
</head>
<body>
    <h2>Registrar Novo Empréstimo</h2>

    <form action="<%= request.getContextPath() %>/emprestimo" method="post">
        <label>Usuário:</label><br/>
        <select name="idUsuario" required>
            <%
                List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
                for (Usuario u : usuarios) {
            %>
                <option value="<%= u.getId() %>"><%= u.getNome() %> (<%= u.getTipoUsuario() %>)</option>
            <%
                }
            %>
        </select><br/><br/>

        <label>Livro:</label><br/>
        <select name="idLivro" required>
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
        </select><br/><br/>

        <input type="submit" value="Registrar Empréstimo">
    </form>

    <br/>
    <a href="<%= request.getContextPath() %>/emprestimo?acao=listar">Voltar para lista de empréstimos</a>
</body>
</html>

