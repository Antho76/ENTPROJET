<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
    body {
      font-family: 'Arial', sans-serif;
      margin: 20px;
      padding: 20px;
      background-color: #f4f4f4;
    }

    h1 {
      text-align: center;
    }

    form {
      max-width: 600px;
      margin: 0 auto;
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    label {
      display: block;
      margin-bottom: 10px;
    }

    input[type="checkbox"],
    input[type="radio"] {
      margin-right: 5px;
    }

    input[type="submit"] {
      background-color: #007bff;
      color: #fff;
      padding: 10px 15px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    input[type="submit"]:hover {
      background-color: #0056b3;
    }
</style>
</head>

<body>
<% 
    int auth = (int) request.getAttribute("auth");
    if (auth != 2){response.sendRedirect("test.jsp");};
    %>
  <h1>Evaluation de module</h1><br>
  <form>
  
  <label>Module évalué :</label>
    <label>
      <input type="radio" name="module" value="0"> Littéraire
    </label>
    <label>
      <input type="radio" name="module" value="1"> Mathématiques
    </label>
    <label>
      <input type="radio" name="module" value="2"> Informatique
    </label>
    <br>
    
  <label>Qualité du support :</label>
    <label>
      <input type="radio" name="qualisup" value="5"> Très bon
    </label>
    <label>
      <input type="radio" name="qualisup" value="4"> Bon
    </label>
    <label>
      <input type="radio" name="qualisup" value="3"> Moyen
    </label>
    <label>
      <input type="radio" name="qualisup" value="2"> Mauvais
    </label>
    <label>
      <input type="radio" name="qualisup" value="1"> Très mauvais
    </label><br>

	<label>Qualité de l'équipe :</label>
    <label>
      <input type="radio" name="qualieq" value="5"> Très bon
    </label>
    <label>
      <input type="radio" name="qualieq" value="4"> Bon
    </label>
    <label>
      <input type="radio" name="qualieq" value="3"> Moyen
    </label>
    <label>
      <input type="radio" name="qualieq" value="2"> Mauvais
    </label>
    <label>
      <input type="radio" name="qualieq" value="1"> Très mauvais
    </label><br>
    
    <label>Temps de travail :</label>
    <label>
      <input type="radio" name="travail" value="5"> Beaucoup
    </label>
    <label>
      <input type="radio" name="travail" value="4"> Raisonnable
    </label>
    <label>
      <input type="radio" name="travail" value="3"> Moyen
    </label>
    <label>
      <input type="radio" name="travail" value="2"> Peu
    </label>
    <label>
      <input type="radio" name="travail" value="1"> Pas
    </label><br>	
	<label>Votre commentaire :</label>
    <input type="text" name="com" required><br>
    <br>
    <input type="submit" name ="action" value="Evaluate">
  </form>
</body>
</html>
