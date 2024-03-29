<%@ page import="com.classes.*" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="com.classes.Matiere" %>
<%@ page import="com.classes.Module" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Notes des élèves</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        h2 {
            color: #333;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        form {
            margin-top: 20px;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            font-weight: bold;
            margin-right: 10px;
        }
        select {
            padding: 8px;
            margin-right: 20px;
        }
        button {
            padding: 10px 20px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
<% 
    int auth = (int) request.getAttribute("auth");
    if (auth != 1){response.sendRedirect("test.jsp");};
    %>
    <h2>Liste des Notes</h2>

    <table>
        <tr>
            <th>Note</th>
            <th>Module</th>
            <th>Matiere</th>
            <th>Semestre</th>
            <th>ID Etudiant</th>
            <th>Nom et Prénom</th>
        </tr>
        <%-- Vérification pour notes non nulles et non vides --%>
        <%
            List<Notes> notes = (List<Notes>) request.getAttribute("notes");
            if (notes != null && !notes.isEmpty()) {
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
                }
                
                for (Notes note : notes) { 
        %>
                    <tr>
                        <td><%= note.getValeur() %></td>
                        <td><%= moduleIdToName.get(note.getModule()) %></td>
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
                        </td> 
                        <td><%= note.getSemestre() %></td>
                        <td><%= note.getINE() %></td>
                        <td><%= etudiantMap.get(note.getINE()) %></td>
                    </tr>
                <% } // Fin de la boucle for
            } else {
                // Aucune note à afficher
                out.print("<tr><td colspan='6'>Aucune note à afficher</td></tr>");
            }
        %>
    </table>
    <!-- Formulaire de tri par module -->
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
                for (Notes note : notes) {
                    semestres.add(note.getSemestre());
                }

                for (Integer semestre : semestres) {
            %>
                <option value="<%= semestre %>"><%= semestre %></option>
            <%
                }
            %>
        </select>

        <button type="submit" name="action" value="triModule">Trier</button>
    </form>
    <form action="ServletCentrale" method="post">
        <button type="submit" name="action" value="AddNotePage">ajouter une note</button>
    </form>
</body>
</html>
