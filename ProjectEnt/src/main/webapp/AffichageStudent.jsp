<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Liste des Étudiants</title>
</head>
<body>
    <h2>Liste des Étudiants</h2>
    <%= request.getAttribute("etudiantsHtml") %>
</body>
</html>
