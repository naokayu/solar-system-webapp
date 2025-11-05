<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>🌞 公転シミュレーション</title>
<style>
body {
    background: radial-gradient(circle at center, #000, #020024, #090979, #000);
    color: #fff;
    font-family: sans-serif;
    margin: 0;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    overflow: hidden;
}

/* 惑星系の領域 */
.solar-system {
    position: relative;
    width: 600px;
    height: 600px;
    border: 1px solid rgba(255,255,255,0.1); /* デバッグ用 */
}

/* 太陽をど真ん中に固定 */
.sun {
    position: absolute;
    top: 50%;
    left: 50%;
    width: 80px;
    height: 80px;
    background: radial-gradient(circle, #ffcc00, #ff6600);
    border-radius: 50%;
    transform: translate(-50%, -50%); /* ←これが超重要！ */
    z-index: 10;
}

.orbit {
    position: absolute;
    top: 50%;
    left: 50%;
    border: 1px dashed rgba(255,255,255,0.2);
    border-radius: 50%;
    transform: translate(-50%, -50%);
}

.planet {
    position: absolute;
    top: 50%;
    left: 50%;
    transform-origin: -50% center;
    animation: orbit var(--speed) linear infinite;
}

.planet img {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    object-fit: cover;
    box-shadow: 0 0 10px #fff;
}

/* 惑星ごとの距離・スピード指定 */
.mercury .planet { --speed: 3s; transform: rotate(0deg) translateX(80px); }
.venus   .planet { --speed: 7s; transform: rotate(0deg) translateX(120px); }
.earth   .planet { --speed: 10s; transform: rotate(0deg) translateX(160px); }
.mars    .planet { --speed: 15s; transform: rotate(0deg) translateX(200px); }
/* 以降略 */



/* 公転アニメーション */
@keyframes orbit {
    from { transform: rotate(0deg) translateX(var(--distance)) rotate(0deg); }
    to { transform: rotate(360deg) translateX(var(--distance)) rotate(-360deg); }
}

/* 各惑星のパラメータ（距離・スピード） */
.mercury { --distance: 80px; animation: orbit 3s linear infinite; }
.venus   { --distance: 120px; animation: orbit 7s linear infinite; }
.earth   { --distance: 160px; animation: orbit 10s linear infinite; }
.mars    { --distance: 200px; animation: orbit 15s linear infinite; }
.jupiter { --distance: 260px; animation: orbit 25s linear infinite; }
.saturn  { --distance: 320px; animation: orbit 35s linear infinite; }
.uranus  { --distance: 380px; animation: orbit 50s linear infinite; }
.neptune { --distance: 440px; animation: orbit 70s linear infinite; }
</style>

</head>
<body>
    <h1>🌞 太陽系 公転シミュレーション</h1>

    <div class="solar-system">
    <div class="sun"></div>

    <div class="orbit mercury">
        <img src="<%= request.getContextPath() %>/images/mercury.jpg" class="planet">
    </div>

    <div class="orbit venus">
        <img src="<%= request.getContextPath() %>/images/venus.jpg" class="planet">
    </div>

    <div class="orbit earth">
        <img src="<%= request.getContextPath() %>/images/earth.jpg" class="planet">
    </div>

    <div class="orbit mars">
        <img src="<%= request.getContextPath() %>/images/mars.jpg" class="planet">
    </div>

    <div class="orbit jupiter">
        <img src="<%= request.getContextPath() %>/images/jupiter.jpg" class="planet">
    </div>

    <div class="orbit saturn">
        <img src="<%= request.getContextPath() %>/images/saturn.jpg" class="planet">
    </div>

    <div class="orbit uranus">
        <img src="<%= request.getContextPath() %>/images/uranus.jpg" class="planet">
    </div>

    <div class="orbit neptune">
        <img src="<%= request.getContextPath() %>/images/neptune.jpg" class="planet">
    </div>
</div>
    

    <a href="planetList.jsp">← 惑星一覧に戻る</a>
</body>
</html>
