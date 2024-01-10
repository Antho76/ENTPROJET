<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        label {
            display: block;
            margin: 10px 0;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<form action="ServletCentrale" method="post">
    <label for="userType">Choisir le type d'utilisateur:</label>
    <select id="userType" name="userType">
        <option value="admin">Admin</option>
        <option value="eleve">Élève</option>
    </select>

    <label for="username">Identifiant:</label>
    <input type="text" id="identifiant" name="identifiant" required>

    <label for="password">Mot de passe:</label>
    <input type="password" id="motdepasse" name="motdepasse" required>

    <button type="submit" name="action" value="connexion">Connexion</button>
</form>

</body>
</html>