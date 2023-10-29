<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스페이스컬렉션 호스트</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<!--  -->
<meta name="author" content="Untree.co">
<link rel="shortcut icon" href="title_icon.jpg">
<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap5" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/fonts/icomoon/style.css' />">
<link rel="stylesheet" href="<c:url value='/fonts/flaticon/font/flaticon.css' />">
<link rel="stylesheet" href="<c:url value='/css/tiny-slider.css' />">
<link rel="stylesheet" href="<c:url value='/css/aos.css' />">
<link rel="stylesheet" href="<c:url value='/css/style.css' />">


<style type="text/css">
	* {
		margin: 0;
		padding: 0;
		letter-spacing: -0.1px;
		font-family: 'Pretendard-Regular' !important;
	}
	
	@font-face {
       font-family: 'Pretendard-Regular';
       src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
       font-weight: 400;
       font-style: normal;
   }
	
	.navbar {
		background: #193D76 !important;
		width: 100%;
		height: 75px !important;
	}
	
	.headerMain nav {
		font-weight: bold;
		padding: 15px 15px 15px 15px;
	}

	.navbar-brand {
		color: white;
		text-decoration: none;
		font-size: 25px;
		float: left;
		font-weight: bold;
	}

	.logo2 {
		color: #ffd014;
		font-size: 18px;
	}
	
	.navbar-toggler {
		background: #ffd014 !important;
		color: #193D76;
		margin-left: 15px;
	}
	.navbar-toggler:hover{
		background: white !important;
		border:#ffd014 1px solid;
	}
	
	
	.offcanvas-header {
		height: 180px;
		background: #ffd014;
		padding-right: 20px;
		text-align: center;
	}
	
	.offcanvas-title {
		width: 75%;  
		color: #193D76;
		font-weight: bold;
		font-size: 25px;
		text-align: center;
	}
	
	.nav-item {
		height: 65px;
		padding: 21px 25px 20px;
		border-bottom: 1px solid gray;
		width: 100%;
	}
	
	.frofile {
		font-size: 18px;
		font-weight:bold;
	    color: white;
	    width: 170px;
	    text-decoration: none;
	    padding: 7px 7px 7px 7px;
	    margin-right: 19px;
	    border: 2px solid #193D76;
	    background: #193D76;
	    border-radius: 0.4rem;
	}
	.frofile:hover{
		color:#ffd014;
	}
	
	
	.offcanvas-body {
		font-size: 19px;
		font-weight: bold;
	}
	
	.offcanvas-body {width: 100%; padding: 0; margin: 0;}
	
	.nav-link {
		padding-top: 0; 
		position: relative;
	}
	
	.login {
		height: 220px;
		background: #f6f6f6;
		text-align: center;
		font-weight: normal;
		color: #949494;
		font-size: 15px;
	}
	
	.management {
		height: 150px;
		background: #f6f6f6;
		display: flex;
	}
	

	
	.btLogin {
		border: 1px solid #ffd014;
		background: #193D76;
		padding: 7px;
		width: 100px;
		color: #ffd014;
		font-size: 16px;
		text-align: center;
	}
	.btLogin:hover{
		color:white;
		border:white 1px solid;
	}
	.goHome{
	    border: #193D76 solid 2px;
	    padding: 4% 4% 4% 4%;
	    background: #ffd014;
	    font-size: 20px;
	    font-weight: bold;
	    margin-bottom: 5%;
	}
	
	.goHome {
		border: 0;
	}
	.goHome:hover{
		background: #193D76;
		transition: 0.5s;
		
		.home{
			color:white !important;
		}
	}
	
	
	.nav-item:hover{
		background: #193D76;
		transition: 0.5s;

		.nav-link{
			color:white;
		}
		.nav-link.active{
			color: #ffd014 !important;
		}
	}
	.mng-item {
		height: 130px;
		width: 150px;
		font-size: 16px;
		padding: 42px 5px 0 5px;
		border-right: 1px solid gray;
		text-align: center;
		background: white;
		color: #656565;
	}
	
	.mng-item:hover{
		background: #193D76;
		transition: 0.5s;
		color:white;
	}
	
</style>

<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$('.btLogin').click(function() {
			location.href="<c:url value='/login/login' />";
		});
		
		$('help').click(function() {
			window.open('');
		});
			
</script>
</head>
<body>
	<nav class="navbar bg-body-tertiary fixed-top">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="<c:url value='/host/index' />">SpaceCollection <span class="logo2">호스트센터</span></a>
	    <div class="d-flex flex-row-reverse">
		    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <c:if test="${empty sessionScope.userId }">
		    	<a class="btLogin" href="<c:url value='/login/login' />">로그인</a>
		    </c:if>
		    <c:if test="${!empty sessionScope.userId }">
		    	<a class="btLogin" href="<c:url value='/login/logout' />" >로그아웃</a>
		    </c:if>
	    </div>
	    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
	      <div class="offcanvas-header">
	      	<c:if test="${empty sessionScope.userId }">
		        <span class="offcanvas-title" id="offcanvasNavbarLabel">
		        	<a href="<c:url value='/login/login' />" style="color: white;" >로그인</a>
		        </span>
		    </c:if>
	      	<c:if test="${!empty sessionScope.userId }">
		        <span class="offcanvas-title" id="offcanvasNavbarLabel">
		        	<span style="font-size: 19px; color: #704de4;">호스트</span>
		        	<br>${sessionScope.userId }</span>
		    </c:if>
	        <a class="frofile" href="<c:url value='/guest/myPage/checkPwd'/>">프로필 관리</a>
	        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
	      </div>
	      <div class="offcanvas-body">
	      	<div class="management">
	      		<a class="mng-item" href="<c:url value='/host/reservation?page=1'/>">
	      			예약 리스트 /<br>캘린더 관리
	      		</a>
	      		<a class="mng-item" href="#">
	      			이용 후기 /<br>Q&A 관리
	      		</a>
	      		<a class="mng-item" href="<c:url value='/host/spaceManage'/>" style="padding-top:57px">
	      			공간정보 관리
	      		</a>
	      	</div>
	        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
	          <li class="nav-item">
	            <a class="nav-link active" aria-current="page" href="<c:url value='/host/index' />" style="color: #6d3bff;">
	            호스트센터 홈</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link" href="<c:url value='/host/calculate' />">정산</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link" href="<c:url value='/host/notice' />">공지사항</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link" href="https://plucky-sleep-a52.notion.site/29468eb28f06418c8e6d5aea69674882"
	            	target="_blank">도움말</a>
	          </li>
	          <li class="nav-item dropdown">
	            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	              서비스 정보
	            </a>
	            <ul class="dropdown-menu">
	              <li><a class="dropdown-item" href="#">이용약관</a></li>
	              <li><a class="dropdown-item" href="#">개인정보 처리방침</a></li>
	              <li><a class="dropdown-item" href="#">정산 및 환불정책</a></li>
	              <li><a class="dropdown-item" href="#">공간 관리 정책</a></li>
	            </ul>
	          </li>
	        </ul>
	        <div class="login">
	        	<div class="goHome">
	        		<a class = "home" href="<c:url value='/'/>" style="color:#193D76;">스페이스컬렉션(사용자)으로 이동</a>
	        	</div>
	        	<br>
	        	<c:if test="${empty sessionScope.userId }">
		    	<a href="<c:url value='/login/login' />">로그인</a>
			    </c:if>
			    <c:if test="${!empty sessionScope.userId }">
			    	<a href="<c:url value='/login/logout' />">로그아웃</a>
			    </c:if>
	        	<br><br>
	        	<span>Powered by © nada Crew.</span>
	        </div>
	      </div>
	    </div>
	  </div>
	</nav>
