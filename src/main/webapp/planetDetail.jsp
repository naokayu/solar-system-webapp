<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Planet" %>
<%
    Planet p = (Planet) request.getAttribute("planet");

    if (p == null) {
%>
    <p>指定された惑星は存在しません。</p>
<%
        return;
    }
%>

<%
String order = "";
switch (p.getName()) {
    case "水星": order = "太陽系第1惑星"; break;
    case "金星": order = "太陽系第2惑星"; break;
    case "地球": order = "太陽系第3惑星"; break;
    case "火星": order = "太陽系第4惑星"; break;
    case "木星": order = "太陽系第5惑星"; break;
    case "土星": order = "太陽系第6惑星"; break;
    case "天王星": order = "太陽系第7惑星"; break;
    case "海王星": order = "太陽系第8惑星"; break;
    default: order = ""; // 太陽や月は表示しない
}
%>
<%
String dayTemp = "";
String nightTemp = "";

switch (p.getName()) {
    case "水星": dayTemp = "約430℃"; nightTemp = "約-180℃"; break;
    case "金星": dayTemp = "約465℃"; nightTemp = "約465℃"; break;
    case "地球": dayTemp = "約15℃";  nightTemp = "約-18℃"; break;
    case "月":   dayTemp = "約127℃"; nightTemp = "約-173℃"; break;
    case "火星": dayTemp = "約20℃";  nightTemp = "約-73℃"; break;
    case "木星": dayTemp = "約-108℃"; nightTemp = "約-108℃"; break;
    case "土星": dayTemp = "約-139℃"; nightTemp = "約-139℃"; break;
    case "天王星": dayTemp = "約-197℃"; nightTemp = "約-197℃"; break;
    case "海王星": dayTemp = "約-201℃"; nightTemp = "約-201℃"; break;
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

        .order {
            margin: 6px 0;
            font-size: 16px;
            color: #ffd84d;
            font-weight: bold;
        }

        .back {
            display: inline-block;
            margin-top: 20px;
            font-size: 15px;
            color: #ffcc00;
            text-decoration: none;
        }

        .back:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>🌞 太陽系 惑星詳細</h1>

    <div class="planet-detail">
        <img src="images/<%= p.getImage() %>" alt="<%= p.getName() %>">
        <h2><%= p.getName() %></h2>

        <% if (!order.isEmpty()) { %>
            <p class="order"><%= order %></p>
        <% } %>

        <div class="info-box">
            <p><span class="label">説明：</span> <%= p.getDescription() %></p>
            <p><span class="label">太陽からの距離：</span> <%= p.getDistance() %></p>
            <p><span class="label">主な衛星：</span> <%= p.getSatellites() %></p>
            <p><span class="label">公転周期：</span> <%= p.getOrbitalPeriod() %></p>
            <p><span class="label">昼の温度：</span> <%= dayTemp %></p>
			<p><span class="label">夜の温度：</span> <%= nightTemp %></p>
            
        </div>

        <a href="planetList.jsp" class="back">← 一覧に戻る</a>
    </div>

</body>
</html>
