<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>🌞 公転シミュレーション（CSS版）</title>
<style>
  :root {
    /* 全体スケールをまとめて変更したいときにここを調整 */
    --scale: 1;
  }

  body {
    background: radial-gradient(circle at center, #000, #020024, #090979, #000);
    color: #fff;
    font-family: sans-serif;
    margin: 0;
    height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    overflow: hidden;
  }

  h1 { color: #ffcc00; margin: 8px 0 0; }

  .solar-system {
    position: relative;
    width: calc(640px * var(--scale));
    height: calc(640px * var(--scale));
  }

  /* 太陽（CSSのグラデで描画） */
  .sun {
    position: absolute;
    top: 50%;
    left: 50%;
    width: calc(90px * var(--scale));
    height: calc(90px * var(--scale));
    background: radial-gradient(circle, #ffcc00, #ff6600);
    border-radius: 50%;
    transform: translate(-50%, -50%);
    box-shadow: 0 0 35px 10px rgba(255, 204, 0, 0.6);
    z-index: 10;
  }
  
/* 月の軌道＆月（地球の中心に配置される） */
.moon-orbit {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 60px;
  height: 60px;
  margin-top: -30px;
  margin-left: -30px;
  border: 1px dashed rgba(255,255,255,0.18);
  border-radius: 50%;
  animation: spin 4s linear infinite;   /* 月の公転速度 */
  transform-origin: center;
  z-index: 7;
}
.moon {
  position: absolute;
  top: 0;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 20px;                      /* 月の大きさ */
  z-index: 8;
  z-index: 21;   /* ← 月はさらに上 */
}

  

  /* 軌道（回転させる要素） */
  .orbit {
    --radius: 120px;      /* 惑星までの距離 */
    --size:   18px;       /* 惑星の直径 */
    --color:  #888;       /* 惑星の色 */
    --period: 10s;        /* 1 周のアニメ時間 */
    position: absolute;
    top: 50%;
    left: 50%;
    width: calc(var(--radius) * 2 * var(--scale));
    height: calc(var(--radius) * 2 * var(--scale));
    margin-top: calc(var(--radius) * -1 * var(--scale));
    margin-left: calc(var(--radius) * -1 * var(--scale));
    border: 1px dashed rgba(255,255,255,0.18);
    border-radius: 50%;
    animation: spin var(--period) linear infinite;
    transform-origin: center;
  }
  .orbit > a.planet {
  pointer-events: auto;
}
  
 .planet, a.planet {
  position: absolute;
  top: 0;
  left: 50%;
  transform: translate(-50%, -50%);

  width: calc(var(--size) * 2.2);
  height: calc(var(--size) * 2.2);

  display: flex;
  align-items: center;
  justify-content: center;

  font-size: calc(var(--size) * 2.2);
  line-height: 1;

  cursor: pointer;
  user-select: none;
  caret-color: transparent; /* ← ★ これが決定打 ★ */

  text-decoration: none;
  color: inherit;
  z-index: 20;
  pointer-events: auto !important;
}
 


  @keyframes spin {
    from { transform: rotate(0deg); }
    to   { transform: rotate(360deg); }
  }


.carrier {
  position: absolute;
  top: 0;
  left: 50%;
  transform: translate(-50%, -50%);
  pointer-events: auto; /* ← ★ 追加 ★ */
  z-index: 19;   /* ← 月も含めて前面へ */
}


  /* ホバーで簡易ラベル */
  .planet::after {
    content: attr(data-name);
    position: absolute;
    top: calc(100% + 6px);
    left: 50%;
    transform: translateX(-50%);
    font-size: 12px;
    color: #ddd;
    opacity: 0;
    pointer-events: none;
    transition: opacity .15s ease;
    white-space: nowrap;
  }
  .planet:hover::after { opacity: 1; }
  
  .rotator {
  position: absolute;
  top: 0;
  left: 50%;
  transform-origin: 50% calc(var(--radius) * var(--scale));
  animation: spin var(--period) linear infinite;
}
  

  /* 惑星ごとのパラメータ（距離/サイズ/色/周期） */
  .mercury { --radius:  90px; --size: 12px; --color: #bfbfbf; --period:  6s; }
  .venus   { --radius: 130px; --size: 16px; --color: #caa85a; --period: 15s; }
  .earth   { --radius: 170px; --size: 22px; --color: #3aa4ff; --period: 20s; }
  .mars    { --radius: 210px; --size: 14px; --color: #ff5a3a; --period: 30s; }
  .jupiter { --radius: 260px; --size: 28px; --color: #c78c5a; --period: 45s; }
  .saturn  { --radius: 310px; --size: 26px; --color: #e0c47a; --period: 60s; }
  .uranus  { --radius: 360px; --size: 22px; --color: #67d1d1; --period: 80s; }
  .neptune { --radius: 410px; --size: 22px; --color: #4c70ff; --period: 95s; }

  a { color: #ffcc00; text-decoration: none; }
  a:hover { text-decoration: underline; }
</style>
</head>
<body>
  <h1>🌞 太陽系 公転シミュレーション（CSSのみ）</h1>

  <div class="solar-system">
  <div class="sun"></div>
  <div class="orbit mercury">
  <div class="rotator">
    <a href="planetDetail?id=1" class="planet">🩶</a>
  </div>
</div>

<div class="orbit venus">
  <div class="rotator">
    <a href="planetDetail?id=2" class="planet">🟡</a>
  </div>
</div>

<div class="orbit earth">
  <div class="rotator">
    <a href="planetDetail?id=3" class="planet">🌍</a>
    <div class="moon-orbit">
      <a href="planetDetail?id=4" class="moon">🌙</a>
    </div>
  </div>
</div>

<div class="orbit mars">
  <div class="rotator">
    <a href="planetDetail?id=5" class="planet">🔴</a>
  </div>
</div>

<div class="orbit jupiter">
  <div class="rotator">
    <a href="planetDetail?id=6" class="planet">🟤</a>
  </div>
</div>

<div class="orbit saturn">
  <div class="rotator">
    <a href="planetDetail?id=7" class="planet">🪐</a>
  </div>
</div>

<div class="orbit uranus">
  <div class="rotator">
    <a href="planetDetail?id=8" class="planet">🔵</a>
  </div>
</div>

<div class="orbit neptune">
  <div class="rotator">
    <a href="planetDetail?id=9" class="planet">🔷</a>
  </div>
</div>
  
  

  <p><a href="planetList.jsp">← 惑星一覧に戻る</a></p>
</body>
</html>
