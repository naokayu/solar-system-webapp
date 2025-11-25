<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>📸 宇宙フォトギャラリー</title>
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
  color: #ffcc00;
  text-shadow: 0 0 10px #ffcc00;
  margin: 30px 0 10px;
}

/* ギャラリー全体 */
.gallery {
  display: grid;
  grid-template-columns: repeat(4, 1fr); /* ← 4列固定 */
  gap: 25px;
  padding: 20px;
  justify-items: center;
}
/* スマホ対応：小さい画面では2列 */
@media (max-width: 768px) {
  .gallery {
    grid-template-columns: repeat(2, 1fr);
  }
}

/* 各写真カード */
.card {
  background: rgba(255,255,255,0.08);
  border-radius: 15px;
  width: 240px;
  overflow: hidden;
  box-shadow: 0 0 20px rgba(255,255,255,0.1);
  transition: transform 0.3s, box-shadow 0.3s;
}
.card:hover {
  transform: scale(1.05);
  box-shadow: 0 0 25px rgba(255,255,200,0.4);
}

.card img {
  width: 100%;
  height: 220px;         
  object-fit: cover;
  border-radius: 12px;
  margin-bottom: 0px;     /* ← ★ 下の余白を調整 */
}


/* タイトルと説明 */
.card-info {
  padding: 14px 12px; /* ← 少し広め */
}

.card-info h3 {
  margin: 6px 0 4px;
  font-size: 16px;
  color: #ffcc00;
}
.card-info p {
  margin: 0;
  font-size: 13px;
  color: #ddd;
}

/* 戻るボタン */
a.back-btn {
  display: inline-block;
  margin: 25px auto;
  padding: 10px 18px;
  background: #ffcc00;
  border-radius: 8px;
  color: #000;
  font-weight: bold;
  text-decoration: none;
  box-shadow: 0 0 10px rgba(255,255,100,0.5);
  transition: transform 0.3s, box-shadow 0.3s;
}
a.back-btn:hover {
  transform: scale(1.05);
  box-shadow: 0 0 20px rgba(255,255,150,0.8);
}


</style>
</head>
<body>
<h1>📸 宇宙フォトギャラリー</h1>

<div class="gallery">

  <div class="card">
    <img src="images/orion.jpg" alt="オリオン大星雲">
    <div class="card-info">
      <h3>🪐 オリオン大星雲（M42）</h3>
      <p>冬の夜空に輝く星雲。肉眼でもぼんやりと見える神秘の光。</p>
    </div>
  </div>

  <div class="card">
    <img src="images/pleiades.jpg" alt="プレアデス星団">
    <div class="card-info">
      <h3>✨ プレアデス星団（すばる）</h3>
      <p>青く輝く若い星々。肉眼でも7つの星が確認できる。</p>
    </div>
  </div>

  <div class="card">
    <img src="images/moon.jpg" alt="月">
    <div class="card-info">
      <h3>🌙 月</h3>
      <p>望遠鏡で撮影したクレーターの陰影が印象的。</p>
    </div>
  </div>

  <div class="card">
    <img src="images/sirius.jpg" alt="シリウス">
    <div class="card-info">
      <h3>🌟 シリウス</h3>
      <p>地球から見える最も明るい恒星。青白い輝きが特徴。</p>
    </div>
  </div>

  <div class="card">
    <img src="images/andromeda.jpg" alt="アンドロメダ銀河">
    <div class="card-info">
      <h3>🌌 アンドロメダ銀河</h3>
      <p>地球から最も近い巨大銀河。肉眼でも観測できる。</p>
    </div>
  </div>
  
  <div class="card">
    <img src="images/ic443.jpg" alt="IC 443 くらげ星雲">
    <div class="card-info">
      <h3>🦑 IC 443（くらげ星雲）</h3>
      <p>超新星残骸が作る独特の形。赤く広がるガスが美しい星雲。</p>
    </div>
  </div>
  
  <div class="card">
    <img src="images/betelgeuse.jpg" alt="ベテルギウス">
    <div class="card-info">
      <h3>🔴 ベテルギウス</h3>
      <p>オリオン座の肩に輝く赤色超巨星。将来超新星爆発する可能性も。</p>
    </div>
  </div>
  
   <div class="card">
    <img src="images/m78.jpg" alt="M78">
    <div class="card-info">
      <h3>🌁 M78 反射星雲</h3>
      <p>青く淡い光が美しい、オリオン座に広がる反射星雲。</p>
    </div>
  </div>

</div>


<a href="planetList.jsp" class="back-btn">← 惑星一覧に戻る</a>

</body>
</html>
