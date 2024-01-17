<%@ page import="com.classes.*" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
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
            <th>Semestre</th>
            <th>ID Etudiant</th>
            <th>Nom et Prénom</th>
        </tr>
        <%-- Boucle pour afficher chaque note --%>
        <% 
            List<Notes> notes = (List<Notes>) request.getAttribute("notes");
            List<Etudiant> etudiants = (List<Etudiant>) request.getAttribute("etudiants");
            Map<String, String> etudiantMap = new HashMap<>();
            
            // Remplir la map avec les noms et prénoms des étudiants
            for (Etudiant etudiant : etudiants) {
                etudiantMap.put(etudiant.getINE(), etudiant.getNom() + " " + etudiant.getPrenom());
            }
            
            for (Notes note : notes) { 
        %>
            <tr>
                <td><%= note.getValeur() %></td>
                <td><%= note.getModule() %></td>
                <td><%= note.getSemestre() %></td>
                <td><%= note.getINE() %></td>
				<td><%= etudiantMap.get(note.getINE()) %></td>
				
            </tr>
        <% } %>
    </table>
</body>
</html>
