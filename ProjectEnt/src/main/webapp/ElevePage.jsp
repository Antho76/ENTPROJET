<%@ page import="com.classes.*" %>
<%@ page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Élève Page</title>
</head>
<body>
<% 
    int auth = (int) request.getAttribute("auth");
    if (auth != 2){response.sendRedirect("test.jsp");};
%>

<h1>Bienvenue sur la page des élèves</h1>
<!-- Ajoutez ici le contenu spécifique pour les élèves -->

<!-- Afficher les notes de l'étudiant -->
<%
    List<Notes> notesEtudiant = (List<Notes>) request.getAttribute("notesEtudiant");
%>

<% if (notesEtudiant != null && !notesEtudiant.isEmpty()) { %>
    <h2>Notes de l'étudiant</h2>
    <table border="1">
        <tr>
            <th>Matière</th>
            <th>Module</th>
            <th>Semestre</th>
            <th>Note</th>
        </tr>
        <% for (Notes note : notesEtudiant) { %>
            <tr>
                <td><%= note.getMatiere() %></td>
                <td><%= note.getModule() %></td>
                <td><%= note.getSemestre() %></td>
                <td><%= note.getValeur() %></td>
            </tr>
        <% } %>
    </table>
<% } else { %>
    <p>Aucune note disponible pour cet étudiant.</p>
<% } %>

<form action="ServletCentrale" method="post">
    <button type="submit" name="action" value="addEvaluation">Ajouter une évaluation</button>
</form>

</body>
</html>
