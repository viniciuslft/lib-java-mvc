<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/view/assets/css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500&display=swap" rel="stylesheet">

<div class="header-all text-white p-3 mb-4 d-flex align-items-center justify-content-between">
    <div class="text-white text-decoration-none d-flex align-items-center gap-3">
      
        <img src="<%= request.getContextPath() %>/view/assets/img/teste.jpg" alt="Logo Claretiano" height="40">
        <h4 class="glitch m-0" data-text="MVC">MVC</h4>
    </div>
    <button class="btn btn-outline-light btn-sm" data-bs-toggle="modal" data-bs-target="#infoModal">
        <i class="fas fa-circle-info"></i>
    </button>
</div>

<div class="modal fade" id="infoModal" tabindex="-1" aria-labelledby="infoModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="infoModalLabel">Informações do Projeto</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
      </div>
      <div class="modal-body">
        <p><strong>Disciplina:</strong> Desenvolvimento Web com Java</p>
        <p><strong>Projeto:</strong> Sistema de Gerenciamento de Biblioteca</p>
        <p><strong>Aluno:</strong> Vinicius</p>
        <p><strong>Professor:</strong> Pablo Rodrigues</p>
        <p>Este sistema foi desenvolvido como atividade prática acadêmica utilizando Java, JSP, Servlets e Bootstrap com padrão MVC.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
