<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Planet" %>
<%
    Planet p = (Planet) request.getAttribute("planet");

    if (p == null) {
%>
    <p>指定された惑星は存在しません。</p>
<%
        return; // これ以上 JSP を実行しない
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= p.getName() %> - 惑星詳細</title>
    <style>
        body {
            font-family: sans-serif;
            background: #111;
            color: #fff;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        h1, h2 {
            color: #ffcc00;
        }

        .planet-detail {
            display: inline-block;
            background: #222;
            border-radius: 12px;
            padding: 30px;
            margin: 20px auto;
            width: 400px;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .planet-detail:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0,0,0,0.5);
        }

       .planet-detail img {
    width: 260px;
    height: 260px;
    border-radius: 50%;
    object-fit: cover;
    border: 4px solid rgba(255, 255, 255, 0.4);
    box-shadow: 0 0 25px rgba(255, 255, 255, 0.5);
    transition: transform .35s ease, box-shadow .35s ease;
}

.planet-detail img:hover {
    transform: scale(1.08);
    box-shadow: 0 0 45px rgba(255, 255, 255, 0.75);
}

        .planet-detail h2 {
            margin: 15px 0 10px;
        }

        .planet-detail p {
            margin: 8px 0;
            font-size: 14px;
            line-height: 1.3;
        }

        a {
            color: #ffcc00;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
        .info-box {
    text-align: left;
    margin-top: 15px;
    font-size: 15px;
    line-height: 1.6;
    background: rgba(255, 255, 255, 0.07);
    padding: 15px;
    border-radius: 8px;
}

.label {
    font-weight: bold;
    color: #ffcc00;
}

.back {
    display: inline-block;
    margin-top: 20px;
    font-size: 15px;
}
        
    </style>
</head>
<body>
    <h1>🌞 太陽系 惑星詳細</h1>

    <div class="planet-detail">
    <img src="images/<%= p.getImage() %>" alt="<%= p.getName() %>">
    <h2><%= p.getName() %></h2>

    <div class="info-box">
        <p><span class="label">説明：</span> <%= p.getDescription() %></p>
        <p><span class="label">太陽からの距離：</span> <%= p.getDistance() %></p>
        <p><span class="label">主な衛星：</span> <%= p.getSatellites() %></p>
        <p><span class="label">公転周期：</span> <%= p.getOrbitalPeriod() %></p>
    </div>

    <a href="planetList.jsp" class="back">← 一覧に戻る</a>
</div>
    

</body>
</html>
