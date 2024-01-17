<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="classes.Etudiant" %>
<html>
<head>
    <title>Liste des Étudiants</title>
</head>
<body>
    <h2>Liste des Étudiants</h2>
    <ul>
        <% 
        List<Etudiant> etudiants = (List<Etudiant>) request.getAttribute("listeEtudiants");
        if(etudiants != null) {
            for(Etudiant etudiant : etudiants) {
                out.println("<li>" + etudiant + "</li>");
            }
        }
        %>
    </ul>
</body>
</html>
