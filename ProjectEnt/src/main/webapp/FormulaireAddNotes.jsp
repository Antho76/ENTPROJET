<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body></body>
<form action="ServletCentrale" method="post">

<label for="nom">note :</label>
    <input type="number" name="note" required><br>

    <label for="prenom">module :</label>
    <input type="text" name="module" required><br>

    <label for="specialite">semestre :</label>
    <input type="number" name="semestre" required><br>

    <label for="INE">id Etudiant :</label>
    <input type="number" name="INE" required><br>
    
    <button type="submit" name="action" value="AddNote">Ajouter la note</button>

</form>
</html>

