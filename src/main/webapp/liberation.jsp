<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Gestion des Réservations</title>
    <style>
        body {
            min-height: 100vh;
        }

        #container {
            display: flex;
            justify-content: flex-start;
        }

        .table-container {
            width: 100%;
            margin-left: 350px;
            padding: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #f4f4f4;
        }

        .form-container {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 20px;
        }

        .form-container input {
            padding: 8px;
            font-size: 14px;
            width: 200px;
        }

        .form-container button {
            padding: 10px 20px;
            font-size: 14px;
            background-color: #007BFF;
            color: #fff;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .form-container button:hover {
            background-color: #0056b3;
        }

        .form-container .danger {
            background-color: #f44336;
        }

        .form-container .danger:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
<div id="container">
    <!-- Sidebar -->
    <div class="d-flex flex-column flex-shrink-0 p-3" style="position: fixed; width: 350px; height: 900px; background-color: rgb(214, 95, 95);">
        <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
            <span class="fs-4">Professeur</span>
        </a>
        <hr>
        <ul class="nav nav-pills flex-column mb-auto">
            <li class="nav-item">
                <a href="#" id="Home" class="nav-link active" aria-current="page">Accueil</a>
            </li>
            <li>
                <a href="#" id="About" class="nav-link text-white">À propos</a>
            </li>
            <li>
                <a href="login.jsp" id="Logout" class="nav-link text-white">Déconnexion</a>
            </li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="table-container">
        <h2>Liste des Réservations</h2>
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Filière</th>
                <th>Matière</th>
                <th>Sujet</th>
                <th>Salle</th>
                <th>Créneaux</th>
                <th>Date Début</th>
                <th>Date Fin</th>
            </tr>
            </thead>
            <tbody>
            <%
                // Connexion à la base de données et récupération des données
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    java.sql.Connection conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/votre_base", "utilisateur", "motdepasse");
                    java.sql.Statement stmt = conn.createStatement();
                    java.sql.ResultSet rs = stmt.executeQuery("SELECT * FROM reservation");

                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("filiere") %></td>
                <td><%= rs.getString("matiere") %></td>
                <td><%= rs.getString("sujet") %></td>
                <td><%= rs.getString("salle") %></td>
                <td><%= rs.getString("creneaux") %></td>
                <td><%= rs.getDate("dateDebut") %></td>
                <td><%= rs.getDate("dateFin") %></td>
                <td>
                    <input type="radio" name="selectedReservation" value="<%= rs.getInt("id") %>">
                </td>
            </tr>
            <%
                    }
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
            </tbody>
        </table>

        <!-- Formulaire pour libération -->
        <div class="form-container">
            <button type="submit" onclick="liberationDefinitive()">Libération Définitive</button>
            <button type="submit" class="danger" onclick="liberationExceptionnelle()">Libération Exceptionnelle</button>
            <input type="datetime-local" id="startDate" name="startDate" placeholder="Date de Début">
            <input type="datetime-local" id="endDate" name="endDate" placeholder="Date de Fin">
        </div>
    </div>
</div>

<script>
    function liberationDefinitive() {
        const selected = document.querySelector('input[name="selectedReservation"]:checked');
        if (!selected) {
            alert("Veuillez sélectionner une réservation !");
            return;
        }
        const reservationId = selected.value;
        window.location.href = `liberationDefinitive.jsp?id=${reservationId}`;
    }

    function liberationExceptionnelle() {
        const selected = document.querySelector('input[name="selectedReservation"]:checked');
        if (!selected) {
            alert("Veuillez sélectionner une réservation !");
            return;
        }
        const reservationId = selected.value;
        const startDate = document.getElementById("startDate").value;
        const endDate = document.getElementById("endDate").value;

        if (!startDate || !endDate) {
            alert("Veuillez remplir la durée de début et de fin !");
            return;
        }
        window.location.href = `liberationExceptionnelle.jsp?id=${reservationId}&startDate=${startDate}&endDate=${endDate}`;
    }
</script>
</body>
</html>
