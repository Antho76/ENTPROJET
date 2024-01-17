<%@ page import="com.classes.Notes" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Notes</title>
</head>
<body>
    <h2>Liste des Notes</h2>

    <table border="1">
        <tr>
            <th>Note</th>
            <th>Module</th>
            <th>Semestre</th>
            <th>ID Etudiant</th>
        </tr>
        <%-- Boucle pour afficher chaque note --%>
        <% for (Notes note : (List<Notes>)request.getAttribute("notes")) { %>
            <tr>
                <td><%= note.getValeur() %></td>
                <td><%= note.getModule() %></td>
                <td><%= note.getSemestre() %></td>
                <td><%= note.getINE() %></td>
            </tr>
        <% } %>
    </table>
</body>
</html>
