<%@ page import="com.classes.*" %>
<%@ page import="com.classes.Module" %>

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
                <td><%= evaluation.getStrModule(evaluation.getMod()) %></td>
                <td><%= evaluation.getQualiSup() %></td>
                <td><%= evaluation.getQualiEq() %></td>
                <td><%= evaluation.getTravail() %></td>
                <td><%= evaluation.getCom() %></td>
            </tr>
        <% } %>
    </table>
    <form action="ServletCentrale" method="post">
        <label for="module">Trier par Module :</label>
        <select name="module">
            <option value="">Tous les modules</option>
            <% for (Module module : (List<Module>) request.getAttribute("modules")) { %>
                <option value="<%= module.getId() %>"><%= module.getNom() %></option>
            <% } %>
        </select>
                <button type="submit" name="action" value="triModuleEval">Trier</button>
    </form>
</body>
</html>
