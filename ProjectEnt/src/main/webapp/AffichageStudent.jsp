<%@ page import="com.classes.Etudiant" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Etudiants</title>
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
    <h2>Liste des Etudiants</h2>

    <table border="1">
        <tr>
            <th>Nom</th>
            <th>Prenom</th>
            <th>Specialite</th>
            <th>INE</th>
        </tr>
        <%-- Boucle pour afficher chaque etudiant --%>
        <% for (Etudiant etudiant : (List<Etudiant>)request.getAttribute("etudiants")) { %>
            <tr>
                <td><%= etudiant.getNom() %></td>
                <td><%= etudiant.getPrenom() %></td>
                <td><%= etudiant.getSpe() %></td>
                <td><%= etudiant.getIne() %></td>
            </tr>
        <% } %>
    </table>
</body>
</html>
