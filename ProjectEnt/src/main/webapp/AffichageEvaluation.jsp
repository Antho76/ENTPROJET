<%@ page import="com.classes.Evaluation" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Affichage des évaluations</title>
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
    </style>
</head>
<body>
    <h2>Liste des Evaluations</h2>

    <table>
        <tr>
            <th>Modulé évalué</th>
            <th>Qualité du support</th>
            <th>Qualité des équipes</th>
            <th>Temps de travail</th>
            <th>Commentaire</th>
        </tr>
        <%-- Boucle pour afficher chaque évaluation --%>
        <% for (Evaluation evaluation : (List<Evaluation>)request.getAttribute("evaluations")) { %>
            <tr>
                <td><%= evaluation.getStrMod(evaluation.getMod()) %></td>
                <td><%= evaluation.getQualiSup() %></td>
                <td><%= evaluation.getQualiEq() %></td>
                <td><%= evaluation.getTravail() %></td>
                <td><%= evaluation.getCom() %></td>
            </tr>
        <% } %>
    </table>
</body>
</html>
