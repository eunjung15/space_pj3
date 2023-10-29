<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404테스트</title>
<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#spaceLink').hover(function() {
		  $(this).css("background", "#d1e3ff");
		}, function(){
		  $(this).css("background", "");
		});
	});
</script>
<style type="text/css">
	@font-face {
       font-family: 'Pretendard-Regular';
       src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
       font-weight: 400;
       font-style: normal;
   }
   *{
      font-family: 'Pretendard-Regular' !important;
   }
   
   body{
   		background: #f9f9f9;
   }
	.wrap{
		width: 40%;
		margin: 0 auto;
		text-align: center;
		background: #f9f9f9;
		margin-top: 15%;
	}
	img{
		width: 20%;
		border-radius: 50%;
	}
	
	#title{
		font-size: 25px;
	}
	
	p{
		font-size: 14px;
    	color: #979797;
	}
	
	a{
		text-decoration: none;
		color: #2d5aa0;
		padding: 10px;
		border: 1px solid #2d5aa0;
		border-radius: 20px;
	}
	
	
</style>
 
</head>
<body>
<div class="wrap">
	<img alt="스페이스컬렉션" src="<c:url value='/img/icons/SpaceCollection.png'/>">
	<br>
	<br>
	<br>
	<div id="title">원하시는 페이지를 찾을 수 없습니다.</div>
	<p>
	   찾으려는 페이지의 주소가 잘못 입력되었거나,<br>
	   주소의 변경 혹은 삭제로 인해 사용하실 수 없습니다<br>
	   입력하신 페이지의 주소가 정확한지 다시 한번 확인해 주세요.
	</p>
	<br>
	<br>
	<a href="<c:url value='/'/>" id="spaceLink">스페이스 컬렉션 홈</a>
</div>
</body>
</html>