<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/views/form/userTop.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- 리셋 css -->
  <link rel="stylesheet" href="./common/minireset.min.css">
  <!-- index css -->
  <link rel="stylesheet" href="./css/about.css">
  <!-- index js -->
  <script defer src="./js/about.js"></script>

</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

  <title>서비스 소개</title>
  <link rel="stylesheet" href="CSS/style.css">
</head>
<style type="text/css">
   address {
    margin-bottom: 1rem;
    font-style: normal;
    line-height: inherit;
    color: #888;
	}
	
	.sec1Txt.txtBox {
    margin-left: 86px;
    padding-top: 180px;
        color: white;
	}

	a{
	  text-decoration: none; /* 밑줄 없애기 */
	  color: inherit; /* 색깔 상속 */
	}
	
	.se3_rightdiv {
    padding-left: 100px;
    width: 1200px;
	}
	
	.se3_rightdiv1 {
	/* font-weight: bold;
    font-size: 45px; */
    color: black;
	}
	
	.se3_rightdiv2 {
    padding-top: 20px;
    font-size: 20px;
}

.se3_leftdiv {
    width: 450px;
    float: right;
}

.sec3all {
    width: 1500px;
}

/* styles.css */

.se3_rightdiv {
  display: flex;
  align-items: flex-start; /* Align items to the top */
}


/* .se3_rightdiv2 {
  flex: 1; 
}

.se3_leftdiv {
  flex: 1; 
}
 */
 
 .se3_leftdiv {
    padding-left: 190px;
}

c {
    font-size: 18px;
    color: #7a7a7a;
}


b {
    font-weight: bolder;
    font-size: 45px;
}

section.sec3 {
    margin-top: 70px;
}

.se3_rightdiv1 {
    width: 450px;
}

section.sec3 {
    height: 500px;
}
 
 
.aboutall{
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
    max-width: 1500px;
    margin: 0 auto;
    }
  /* .se1span {
    display: block;
    font-size: 40px;
    font-weight: bold;
    float: left;
    margin: 230px 0px 0px 210px;
    background: url(../images/bagr.png) top right / contain no-repeat;
    color: #2a2828;
}   */
    
    .rightdiv {
    position: absolute;
    margin: 20px;
    width: 900px;
    margin-left: 305px;
    margin-left: 431px
	}		
	.se1span {
    font-size: 40px;
    font-weight: bold;
    float: left;
    margin: 251px 0px 0px 313px;
    color: #2a2828;
    margin: 33px;
    position: inherit;
    margin-right: 900px;
    margin-top: 220px;
	}
	section.se1 {
    position: initial;
	}
	.w-100 {
    width: 100%!important;
    position: relative;
	}

</style>

<body>

  
  <section class="sec2">
      <div class="container">
        <div class="sec1Txt txtBox">
          <em>Space Collection</em>
          <h1 class="title">
            <p><span class="del">세상의</span></p>
            <p><span class="del1">모든 공간</span></p>
          </h1>
          <div class="sTxtWrapper">
            <span class="sTxt">
              새로운 도시혁신 서비스로 머물기 좋은 도시를 만드는 소셜벤처</em>
            </span>
            <br><span class="sTxt">
              We advance affordable city in the new urban way
            </span>
          </div>
          <!-- <div class="hovBox"> -->
          <br>
          <div class="appbox">
            <div class="google">
            <a href="https://play.google.com/store/apps/details?id=com.hustay.swing.p3cfded673ced4983b0db9399638730cb"> 
            <img src="./images/googlestore.png" alt="어플" class="appimg"></a></div>
            <div class="apple">
             <a href="https://apps.apple.com/kr/app/seupeiseukeullaudeu/id1025620281?l=en"> 
            <img src="./images/appstore.png" alt="어플" class="appimg"></a></div>
          </div>
        </div>
        </div>
        </section>
  
<div class="aboutall">
<section class="se1">
<div class="se1span">
<p>가장 쉽고,<br> 간편한 <br>공간 예약</p>
</div>

<div class= "rightdiv">
  <div id="carouselExampleIndicators" class="carousel slide">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="images/about1.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="images/about2.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="images/about3.png" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</div>
</section>


  <section class="sec3">
  	<div class="sec3all">
  	<div class="se3_rightdiv">
	  <div class="se3_rightdiv1 ">
	    <b>대한민국 No.1 <br>
	    생활 공간 플랫폼</b><br><br>
	    <c>스페이스콜렉션은 필요한 시간만큼 공간을 
	    <br>예약할 수 있는 생활 공간 플랫폼입니다.
	    <br>누구나 원하는 공간에서 우리다운 시간을 보낼 수 
	    <br>있도록 나아가 모두에게 더 머물기 좋은 도시가 
	    <br>되도록 좋은 공간을 연결하는 것이 스페이스 콜렉션의 미션입니다.</c>
	  </div>
	  <div class="se3_leftdiv">
	    <img src="images/bg.png" class="d-block" alt="...">
	  </div>
	</div>
  
  <!-- <div class="se3_leftdiv">
  	 <img src="images/bg.png" class="d-block w-100" alt="...">
  </div> -->
  </div>
  </section>
  </div>
<!-- </body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
  <script src="js/slideShow.js"></script>
</html> -->

<%@ include file="/WEB-INF/views/form/userBottom.jsp" %>