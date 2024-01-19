<%@ page import="com.classes.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.classes.Module" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter une Note</title>
        <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>

    <script>
        var modules = [
            <%                
           		List<Etudiant> etudantList = (List<Etudiant>)request.getAttribute("etudiants");
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
    <input type="number" name="note" required>

    <label for="module">Module :</label>
    <select name="module" required onchange="updateMatieres()">
        <% for (Module module : modulesList) { %>
            <option value="<%= module.getId() %>"><%= module.getNom() %></option>
        <% } %>
    </select>

    <label for="matiere">Matière :</label>
    <select name="matiere" required>
        <option value="" disabled selected>Choisissez d'abord un module</option>
    </select>

    <label for="semestre">Semestre :</label>
    <input type="number" name="semestre" required>

    <label for="INE">ID Etudiant :</label>
    <select name="INE" required>
        <option value="" disabled selected>Choisissez un ID Etudiant</option>
        <%
            for (Etudiant etudiant : etudantList) {
        %>
            <option value="<%= etudiant.getIne() %>"><%= etudiant.getIne() %></option>
        <%
            }
        %>
    </select>

    <button type="submit" name="action" value="AddNote">Ajouter la note</button>

</form>

</body>
</html>