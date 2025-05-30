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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/view/assets/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500&display=swap" rel="stylesheet">
</head>

<body>

<div class="main-container">
    <div class="windows-explorer">
        <header class="windows-header" style="padding-right: 3px;">
            <span>Lista de Livros</span>
            <button class="windows-button" style="padding:0; height:16px;width:16px;position:relative;">
                <img src="<%= request.getContextPath() %>/view/assets/icons/close-icon.png" alt="" style="position:absolute;left:1px;top:0px;">
            </button>
            <button class="windows-button" style="padding:0; height:16px;width:16px;position:relative;margin-right:3px;">
                <img src="<%= request.getContextPath() %>/view/assets/icons/question-icon.png" alt="" style="position:absolute;left:1px;top:0px;">
            </button>
        </header>
        <div class="windows-explorer-content">
            <div class="icon-wrap">
                <div class="icone-outer-container">
                    <div class="icon-inner-container">
                        <div class="icon-layout">
                            <div class="icon-sidebar">
                                <h2><img src="<%= request.getContextPath() %>/view/assets/icons/help_book_cool-4.png" alt="" width="32" height="32"><br>Livros</h2>
                                <p class="LogoLine"><img src="https://98.js.org/src/WEB//wvline.gif" width="100%" height="1px"></p>
                                <p>Busque, edite ou exclua<br>os livros do acervo.</p>
                            </div>
                            <div class="icon-main">
                                <form action="<%= request.getContextPath() %>/livro" method="get">
                                    <input type="hidden" name="acao" value="buscar" />
                                    <div class="toolbar address-style-bar">
                                        <div class="toolbar-drag-handle"></div>
                                        <label for="address">Buscar por título, autor ou categoria</label>
                                        <div id="address-compound-input" class="inset-deep">
                                            <img id="address-icon" width="16" height="16" src="<%= request.getContextPath() %>/view/assets/icons/search_directory-2.png" alt="Ícone de busca">
                                            <input type="text" id="address" name="termo"
                                                value="<%= request.getAttribute("termoBuscado") != null ? request.getAttribute("termoBuscado") : "" %>">
                                        </div>
                                        <button class="win98-button" type="submit">Buscar</button>
                                        <button class="win98-button" type="button" onclick="window.location.href='<%= request.getContextPath() %>/livro?acao=listar'">Limpar</button>
                                    </div>
                                </form>

                                <div class="mb-3">
                                    <a href="<%= request.getContextPath() %>/livro?acao=disponiveis" class="win98-button">
                                        <img src="<%= request.getContextPath() %>/view/assets/icons/time_and_date-2.png" alt="Ver Disponíveis" width="16" height="16"> Ver Apenas Disponíveis
                                    </a>
                                </div>

                                <div class="table-responsive">
                                    <table class="win98-table">
                                        <thead>
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
                                                    <a class="win98-button" title="Editar" href="<%= request.getContextPath() %>/livro?acao=editar&id=<%= l.getId() %>">
                                                        <img src="<%= request.getContextPath() %>/view/assets/icons/desktop_old-0.png" alt="Editar" width="16" height="16">
                                                    </a>
                                                    <a class="win98-button" title="Excluir" href="<%= request.getContextPath() %>/livro?acao=excluir&id=<%= l.getId() %>" onclick="return confirm('Deseja excluir este livro?');">
                                                        <img src="<%= request.getContextPath() %>/view/assets/icons/msg_error-2.png" alt="Excluir" width="16" height="16">
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
                                    <a href="<%= request.getContextPath() %>/view/livro/cadastro.jsp" class="win98-button">
                                        <i class="fa-solid fa-book"></i> Cadastrar Novo Livro
                                    </a>
                                </div>
                            </div> <!-- icon-main -->
                        </div> <!-- icon-layout -->
                    </div> <!-- icon-inner-container -->
                </div> <!-- icone-outer-container -->
            </div> <!-- icon-wrap -->
        </div> <!-- windows-explorer-content -->
    </div> <!-- windows-explorer -->

    <div id="doom-window" class="windows-explorer" style="display: none; margin-top: 20px;">
        <header class="windows-header">
            <span>DOOM 95</span>
            <button class="windows-button" id="close-doom-btn" style="height: 16px; width: 16px; padding: 0; position: relative;">
                <img src="<%= request.getContextPath() %>/view/assets/icons/close-icon.png" style="position: absolute; left: 1px; top: 0px;" alt="Fechar">
            </button>
        </header>
        <div class="windows-explorer-content" style="padding: 10px;">
            <div class="dosbox-container" id="doom-box"></div>
        </div>
    </div>

    <div class="start-bar">
        <a href="<%= request.getContextPath() %>/index.html" title="Start Menu" class="button start-button-wrapper js-start-button">
            <div class="start-button"></div>
        </a>
        <span class="start-bar-window">
            <div class="sprite gallery"></div>Livros
        </span>
        <span class="made-by">
            Feito por <a href="https://github.com/viniciuslft" target="_blank">Vinicius Pedroza</a>
        </span>
    </div>
</div>

    <div class="ui-desktop">
        <div class="recycle-bin ui-icon">
            <div class="ui-icon-container">
                <img width="32" height="32" src="<%= request.getContextPath() %>/view/assets/icons/recycle_bin_empty-2.png" alt="">
                <span style="color: white;">Recycle Bin</span>
            </div>
        </div>
        <div class="doom ui-icon">
            <div class="ui-icon-container">
                <img width="32" height="32" src="<%= request.getContextPath() %>/view/assets/icons/doom95.png" alt="">
                <span style="color: white;">DOOM 95</span>
            </div>
        </div>
    </div>

    <script src="https://js-dos.com/cdn/js-dos-api.js"></script>
    <script>
        let dosboxInstance = null;
        const doomIcon = document.querySelector(".doom");
        const doomWindow = document.getElementById("doom-window");
        const doomBox = document.getElementById("doom-box");
        const closeDoomBtn = document.getElementById("close-doom-btn");

        doomIcon.addEventListener("click", () => {
            doomWindow.style.display = "block";
            if (dosboxInstance !== null) return;
            dosboxInstance = new Dosbox({
            id: "doom-box",
            onload: function (dosbox) {
                dosbox.run("<%= request.getContextPath() %>/view/assets/game/DOOM-@evilution.zip", "DOOM/DOOM.EXE");
            },
            onrun: function (dosbox, app) {
                console.log("DOOM started: " + app);
            }
            });
        });
        closeDoomBtn.addEventListener("click", () => {
            doomWindow.style.display = "none";
            if (dosboxInstance) {
                dosboxInstance.stop();
                dosboxInstance = null;
            }
            doomBox.innerHTML = "";
        });

    </script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
