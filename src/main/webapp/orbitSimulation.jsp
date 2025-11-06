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
  
/* 月の軌道は地球の中で回す（クリックは要らなければ none のままでOK） */
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
  animation: spin 4s linear infinite;
  transform-origin: center;

  pointer-events: none;
  z-index: 25;
}

.moon {
  position: absolute;
  top: 0;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 20px;
  z-index: 40;
}

  

  /* 軌道そのものはクリック無効（見た目の円に当たり判定を持たせない） */
.orbit {
  --radius: 120px;
  --size: 18px;
  --period: 10s;

  position: absolute;
  top: 50%;
  left: 50%;
  width: calc(var(--radius) * 2 * var(--scale));
  height: calc(var(--radius) * 2 * var(--scale));
  margin-top: calc(var(--radius) * -1 * var(--scale));
  margin-left: calc(var(--radius) * -1 * var(--scale));
  border: 1px dashed rgba(255,255,255,0.18);
  border-radius: 50%;
  transform-origin: center;
  animation: spin var(--period) linear infinite;

  pointer-events: none;  /* ★ ここがポイント：軌道はクリック無効 */
  z-index: 1;
}
  .orbit > a.planet {
  pointer-events: auto;
}
  
 /* 惑星（a要素）は確実に前面＆クリック可 */
a.planet, .planet {
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
  caret-color: transparent;
  text-decoration: none;
  color: inherit;

  pointer-events: auto !important;  /* ★ 念押し */
  z-index: 30;                      /* ★ 軌道より前面に */
}

/* アニメーション定義 */
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
  
  /* 惑星を載せる回転コンテナ。ここでクリックを復活させる */
.rotator {
  position: absolute;
  top: 0;
  left: 50%;
  transform-origin: 50% calc(var(--radius) * var(--scale));
  animation: spin var(--period) linear infinite;

  pointer-events: auto;  /* ★ rotatorはクリック有効 */
  z-index: 2;
}
  .orbit .rotator {
  pointer-events: auto;
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
    <a href="planetDetail?id=1" class="planet">🩶</a> <!-- 水星 -->
  </div>
</div>

<div class="orbit venus">
  <div class="rotator">
    <a href="planetDetail?id=2" class="planet">🟡</a> <!-- 金星 -->
  </div>
</div>

<div class="orbit earth">
  <div class="rotator">
    <a href="planetDetail?id=3" class="planet">🌍</a> <!-- 地球 -->
    <div class="moon-orbit">
      <a href="planetDetail?id=10" class="moon">🌙</a> <!-- 月（id=10） -->
    </div>
  </div>
</div>

<div class="orbit mars">
  <div class="rotator">
    <a href="planetDetail?id=4" class="planet">🔴</a> <!-- 火星 -->
  </div>
</div>

<div class="orbit jupiter">
  <div class="rotator">
    <a href="planetDetail?id=5" class="planet">🟤</a> <!-- 木星 -->
  </div>
</div>

<div class="orbit saturn">
  <div class="rotator">
    <a href="planetDetail?id=6" class="planet">🪐</a> <!-- 土星 -->
  </div>
</div>

<div class="orbit uranus">
  <div class="rotator">
    <a href="planetDetail?id=7" class="planet">🔵</a> <!-- 天王星 -->
  </div>
</div>

<div class="orbit neptune">
  <div class="rotator">
    <a href="planetDetail?id=8" class="planet">🔷</a> <!-- 海王星 -->
  </div>
</div>
  
  <div class="rotator">
    <a href="planetDetail?id=9" class="planet">🔷</a>
  </div>
</div>
  
  

  <p><a href="planetList.jsp">← 惑星一覧に戻る</a></p>
</body>
</html>
