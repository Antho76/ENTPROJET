<%@ page import="com.classes.Etudiant" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Etudiants</title>
</head>
<body>
    <h2>Liste des Etudiants</h2>

    <table border="1">
        <tr>
            <th>Nom</th>
            <th>Prenom</th>
            <th>Specialite</th>
            <th>INEt</th>
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
