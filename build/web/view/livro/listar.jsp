<%-- 
    Document   : listar
    Created on : 23 de mai. de 2025, 23:37:21
    Author     : Vinicius
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Livro" %>
<%@ include file="../components/header.jsp" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Lista de Livros</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="mb-4"><i class="fas fa-book"></i> Livros Cadastrados</h2>

    <form class="row g-3 mb-4" action="<%= request.getContextPath() %>/livro" method="get">
        <input type="hidden" name="acao" value="buscar" />
        <div class="col-md-8">
            <label for="termo" class="form-label">Buscar por título, autor ou categoria:</label>
            <input type="text" class="form-control" id="termo" name="termo"
                   value="<%= request.getAttribute("termoBuscado") != null ? request.getAttribute("termoBuscado") : "" %>">
        </div>
        <div class="col-auto d-flex align-items-end gap-2">
            <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i> Buscar</button>
            <a href="<%= request.getContextPath() %>/livro?acao=listar" class="btn btn-secondary"><i class="fas fa-times"></i> Limpar</a>
        </div>
    </form>

    <div class="mb-4">
        <a href="<%= request.getContextPath() %>/livro?acao=disponiveis" class="btn btn-outline-info">
            <i class="fas fa-book-open"></i> Ver Apenas Disponíveis
        </a>
    </div>

    <div class="table-responsive">
        <table class="table table-striped table-hover align-middle">
            <thead class="table-primary">
                <tr>
                    <th>ID</th>
                    <th>Título</th>
                    <th>Autor</th>
                    <th>Editora</th>
                    <th>Ano</th>
                    <th>ISBN</th>
                    <th>Qtd</th>
                    <th>Categoria</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
            <%
                List<Livro> livros = (List<Livro>) request.getAttribute("livros");
                if (livros != null && !livros.isEmpty()) {
                    for (Livro l : livros) {
            %>
                <tr>
                    <td><%= l.getId() %></td>
                    <td><%= l.getTitulo() %></td>
                    <td><%= l.getAutor() %></td>
                    <td><%= l.getEditora() %></td>
                    <td><%= l.getAnoPublicacao() %></td>
                    <td><%= l.getIsbn() %></td>
                    <td><%= l.getQuantidadeDisponivel() %></td>
                    <td><%= l.getCategoria() %></td>
                    <td>
                        <a href="<%= request.getContextPath() %>/livro?acao=editar&id=<%= l.getId() %>" class="btn btn-sm btn-warning mb-1">
                            <i class="fas fa-pen"></i> Editar
                        </a>
                        <a href="<%= request.getContextPath() %>/livro?acao=excluir&id=<%= l.getId() %>" 
                           class="btn btn-sm btn-danger"
                           onclick="return confirm('Deseja excluir este livro?');">
                            <i class="fas fa-trash"></i> Excluir
                        </a>
                    </td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="9" class="text-center">Nenhum livro encontrado.</td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

    <div class="mt-4">
        <a href="<%= request.getContextPath() %>/view/livro/cadastro.jsp" class="btn btn-success">
            <i class="fas fa-plus"></i> Cadastrar Novo Livro
        </a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>