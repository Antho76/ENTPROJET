<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }

        h1 {
            margin-bottom: 20px;
        }

        form {
            margin-bottom: 10px;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <% 
        int auth = (int) request.getAttribute("auth");
        if (auth != 1){response.sendRedirect("test.jsp");};
    %>
    <h1>Bienvenue sur la page d'administration</h1>
    
    <form action="ServletCentrale" method="post">
        <button type="submit" name="action" value="createUserPage">Cr�er un utilisateur</button>
    </form>

    <form action="ServletCentrale" method="post">
        <button type="submit" name="action" value="AddNotePage">Ajouter une note</button>
    </form>

    <form action="ServletCentrale" method="get">
        <button type="submit" name="action" value="affichageStudent">Liste des �tudiants</button>
    </form>

    <form action="ServletCentrale" method="get">
        <button type="submit" name="action" value="affichageEvaluations">Afficher les �valuations</button>
    </form>

    <form action="ServletCentrale" method="get">
        <button type="submit" name="action" value="DisplayNotes">Afficher toutes les notes</button>
    </form>
</body>
</html>
