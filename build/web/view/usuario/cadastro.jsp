<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cadastro de Usuário</title>
</head>
<body>
    <h2>Cadastro de Usuário</h2>
    <form action="${pageContext.request.contextPath}/usuario" method="post">
        <label>Nome:</label><br/>
        <input type="text" name="nome" required><br/><br/>

        <label>Email:</label><br/>
        <input type="email" name="email" required><br/><br/>

        <label>Telefone:</label><br/>
        <input type="text" name="telefone"><br/><br/>

        <label>Endereço:</label><br/>
        <input type="text" name="endereco"><br/><br/>

        <label>Tipo de Usuário:</label><br/>
        <select name="tipoUsuario" required>
            <option value="">Selecione...</option>
            <option value="ESTUDANTE">Estudante</option>
            <option value="PROFESSOR">Professor</option>
            <option value="FUNCIONARIO">Funcionário</option>
        </select><br/><br/>

        <input type="submit" value="Cadastrar">
    </form>
</body>
</html>
