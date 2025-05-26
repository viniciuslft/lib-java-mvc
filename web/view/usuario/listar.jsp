<%-- 
    Document   : listar
    Created on : 23 de mai. de 2025, 22:52:59
    Author     : Vinicius
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Usuario, java.text.SimpleDateFormat" %>
<%@ include file="../components/header.jsp" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Lista de Usuários</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body class="bg-light">

<div class="container mt-4">
    <h2 class="mb-4"><i class="fas fa-users"></i> Usuários Cadastrados</h2>

    <form class="row g-3 mb-4" action="<%= request.getContextPath() %>/usuario/listar" method="get">
        <div class="col-md-6">
            <label for="nome" class="form-label">Buscar por nome:</label>
            <input type="text" class="form-control" id="nome" name="nome"
                   value="<%= request.getAttribute("nomeBuscado") != null ? request.getAttribute("nomeBuscado") : "" %>">
        </div>
        <div class="col-auto d-flex align-items-end gap-2">
            <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i> Buscar</button>
            <a href="<%= request.getContextPath() %>/usuario/listar" class="btn btn-secondary"><i class="fas fa-times"></i> Limpar</a>
        </div>
    </form>

    <div class="table-responsive">
        <table class="table table-striped table-hover align-middle">
            <thead class="table-primary">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>Telefone</th>
                    <th>Endereço</th>
                    <th>Tipo</th>
                    <th>Data de Cadastro</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
            <%
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
                if (usuarios != null && !usuarios.isEmpty()) {
                    for (Usuario u : usuarios) {
            %>
                <tr>
                    <td><%= u.getId() %></td>
                    <td><%= u.getNome() %></td>
                    <td><%= u.getEmail() %></td>
                    <td><%= u.getTelefone() %></td>
                    <td><%= u.getEndereco() %></td>
                    <td><%= u.getTipoUsuario() %></td>
                    <td><%= sdf.format(u.getDataCadastro()) %></td>
                    <td>
                        <a class="btn btn-sm btn-warning" href="<%= request.getContextPath() %>/usuario/editar?id=<%= u.getId() %>">
                            <i class="fas fa-pen"></i> Editar
                        </a>
                        <a class="btn btn-sm btn-danger" href="<%= request.getContextPath() %>/usuario/excluir?id=<%= u.getId() %>" onclick="return confirm('Tem certeza que deseja excluir este usuário?');">
                            <i class="fas fa-trash"></i> Excluir
                        </a>
                        <a class="btn btn-sm btn-info" href="<%= request.getContextPath() %>/usuario/emprestimos?id=<%= u.getId() %>">
                            <i class="fas fa-book"></i> Empréstimos
                        </a>
                    </td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="8" class="text-center">Nenhum usuário encontrado.</td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

    <div class="mt-4">
        <a class="btn btn-success" href="<%= request.getContextPath() %>/view/usuario/cadastro.jsp">
            <i class="fas fa-user-plus"></i> Cadastrar Novo Usuário
        </a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
