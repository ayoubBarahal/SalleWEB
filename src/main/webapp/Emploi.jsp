<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 23/11/2024
  Time: 12:19
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <title>Coordinateur Filiere Interface</title>
  <style>
    body {
      min-height: 100vh;
    }

    main {
      height: 400px;
      max-height: 100vh;
      overflow-x: auto;
      overflow-y: hidden;
    }

    #Home {
      background-color: #0d6efd;
    }
    #Logout:hover {
      background-color: #0d6efd;
    }
    [data-bs-theme="dark"] .btn-toggle::before {
      content: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='rgba%28255,255,255,.5%29' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M5 14l6-6-6-6'/%3e%3c/svg%3e");
    }
    .btn-toggle-nav a {
      padding: .1875rem .5rem;
      margin-top: .125rem;
      margin-left: 1.25rem;
    }
    .btn-toggle-nav a:hover,
    .btn-toggle-nav a:focus {
      background-color: var(--bs-tertiary-bg);
    }


    #About:hover{
      background-color: #0d6efd;
    }

    #container{
      display: flex;
      justify-content:flex-start;
    }

    .reservation-container {
      width: 100%;
      margin-left: 350px;
      max-width: 500px;
      background-color: white;
      padding: 30px;
      border-radius: 10px;
    }

    .reservation-container h2 {
      text-align: center;
      margin-bottom: 20px;
      font-size: 24px;
      color: #333;
    }

    .form-group {
      margin-bottom: 20px;
      text-align: left;
    }

    .form-group label {
      display: block;
      margin-bottom: 8px;
      font-weight: bold;
      color: #555;
    }

    .form-group input {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 14px;
    }

    .form-group input:focus {
      border-color: #4CAF50;
      outline: none;
    }


    .form-buttons button {
      padding: 10px 20px;
      font-size: 16px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .form-buttons button.add {
      background-color: #4CAF50;
      color: white;
    }

    .form-buttons button.add:hover {
      background-color: #45a049;
    }

    .form-buttons button.reset {
      background-color: #f44336;
      color: white;
    }

    .form-buttons button.reset:hover {
      background-color: #d32f2f;
    }

    .table th, .table td {
      text-align: center;
      vertical-align: middle;
    }
    .table {
      width: 70%;
      margin-top: 20px;
      margin-left: 400px;
    }
    .btn-create {
      margin-top: 20px;
    }
    .day-column {
      width: 12.5%; /* 100% / 8 hours = 12.5% per column */
    }
    .time-column {
      width: 12.5%;
    }


  </style>
</head>
<body>
  <div id="container">
  <div class="d-flex flex-column flex-shrink-0 p-3" style="position: fixed; width: 350px; height: 900px; background-color: rgb(214, 95, 95);">
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
      <span class="fs-4">Coordinateur Name</span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item">
        <a href="#" id="Home" class="nav-link active" aria-current="page">Filières</a>
      </li>
      <li>
        <a href="#" id="About" onclick="changecolor()" class="nav-link text-white">Emplois du Temps</a>
      </li>
      <li>
        <a href="login.jsp" id="Logout" class="nav-link text-white">Logout</a>
      </li>
    </ul>

  </div>
  </div>

  <h2 class="text-center mt-4">Emploi du Temps</h2>



  <table class="table table-bordered mt-4">
    <thead>
    <tr>
      <th class="time-column">Horaire</th>
      <th class="day-column">Lundi</th>
      <th class="day-column">Mardi</th>
      <th class="day-column">Mercredi</th>
      <th class="day-column">Jeudi</th>
      <th class="day-column">Vendredi</th>
      <th class="day-column">Samedi</th>
      <th class="day-column">Dimanche</th>
    </tr>
    </thead>
    <tbody>
    <%-- Display time slots from 8:00 to 12:00 --%>
    <tr>
      <td>8h - 9h</td>
      <td>${emploiLundi8}</td>
      <td>${emploiMardi8}</td>
      <td>${emploiMercredi8}</td>
      <td>${emploiJeudi8}</td>
      <td>${emploiVendredi8}</td>
      <td>${emploiSamedi8}</td>
      <td>${emploiDimanche8}</td>
    </tr>
    <tr>
      <td>9h - 10h</td>
      <td>${emploiLundi9}</td>
      <td>${emploiMardi9}</td>
      <td>${emploiMercredi9}</td>
      <td>${emploiJeudi9}</td>
      <td>${emploiVendredi9}</td>
      <td>${emploiSamedi9}</td>
      <td>${emploiDimanche9}</td>
    </tr>
    <tr>
      <td>10h - 11h</td>
      <td>${emploiLundi10}</td>
      <td>${emploiMardi10}</td>
      <td>${emploiMercredi10}</td>
      <td>${emploiJeudi10}</td>
      <td>${emploiVendredi10}</td>
      <td>${emploiSamedi10}</td>
      <td>${emploiDimanche10}</td>
    </tr>
    <tr>
      <td>11h - 12h</td>
      <td>${emploiLundi11}</td>
      <td>${emploiMardi11}</td>
      <td>${emploiMercredi11}</td>
      <td>${emploiJeudi11}</td>
      <td>${emploiVendredi11}</td>
      <td>${emploiSamedi11}</td>
      <td>${emploiDimanche11}</td>
    </tr>

    <%-- Display time slots from 2:00 PM to 6:00 PM --%>
    <tr>
      <td>14h - 15h</td>
      <td>${emploiLundi14}</td>
      <td>${emploiMardi14}</td>
      <td>${emploiMercredi14}</td>
      <td>${emploiJeudi14}</td>
      <td>${emploiVendredi14}</td>
      <td>${emploiSamedi14}</td>
      <td>${emploiDimanche14}</td>
    </tr>
    <tr>
      <td>15h - 16h</td>
      <td>${emploiLundi15}</td>
      <td>${emploiMardi15}</td>
      <td>${emploiMercredi15}</td>
      <td>${emploiJeudi15}</td>
      <td>${emploiVendredi15}</td>
      <td>${emploiSamedi15}</td>
      <td>${emploiDimanche15}</td>
    </tr>
    <tr>
      <td>16h - 17h</td>
      <td>${emploiLundi16}</td>
      <td>${emploiMardi16}</td>
      <td>${emploiMercredi16}</td>
      <td>${emploiJeudi16}</td>
      <td>${emploiVendredi16}</td>
      <td>${emploiSamedi16}</td>
      <td>${emploiDimanche16}</td>
    </tr>
    <tr>
      <td>17h - 18h</td>
      <td>${emploiLundi17}</td>
      <td>${emploiMardi17}</td>
      <td>${emploiMercredi17}</td>
      <td>${emploiJeudi17}</td>
      <td>${emploiVendredi17}</td>
      <td>${emploiSamedi17}</td>
      <td>${emploiDimanche17}</td>
    </tr>

    </tbody>
  </table>
  </div>

  <div class="text-center">
    <button class="btn btn-primary btn-create" onclick="window.location.href='create_schedule.jsp'">Créer un emploi du temps</button>
  </div>



</body>
</html>
