<%@ page import="com.classes.Evaluation" %>
<%@ page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Affichage des évaluations</title>
</head>
<body>
    <h2>Liste des Evaluations</h2>

    <table border="1">
        <tr>
            <th>Modulé évalué</th>
            <th>Qualité du support</th>
            <th>Qualité des équipes</th>
            <th>Temps de travail</th>
            <th>Commentaire</th>
            
        </tr>
        <%-- Boucle pour afficher chaque etudiant --%>
        <% for (Evaluation evaluation : (List<Evaluation>)request.getAttribute("evaluations")) { %>
            <tr>
                <td><%= evaluation.getMod() %></td>
                <td><%= evaluation.getQualiSup() %></td>
                <td><%= evaluation.getQualiEq() %></td>
                <td><%= evaluation.getTravail() %></td>
                <td><%= evaluation.getCom() %></td>
            </tr>
        <% } %>
    </table>
</body>
</html>