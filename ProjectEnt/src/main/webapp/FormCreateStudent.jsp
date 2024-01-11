<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Élève Page</title>
</head>
<body>
    <h1>Création d'un utilisateur</h1>
    <!-- Ajoutez ici le contenu spécifique pour les élèves -->
</body>

<form action="ServletCentrale" method="post">

<label for="nom">Nom :</label>
    <input type="text" name="nom" required><br>

    <label for="prenom">Prénom :</label>
    <input type="text" name="prenom" required><br>

    <label for="specialite">Specialite :</label>
    <input type="text" name="specialite" required><br>

    <label for="INE">INE :</label>
    <input type="text" name="INE" required><br>
    <
    <button type="submit" name="action" value="CreateStudent">Création</button>

</form>
</html>
