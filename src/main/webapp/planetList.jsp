<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="dao.PlanetDAO" %>
<%@ page import="model.Planet" %>

<%
    // DAOを使って惑星リストを取得
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
            font-family: sans-serif;
            background: #111;
            color: #fff;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        h1 {
            margin: 30px 0;
            color: #ffcc00;
        }

        /* グリッドレイアウト */
        .planet-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
        }

        .planet {
            background: #222;
            border-radius: 12px;
            padding: 20px;
            width: 220px;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .planet:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0,0,0,0.5);
        }

        .planet img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
        }

        .planet h3 {
            margin: 10px 0 5px;
        }

        .planet p {
            margin: 5px 0;
            font-size: 14px;
            line-height: 1.3;
        }

        a {
            text-decoration: none;
            color: #fff;
        }

        a:hover {
            color: #ffcc00;
        }
    </style>
</head>
<body>
    <h1>🌞 太陽系 惑星図鑑</h1>

    <div class="planet-container">
    <%
        for(Planet p : planetList) {
    %>
        <div class="planet">
            <a href="planetDetail?id=<%= p.getId() %>">
                <img src="images/<%= p.getImage() %>" alt="<%= p.getName() %>">
                <h3><%= p.getName() %></h3>
            </a>
            <p><%= p.getDescription() %></p>
            <p><small><%= p.getDistance() %></small></p>
        </div>
    <%
        } // for終了
    %>
    </div>

</body>
</html>
