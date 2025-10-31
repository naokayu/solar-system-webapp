<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="dao.PlanetDAO" %>
<%@ page import="model.Planet" %>

<%
    PlanetDAO dao = new PlanetDAO();
    List<Planet> planetList = dao.findAll();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>太陽系 惑星図鑑</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: radial-gradient(circle at top, #000010, #000);
            color: #fff;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        h1 {
            margin: 30px 0;
            color: #ffcc00;
            text-shadow: 0 0 10px #ffcc00;
        }

        /* 惑星カードをグリッド状に */
        .planet-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            padding: 20px;
        }

        .planet {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            padding: 20px;
            width: 180px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .planet:hover {
            transform: translateY(-8px);
            box-shadow: 0 8px 15px rgba(255, 255, 100, 0.3);
        }

        .planet img {
            width: 130px;
            height: 130px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 10px;
        }

        .planet h3 {
            color: #ffcc00;
            margin: 5px 0;
            font-size: 18px;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        a:hover {
            text-shadow: 0 0 5px #ffcc00;
        }
    </style>
</head>
<body>
    <h1>🌞 太陽系 惑星図鑑</h1>

    <div class="planet-container">
    <%
        for (Planet p : planetList) {
    %>
        <div class="planet">
            <a href="planetDetail?id=<%= p.getId() %>">
                <img src="images/<%= p.getImage() %>" alt="<%= p.getName() %>">
                <h3><%= p.getName() %></h3>
            </a>
        </div>
    <%
        }
    %>
    </div>

</body>
</html>
