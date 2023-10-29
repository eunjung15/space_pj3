<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/adminTop.jsp" %>
<style>
div#tawk-live-chats-navigation {
    content-visibility: hidden;
    background: white;
}
.chattingBox{
	width:100%;
	height: 1000px;
	margin-left: 8%;
}
#iframee{
	width:100%;
	height: 1000px;
	margin-left: 8%;
}
</style>

<section>
	<div class="chattingBox">
		<iframe id = "iframee" src="https://dashboard.tawk.to/#/dashboard" style="; background: white;"><!-- style="content-visibility: hidden; background: white;" -->
		        <p>현재 사용 중인 브라우저는 iframe 요소를 지원하지 않습니다!</p>
		</iframe>
	</div>		  
</section>

<%@ include file="/WEB-INF/views/form/adminBottom.jsp" %>