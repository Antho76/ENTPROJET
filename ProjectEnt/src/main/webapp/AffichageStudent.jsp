<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Liste des �tudiants</title>
</head>
<body>
    <h2>Liste des �tudiants</h2>
    <%= request.getAttribute("etudiantsHtml") %>
</body>
</html>
