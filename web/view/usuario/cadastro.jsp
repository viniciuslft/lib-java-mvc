<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../components/header.jsp" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Usuário</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/view/assets/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500&display=swap" rel="stylesheet">
</head>

<body>

<div class="main-container">
    <div class="windows-explorer">
        <header class="windows-header" style="padding-right: 3px;">
            <span>Cadastrar Usuário</span>
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
                                <h2><img src="<%= request.getContextPath() %>/view/assets/icons/users-2.png" alt="" width="32" height="32"><br>Cadastrar</h2>
                                <p class="LogoLine"><img src="https://98.js.org/src/WEB//wvline.gif" width="100%" height="1px"></p>
                                <p>Preencha os dados<br>do novo usuário.</p>
                            </div>
                            <div class="icon-main p-4">
                                <form action="${pageContext.request.contextPath}/usuario" method="post" class="row g-3">

                                    <div class="col-md-6">
                                        <label for="nome" class="form-label">Nome</label>
                                        <input type="text" id="nome" name="nome" required>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="email" class="form-label">Email</label>
                                        <input type="email" id="email" name="email" required>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="telefone" class="form-label">Telefone</label>
                                        <input type="text" id="telefone" name="telefone">
                                    </div>

                                    <div class="col-md-6">
                                        <label for="endereco" class="form-label">Endereço</label>
                                        <input type="text" id="endereco" name="endereco">
                                    </div>

                                    <div class="col-md-6">
                                        <label for="tipoUsuario" class="form-label">Tipo de Usuário</label>
                                        <select id="tipoUsuario" name="tipoUsuario" required>
                                            <option value="">Selecione...</option>
                                            <option value="ESTUDANTE">Estudante</option>
                                            <option value="PROFESSOR">Professor</option>
                                            <option value="FUNCIONARIO">Funcionário</option>
                                        </select>
                                    </div>

                                    <div class="col-12 mt-3">
                                        <button type="submit" class="win98-button">
                                            <img src="<%= request.getContextPath() %>/view/assets/icons/save-1.png" alt="Cadastrar" width="16" height="16"> Cadastrar
                                        </button>
                                        <a href="<%= request.getContextPath() %>/usuario/listar" class="win98-button ms-2">
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
            <div class="sprite gallery"></div>Cadastro de usuário
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
