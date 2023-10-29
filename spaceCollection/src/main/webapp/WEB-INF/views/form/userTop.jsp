<!-- /*
* Template Name: Property
* Template Author: Untree.co
* Template URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>

<html lang="ko">
<head>

<title>SpaceCollection.com</title>

<meta charset="utf-8">

<!-- 사이드메뉴 -->
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 사이드메뉴 -->

<meta name="author" content="Untree.co">
<link rel="shortcut icon" href="title_icon.jpg">
<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap5" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/icomoon/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/tiny-slider.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/aos.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

<!-- 공간 상세페이지용 cdn -->
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/datepickerCss/datepicker.css">
<link href="https://cdn.jsdelivr.net/npm/nouislider@15.7.1/dist/nouislider.min.css" rel="stylesheet">


<style type="text/css">

/* form.narrow-w.form-search.d-flex.align-items-stretch.mb-3.aos-init.aos-animate
	{
	margin-top: 10px;
} */
	@font-face {
	    font-family: 'Pretendard-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	    font-weight: 400;
	    font-style: normal;
	}
  @keyframes fadeInUp {
      0% {
          opacity: 0;
          transform: translate3d(0, -30%, 0);
      }
      to {
          opacity: 1;
          transform: translateZ(0);
      }
    }
	*{
		font-family: 'Pretendard-Regular' !important;
	}

    
    body{
		font-family: 'Pretendard-Regular' !important;
		overflow: visible !important;
		height: auto !important;
	}
	
	h1{
		font-family: 'Pretendard-Regular' !important;
	}
	h3{
		font-family: 'Pretendard-Regular' !important;
	}
	h4{
		font-family: 'Pretendard-Regular' !important;
	}
	h5{
		font-family: 'Pretendard-Regular' !important;
	}
	h1, .h1, h2, .h2, h3, .h3, h4, .h4, h5, .h5, .logo{
		font-family: 'Pretendard-Regular' !important;
	}
.topSearch {
	width: 1000px;
    padding: 20px 40px 50px 260px;
	scale: 0.8;
	position: absolute;
	border-radius: 10px;
}

#inputSearch {
	width: 400px;
	border-radius: 24px;
	border: 1px solid #f6f6f6;
	background-color: #d1d1d1;
	color: #333;
	box-shadow: 0 15px 30px -15px rgba(0, 0, 0, 0.1);
}

#topLogo {
	font-size: 40px;
	font-weight: bolder;
	margin-left: 20px;
	margin-top: 13px;
	animation: fadeInUp 1s;
}

/* side */
	a{
	  text-decoration: none; 
	  color: inherit;
	}
  
	.sidemenubt {
  	color: white !important;
	}
	.sidemenubt:hover{
		background:#ffd014;
		transition: 0.3s;
	}
	.service_menu {
    padding: 0 0 20px;
    text-align: center;
    color: #949494;
    background: #f6f6f6;
    height: 200px;
    
	}

	.bi{
	color:#193D76; 
	font-size: 40px;
	width: 50px;
	height: 30px;
	}
	.bi:hover{
		color: #ffd014;
		transition:0.2s;
	}
	
	#sidemenubtcl{
	color:white;
	}
	
	.sidemenust {
    position: absolute;
    float: right;
    margin-left: 1170px;
    margin-top: 25px;
    width: 100px;
	}

	#searchBt{
    width: 100px;
    margin-left: 10px;
	}
	#searchBt:hover{
		background:white;
		color:black;
	}
	
	#offcanvasDarkNavbar{
	z-index:1051;
	}
	.goHostCenter{
		border:#ffd014 solid 2px;
		padding: 4% 4% 4% 4%; 
		background:#193D76;
		font-size:20px;
		font-weight: bold; 
		margin-bottom:5%;
	}
	.hostCenter:hover{
		.goHostCenter{
			color:#193D76;
			background: #ffd014;
			transition:0.4s;
		}
	}

	.site-nav{
		max-width: 100% !important;
		width:100% !important;
		padding:0 !important;
		background:#193D76;
		position: sticky !important;
		top: 0;
		
	}
	.menu-bg-wrap *{
		max-width: 100% !important;
		position: sticky;
		top: 0;
	}
	#topContainer{
		max-width: 100% !important;
		width: 100% !important;
		padding:0 !important;
		height: auto;
	}
	.topbar{
		float:right;
		padding:0% 0% 0% 0%;
		display: grid;
	}
	.search{
		scale:0.9;
		display:block !important;
		float: right;
	}
	.topText{
		float: right;
	}
	header{
		height: auto !important;
	}
	.logo.float-start.yellow{
		color:white !important;
		transition:3s;
	}
	.logo.float-start{
		transition:3s;
	}
	::-webkit-scrollbar {
	    width: 15px;
	    background-color: white;
  	}
	::-webkit-scrollbar-thumb{
		background: #ffd014;
		border-radius: 1rem;
	} 
</style>
</head>
<body>
	<!-- 스크롤 -->
	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>
	<!-- 스크롤끝-->

<!-- 상단메뉴 -->
<nav class="site-nav">
		<div class="container" id="topContainer">
			<div class="menu-bg-wrap">
				<div class="site-navigation">

					<a href="<c:url value='/'/>"
						class="logo float-start" id="topLogo">SpaceCollection</a>

					<div class="topbar">
							<ul class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end" style="padding-left:3%;">
								<li class="active"><a href="<c:url value='/'/>">Home</a></li>
								<li ><a href="<c:url value='/search' />">SpaceCollection</a>
									<!-- 공간 대분류 카테고리별 나열하기 !!!
									<li class="has-children">
										<ul class="dropdown">
										<li><a href="#">Buy Property</a></li>
										<li><a href="#">Sell Property</a></li>
										<li class="has-children"><a href="#">Dropdown</a>
											<ul class="dropdown">
												<li><a href="#">Sub Menu One</a></li>
												<li><a href="#">Sub Menu Two</a></li>
												<li><a href="#">Sub Menu Three</a></li>
											</ul></li>
									</ul> -->
								</li>
								<li><a href="<c:url value='/user/boardList'/>">시즌 이벤트</a></li>
								<li><a href="<c:url value='/about'/>">서비스 소개</a></li>
							<!-- 로그인 안된 경우 -->
								<c:if test="${empty sessionScope.userId }">
									<li><a href="<c:url value='/login/login'/>">로그인</a></li>
								</c:if>
							<!-- 로그인 된 경우 -->
								<c:if test="${!empty sessionScope.userId }">
									<li><a href="<c:url value='/login/logout'/>">로그아웃</a></li>
								</c:if>
							</ul>
							<div class="search">
								<form class="narrow-w form-search d-flex align-items-stretch mb-3" method="get" action="${pageContext.request.contextPath }/search">
									<input type="text" class="form-control px-4"
										placeholder="공간명으로 찾아보세요" id="inputSearch" name="spaceName">
									<button type="submit" class="btn btn-primary" id="searchBt">Search</button>
									<button class="sidemenubt" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar">
								      <i class="bi bi-list" id="sidemenubtcl"></i>
								    </button>
								</form>
							</div>
					</div>
				</div>
			</div>
		</div>
<!-- 사이드시작  -->      
<div class="sidemenust">
    
    
    <!--사이드메뉴 시작-->
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel" >
    <div class="offcanvas-header" style="background-color: #f6f6f6; text-align: center;">     	 		
		<div><a style="font-weight: bold;" href="#"><h5> Space Collection</h5></a></div>	
		<div><button type="button" class="btn-close text-dark" data-bs-dismiss="offcanvas" aria-label="Close"></button></div>
  	</div>
      
      
      <!-- 메뉴 바(내 정보) 추가!!!!!!!!!!!!!!!!!!!!! -->
		
		
			<!-- 사이드메뉴 -->
			<div class="sideform" style="margin-top: 30px; margin-bottom: 40px;">
			
			<div class="col-sm-6"  style="text-align: center;">
			
			<!-- 로그인 안된 경우 -->
				<c:if test="${empty sessionScope.userId }">
					<a href="<c:url value='/login/login'/>"><i class="bi bi-person-check"></i>
			        <p>로그인</p></a>
				</c:if>
			<!-- 로그인 된 경우 -->
				<c:if test="${!empty sessionScope.userId }">
					<a href="<c:url value='/login/logout'/>">
					<i class="bi bi-box-arrow-right"></i>
			        <p>로그아웃</p></a>
				</c:if>
			  
		 </div>
			
			 	<div class="col-sm-6 " style="text-align: center;">
				<a href="
				<c:if test="${!empty sessionScope.code }">
					<c:url value='/guest/myPage/myProfile' />
				</c:if>
				<c:if test="${empty sessionScope.code }">
					<c:url value='/guest/myPage/checkPwd' />
				</c:if>
				">
		  		<i class="bi bi-person-video" ></i>
		 	    <p>마이페이지</p></a>
		 	</div>
				
		  	<div class="col-sm-6 " style="text-align: center;">
			  <a href="<c:url value='/reservation/reservationList?page=1' />">  
			        <i class="bi bi-calendar-check" ></i>
		 		  <p>예약 리스트</p></a> 
		 	</div>
		 
		   <div class="col-sm-6 " style="text-align: center;">
			       <a href="<c:url value='/myReview' />">  
					<i class="bi bi-person-hearts" ></i>
		 	 	  <p>이용 후기</p></a>
		 	</div>
	
		    <div class="col-sm-6 " style="text-align: center;">
			  <a href="<c:url value='/zzimList' />"> 
		   		 <i class="bi bi-house-heart" ></i>
		 	 	  <p>찜 리스트</p></a>
			</div>
	
		  <div class="col-sm-6 " style="text-align: center;">
		    <a href="<c:url value='/user/notice' />">   
		     <i class="bi bi-info-circle" ></i>
		   	<p>공지사항</p></a> 
		  </div>
		  
		  <div class="col-sm-6 " style="text-align: center;">
		    <a href="<c:url value='/myQnA'/>">
		     <i class="bi bi-question-diamond" ></i>
		 	   <p>QnA</p></a>
		  </div>
		  
		  <div class="col-sm-6 "  style="text-align: center;">
		    <a href="<c:url value='/user/coupon'/>">
		    <i class="bi bi-ticket-perforated"></i>
		 	   <p>쿠폰함</p></a>
		  </div>
		  
		  <div class="col-sm-6 " style="text-align: center;">
		    <a href="<c:url value='/user/faq'/>">
		     <i class="bi bi-book"></i>
		 	   <p>FAQ</p></a>
		  </div>
		  
		  <div class="col-sm-6 "  style="text-align: center;">
		    <a href="<c:url value='/about'/>">
		    <i class="bi bi-houses" ></i>
		 	   <p>회사소개</p></a>
		  </div>
				
	</div><!-- sideform -->	      
	      <!--Host이동 --> 
	      <div class="service_menu">
	      		<a class="hostCenter" style="color:#ffd014" href="${pageContext.request.contextPath }/host/index">
	      			<div class="goHostCenter">Host센터로 이동하기</div>
	      		</a>
	      <p class="copyright">Powered by © nada Crew.</p>
	      </div>
       
    </div><!--사이드메뉴끝-->
<!-- 사이드종료 -->

</div>	
<!-- 상단메뉴 끝 -->	</nav>

		
	<!-- 채팅api -->			
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	
	<script type="text/javascript">
		var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
		(function() {
			var s1 = document.createElement("script"), s0 = document
					.getElementsByTagName("script")[0];
			s1.async = true;
			s1.src = 'https://embed.tawk.to/64cc763c94cf5d49dc6853f9/1h6varo07';
			s1.charset = 'UTF-8';
			s1.setAttribute('crossorigin', '*');
			s0.parentNode.insertBefore(s1, s0);
		})();
		
		
	</script>
	<script type="text/javascript">
	$(function(){
		$('#searchBt').click(function(){
			if($('#inputSearch').val().length === 0){
				alert('검색어를 입력하세요');
				return false;
			}
		});
	});
	logoColorAnimation();
	function logoColorAnimation() {
		  // 이 함수가 실행될 때마다 원하는 작업을 수행하세요.
		  var logo = document.getElementById('topLogo');
			if(logo.classList.contains('yellow')){
			  logo.classList.remove('yellow');
			}else{
			  logo.classList.add('yellow');
			}
		  // 다음 호출을 예약합니다.
		  setTimeout(logoColorAnimation, 3100);
		}
	</script>

	<a href="#"
		class="burger light me-auto float-end mt-1 site-menu-toggle js-menu-toggle d-inline-block d-lg-none"
		data-toggle="collapse" data-target="#main-navbar"> <span></span>
	</a>
	<!-- 채팅api 끝 -->	