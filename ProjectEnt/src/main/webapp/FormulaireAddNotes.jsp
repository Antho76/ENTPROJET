<%@ page import="com.classes.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.classes.Module" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter une Note</title>

    <script>
        var modules = [
            <%
                List<Module> modulesList = (List<Module>)request.getAttribute("modules");
                for (int i = 0; i < modulesList.size(); i++) {
                    Module module = modulesList.get(i);
            %>
                {
                    id: <%= module.getId() %>,
                    nom: '<%= module.getNom() %>',
                    matieres: [
                        <%
                            Matiere[] matieres = module.getMatieres();
                            for (int j = 0; j < matieres.length; j++) {
                                Matiere matiere = matieres[j];
                        %>
                            {
                                id: <%= matiere.getId() %>,
                                nom: '<%= matiere.getNom() %>'
                            }<%= (j < matieres.length - 1) ? "," : "" %>
                        <%
                            }
                        %>
                    ]
                }<%= (i < modulesList.size() - 1) ? "," : "" %>
            <%
                }
            %>
        ];

        function updateMatieres() {
            var moduleSelect = document.getElementsByName("module")[0];
            var matiereSelect = document.getElementsByName("matiere")[0];

            // Récupérer le module sélectionné
            var selectedModuleId = moduleSelect.value;

            // Récupérer la liste des matières correspondant au module
            var selectedModule = modules.find(module => module.id == selectedModuleId);
            var selectedModuleMatieres = selectedModule ? selectedModule.matieres : [];

            // Mettre à jour la liste déroulante des matières
            matiereSelect.innerHTML = "";
            selectedModuleMatieres.forEach(function(matiere) {
                var option = document.createElement("option");
                option.value = matiere.id;
                option.text = matiere.nom;
                matiereSelect.add(option);
            });
        }

        // Appeler la fonction au chargement de la page pour mettre à jour les matières si un module est déjà sélectionné
        document.addEventListener("DOMContentLoaded", updateMatieres);
    </script>
</head>
<body>
<% 
    int auth = (int) request.getAttribute("auth");
    if (auth != 1){response.sendRedirect("test.jsp");};
    %>
<form action="ServletCentrale" method="post">

    <label for="note">Note :</label>
    <input type="number" name="note" required><br>

    <label for="module">Module :</label>
    <select name="module" required onchange="updateMatieres()">
        <% for (Module module : modulesList) { %>
            <option value="<%= module.getId() %>"><%= module.getNom() %></option>
        <% } %>
    </select><br>

    <label for="matiere">Matière :</label>
    <select name="matiere" required>
        <option value="" disabled selected>Choisissez d'abord un module</option>
        <!-- Aucune boucle ici car la mise à jour se fait via JavaScript -->
    </select><br>

    <label for="semestre">Semestre :</label>
    <input type="number" name="semestre" required><br>

    <label for="INE">ID Etudiant :</label>
    <input type="number" name="INE" required><br>


</form>

</body>
</html>
