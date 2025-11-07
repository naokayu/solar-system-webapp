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

.planet:hover {
	transform: translateY(-8px);
	box-shadow: 0 0 25px rgba(255, 255, 200, 0.45); /* ホバー時に光が強く */
}

.planet {
	background: rgba(255, 255, 255, 0.08); /* 透明感 */
	border-radius: 15px;
	padding: 20px;
	width: 180px;
	backdrop-filter: blur(10px); /* ★ ガラス効果の本体 ★ */
	-webkit-backdrop-filter: blur(10px); /* Safari対応 */
	border: 1px solid rgba(255, 255, 255, 0.2); /* 薄い光の縁 */
	box-shadow: 0 0 20px rgba(255, 255, 255, 0.08); /* 柔らかい光 */
	transition: transform 0.35s, box-shadow 0.35s;
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
    <p>
    	<a href="orbitSimulation.jsp" style="
    		display:inline-block;
    		margin-top:10px;
    		padding:10px 18px;
    		background:#ffcc00;
    		border-radius:8px;
    		color:#000;
    		font-weight:bold;
    		text-decoration:none;
    	">
    		🌍 公転シミュレーションを見る
    	</a>
</p>
   <div class="planet-container">
<%
    for (Planet p : planetList) {

        String emoji = "";
        switch (p.getName()) {
            case "太陽": emoji = "🌞"; break;
            case "水星": emoji = "🩶"; break;
            case "金星": emoji = "🟡"; break;
            case "地球": emoji = "🌍"; break;
            case "月": emoji = "🌙"; break;
            case "火星": emoji = "🔴"; break;
            case "木星": emoji = "🟤"; break;
            case "土星": emoji = "🪐"; break;
            case "天王星": emoji = "🔵"; break;
            case "海王星": emoji = "🔷"; break;
        }
%>
    <div class="planet">
        <a href="planetDetail?id=<%= p.getId() %>">
            <div style="font-size:48px;"><%= emoji %></div>
            <h3><%= p.getName() %></h3>
        </a>
</div>
			<%
			} // ← ★ for文の閉じタグ
			%>
		</div>
    

</body>
</html>
