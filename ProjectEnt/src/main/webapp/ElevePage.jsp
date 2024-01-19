<%@ page import="com.classes.*" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="com.classes.Matiere" %>
<%@ page import="com.classes.Module" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Élève Page</title>
    
      <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h1 {
            color: #333;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        h2 {
            margin-top: 20px;
            color: #333;
        }

        p {
            color: #666;
        }

        form {
            margin-top: 20px;
        }

        label {
            margin-right: 10px;
        }

        select, button {
            padding: 8px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<% 
    int auth = (int) request.getAttribute("auth");
    if (auth != 2){response.sendRedirect("test.jsp");};
%>

<h1>Bienvenue sur la page des élèves</h1>
<!-- Ajoutez ici le contenu spécifique pour les élèves -->

<!-- Afficher les notes de l'étudiant -->
<%
    List<Notes> notesEtudiant = (List<Notes>) request.getAttribute("notesEtudiant");
%>

<% if (notesEtudiant != null && !notesEtudiant.isEmpty()) { 
			List<Notes> notes = (List<Notes>) request.getAttribute("notes");
                List<Etudiant> etudiants = (List<Etudiant>) request.getAttribute("etudiants");
                Map<String, String> etudiantMap = new HashMap<>();
                
                // Remplir la map avec les noms et prénoms des étudiants
                for (Etudiant etudiant : etudiants) {
                    etudiantMap.put(etudiant.getIne(), etudiant.getNom() + " " + etudiant.getPrenom());
                }
                
                List<Module> modulesList = (List<Module>) request.getAttribute("modules");
                Map<Integer, String> moduleIdToName = new HashMap<>();
                Map<Integer, Map<Integer, String>> moduleIdToMatiereIdToName = new HashMap<>();
                
                // Remplir les maps avec les noms des modules et matières
                for (Module module : modulesList) {
                    moduleIdToName.put(module.getId(), module.getNom());
                    
                    Map<Integer, String> matiereIdToName = new HashMap<>();
                    for (Matiere matiere : module.getMatieres()) {
                        matiereIdToName.put(matiere.getId(), matiere.getNom());
                    }
                    
                    moduleIdToMatiereIdToName.put(module.getId(), matiereIdToName);
                }%>
    <h2>Notes de l'étudiant</h2>
    <table border="1">
        <tr>
            <th>Matière</th>
            <th>Module</th>
            <th>Semestre</th>
            <th>Note</th>
        </tr>
        <% 
        for (Notes note : notesEtudiant) { %>
            <tr>
<td>
                            <% 
                                Map<Integer, String> matiereMap = moduleIdToMatiereIdToName.get(note.getModule());
                                if (matiereMap != null) {
                                    String matiereNom = matiereMap.get(note.getMatiere());
                                    if (matiereNom != null) {
                                        out.print(matiereNom);
                                    } else {
                                        out.print("Matière introuvable");
                                    }
                                } else {
                                    out.print("Module introuvable");
                                }
                            %>
                        </td>                         <td><%= moduleIdToName.get(note.getModule()) %></td>
                <td><%= note.getSemestre() %></td>
                <td><%= note.getValeur() %></td>
            </tr>
        <% } %>
    </table>
<% } else { %>
    <p>Aucune note disponible pour cet étudiant.</p>
<% } %>

    <form action="ServletCentrale" method="post">
        <label for="module">Trier par Module :</label>
        <select name="module">
            <option value="">Tous les modules</option>
            <% for (Module module : (List<Module>) request.getAttribute("modules")) { %>
                <option value="<%= module.getId() %>"><%= module.getNom() %></option>
            <% } %>
        </select>

        <label for="sort">Trier par Note :</label>
        <select name="sort" id="sort">
            <option value="asc">Ascendant</option>
            <option value="desc">Descendant</option>
        </select>

        <label for="sortSemestre">Trier par Semestre :</label>
        <select name="sortSemestre" id="sortSemestre">
            <option value="">Tous les semestres</option>
            <%-- Boucle pour afficher chaque semestre existant --%>
            <%
                Set<Integer> semestres = new HashSet<>();
                for (Notes note : notesEtudiant) {
                    semestres.add(note.getSemestre());
                }

                for (Integer semestre : semestres) {
            %>
                <option value="<%= semestre %>"><%= semestre %></option>
            <%
                }
            %>
        </select>

        <button type="submit" name="action" value="triModuleEl">Trier</button>
    </form>
<form action="ServletCentrale" method="post">
    <button type="submit" name="action" value="addEvaluation">Ajouter une évaluation</button>
</form>

</body>
</html>
