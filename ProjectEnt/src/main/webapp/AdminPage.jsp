<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
</head>
<body>
    <h1>Bienvenue sur la page d'administration</h1>
    <!-- Ajoutez ici le contenu spécifique pour les administrateurs -->
</body>

<form action="ServletCentrale" method="post">
    <button type="submit" name="action" value="createUserPage">Créer un utilisateur</button>
</form>

<style>

button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
</style>

</html>

