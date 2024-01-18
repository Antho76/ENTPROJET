<%@ page import="com.classes.*" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
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
        }
        h2 {
            color: #333;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
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
        <%-- Boucle pour afficher chaque note --%>
        <%-- Boucle pour afficher chaque note --%>
<% 
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
<% } %>
    </table>
</body>
</html>
