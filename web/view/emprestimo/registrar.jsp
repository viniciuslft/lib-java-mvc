<%-- 
    Document   : registrar
    Created on : 24 de mai. de 2025, 00:09:14
    Author     : Vinicius
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Usuario, model.Livro" %>
<%@ include file="../components/header.jsp" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Registrar Empréstimo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/view/assets/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500&display=swap" rel="stylesheet">
</head>

<body>
<div class="main-container">
    <div class="windows-explorer">
        <header class="windows-header" style="padding-right: 3px;">
            <span>Registrar Empréstimo</span>
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
                                <h2><img src="<%= request.getContextPath() %>/view/assets/icons/time_and_date-2.png" alt="" width="32" height="32"><br>Empréstimo</h2>
                                <p class="LogoLine"><img src="https://98.js.org/src/WEB//wvline.gif" width="100%" height="1px"></p>
                                <p>Escolha um usuário<br>e um livro para registrar.</p>
                            </div>
                            <div class="icon-main p-4">
                                <form action="<%= request.getContextPath() %>/emprestimo" method="post" class="row g-3">

                                    <div class="col-md-6">
                                        <label for="idUsuario" class="form-label">Usuário</label>
                                        <select id="idUsuario" name="idUsuario" required>
                                            <%
                                                List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
                                                for (Usuario u : usuarios) {
                                            %>
                                                <option value="<%= u.getId() %>"><%= u.getNome() %> (<%= u.getTipoUsuario() %>)</option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="idLivro" class="form-label">Livro</label>
                                        <select id="idLivro" name="idLivro" required>
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
                                        </select>
                                    </div>

                                    <div class="col-12 mt-3">
                                        <button type="submit" class="win98-button">
                                            <img src="<%= request.getContextPath() %>/view/assets/icons/save-1.png" alt="Salvar" width="16" height="16"> Registrar Empréstimo
                                        </button>
                                        <a href="<%= request.getContextPath() %>/emprestimo?acao=listar" class="win98-button ms-2">
                                            Voltar
                                        </a>
                                    </div>
                                </form>
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
            <div class="sprite gallery"></div>Registrando empréstimo
        </span>
        <span class="made-by">
            Feito por <a href="https://alexmeub.com/about/" target="_blank">Vinicius Pedroza</a>
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
