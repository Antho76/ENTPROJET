<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>�l�ve Page</title>
</head>
<body>
    <h1>Cr�ation d'un utilisateur</h1>
    <!-- Ajoutez ici le contenu sp�cifique pour les �l�ves -->
</body>

<form action="ServletCentrale" method="post">

<label for="nom">Nom :</label>
    <input type="text" name="nom" required><br>

    <label for="prenom">Pr�nom :</label>
    <input type="text" name="prenom" required><br>

    <label for="specialite">Specialite :</label>
    <input type="text" name="specialite" required><br>

    <label for="INE">INE :</label>
    <input type="text" name="INE" required><br>
    <
    <button type="submit" name="action" value="CreateStudent">Cr�ation</button>

</form>
</html>
