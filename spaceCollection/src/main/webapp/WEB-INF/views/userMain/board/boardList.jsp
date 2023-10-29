<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/form/userTop.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/mainstyle.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/font-awesome.min.css'/>" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
</head>
<script type="text/javascript">	

</script>

<style type="text/css">
	section{
		width:100%;
	 	display: flex;
        flex-wrap: wrap;
        gap: 20px;
        justify-content: center;
        /* max-width: 1200px; */
        margin: 0 auto; 
	 } 
	 c {
	    font-weight: bold;
	    font-size: 20px;
	 }
	 .col.align-center {
	    margin: 45px;
	 }
	 h2 {
    font-weight: bold;
	}
	img.titleButtonImg {
    width: 90%;
    margin: 20px;
	}
	.eventListBox{
	background-color: #f4f6f8;
	}
	.eventListBox {
    width: 70%;
	}
	.eventListBox {
    margin-left: 10px;
	}
	.inner {
	    width: 1000px;
	    /* align-content: center; */
	    object-position: center;
	    margin-left: 318px;
	}
	header.align-center {
	    width: 500px;
	    margin-left: 221px;
	    font-weight: bolder;
	}
	p {
	    margin-left: 10px;
	}
	.eventListBox {
	    margin-right: 16px;
	}
	section.wrapper.style1 {
	    margin-bottom: 100px;
		padding-top:100px;
	}
</style>
<body>
<form name="frmSearch" method="post" action="<c:url value='userMain/boardDetail'/>"> <!-- boardDetail -->
	  
<div id="main">
<section class="wrapper style1">
	<div class="inner">
		<header class="align-center">
			<h2>진행 중인 이벤트</h2>
			<p>지금 진행 중인 이벤트를 만나보세요!</p>
		</header>
		
		<div class="eventListBox" >  
			<c:if test="${empty list }">  
		  		<tr><td colspan="5" class="align_center">글이 존재하지 않습니다.</td></tr>
		  	</c:if>
		  	<c:if test="${!empty list }">	
			<c:forEach var="map" items="${list}"> 
					<div class="col align-center">
						<div class="titleImg">
							<a href="#" class="titleButton"
							 onclick="location.href='<c:url value='/user/boardDetail?boardNum=${map.BOARD_NUM }'/>';" 
							 style="cursor:pointer;">
							 <img class="titleButtonImg"  alt="${map.BOARD_TITLE } "
							 src="<c:url value='/images/event/${map.BOARD_TITLE }'/>" 
							 /> 
							 <%-- src="https://kr.object.ncloudstorage.com/scloud-service/service/${map.BOARD_TITLE }" --%>
							 </a><br><br>
						</div>
					</div>
			</c:forEach>
			</c:if>
		</div>
		
	</div>
</section>
</div>
					
</form>
</body>
</html>
<%@ include file="/WEB-INF/views/form/userBottom.jsp" %>