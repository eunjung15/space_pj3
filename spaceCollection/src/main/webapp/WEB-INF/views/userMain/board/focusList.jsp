<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%--  <%@ include file="/WEB-INF/views/form/userTop.jsp" %> --%>

<style>
section{
	margin: 10%;
}
h1{
   font-weight: bold;
}
.title {
    display: flex;
    max-width: 1200px;
    margin: 0 auto;
    flex-direction: column;
    align-items: center;
}

</style>

<section>
<div class="title">
<h1>기획전</h1>
<strong>MD가 큐레이션한 기획전 입니다</strong>
</div>

<div class="focusBox" >
 <c:forEach var="item" items="${list}">
    <div class="property-item">
        <a href="<c:url value='/yourMappingURL/${item.scNum}'/>" class="img">
            <img src="<c:url value='/images/푸바옷.png'/>" class="Img" alt="...">
        </a>
        <div class="property-content">
            <span class="">${item.boardTitle}</span>
        </div>
    </div>
</c:forEach> 
</div>
</section>
 <%-- <%@ include file="/WEB-INF/views/form/userBottom.jsp" %> --%>