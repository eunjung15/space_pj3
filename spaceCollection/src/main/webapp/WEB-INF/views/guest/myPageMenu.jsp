<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$(".list-group").children().click(function(){
			$(".list-group").children().attr("class","list-group-item list-group-item-action");
			$(this).attr("class","list-group-item list-group-item-action list-group-item-primary");
		});		
	});
</script>
<style type="text/css">
	.list-group-item list-group-item-action list-group-item-primary{
		color: red;
	}
	
	.list-group{
		width: 15%;
		margin: px;
		margin-top:13%;
		margin-right: 10%;
		border: 2px solid #193D76;
		float: right;
		position: sticky;
		top: 0;
	}

</style>
<aside id="guestAside">
	<div class="list-group">
	  <a href="<c:url value='/guest/checkPwd'/>" class="list-group-item list-group-item-action">회원정보수정</a>
	  <a href="#" class="list-group-item list-group-item-action">공간 예약리스트</a>
	  <a href="#" class="list-group-item list-group-item-action">나의 공간 찜</a>
	  <a href="#" class="list-group-item list-group-item-action">나의 쿠폰</a>
	  <a href="#" class="list-group-item list-group-item-action">나의 리뷰</a>
	  <a href="#" class="list-group-item list-group-item-action">나의 1:1 문의</a>
	  <a href="#" class="list-group-item list-group-item-action">QnA 목록</a>
	  <a href="#" class="list-group-item list-group-item-action list-group-item-primary">아 덥다 ㅋㅋ</a>
	</div>
</aside>
<script src="js/bootstrap.bundle.min.js"></script>
