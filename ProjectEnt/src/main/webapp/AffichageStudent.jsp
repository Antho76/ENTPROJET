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

    label {
        margin-right: 10px;
    }

    select {
        padding: 5px;
    }

    button {
        padding: 5px 10px;
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
    if (auth != 1){response.sendRedirect("test.jsp");};
    %>
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
    
<!-- Correction du code du formulaire de tri -->
<form action="ServletCentrale" method="get">
    <!-- ... autres champs du formulaire ... -->

    <label for="specialite">Trier par spécialité:</label>
    <select name="specialite" id="specialite">
        <option value="">Toutes les spécialités</option>
        <option value="maçonnerie">Maçonnerie</option>
        <option value="info">Informatique</option>
        <!-- Ajouter d'autres options en fonction de vos spécialités -->
    </select>
    <button type="submit" name="action" value="triSpecialite">Trier</button>
</form>

</body>
</html>
