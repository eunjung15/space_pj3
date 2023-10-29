<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>zipcode.jsp</title>
</head>
<body>
	<title>zipcode.jsp</title>
	<link rel="stylesheet" type="text/css"
		href="<c:url value='/css/mainstyle.css'/>" />
	<style type="text/css">
body {
	margin: 5px;
	padding: 5px;
}

caption {
	visibility: hidden;
}
</style>
	<script type="text/javascript"
		src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
	<script type="text/javascript">
   $(function() {
	   $('#dong').focus();
	   
	   $('#submit').click(function() {
			if($('#dong').val().length==0){
				alert("동을 입력하세요.");
				 $('#dong').focus();
				event.preventDefault();
			}
		});
	});
	
   function pageFunc(curPage) {
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
   
	function setZipcode(zipcode, address) {
		$(opener.document).find('#zipcode').val(zipcode);
		$(opener.document).find('input[name=address]').val(address);
		self.close();
	}
</script>
</head>
<body>
	<h2>우편번호 검색</h2>
	<br>
	<p>찾고 싶으신 주소의 동(읍/면)을 입력하세요</p>
	<form name="frmPage" action="<c:url value='/zipcode/zipcode'/>" method="post">
		<input type="text" name="currentPage">
		<input type="text" name="searchKeyword" value="${param.searchKeyword }"> 
	</form>
	<form name="frmZipcode" method="post" action="<c:url value='/zipcode/zipcode'/>">

		<label for="searchKeyword">지역명 : </label> <input type="text" name="searchKeyword"
			id="dong" value="${param.searchKeyword }"> <input type="submit"
			id="submit" value="찾기">
	</form>

	<br>
	<c:if test="${list != null }">
		<table style="width: 470px" class="box2"
			summary="우편번호 검색 결과에 관한 표로써, 우편번호, 주소에 대한 정보를 제공합니다.">
			<caption>우편번호 검색</caption>
			<colgroup>
				<col style="width: 20%" />
				<col style="width: *" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">우편번호</th>
					<th scope="col">주소</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list }">
					<tr>
						<td colspan="2" style="text-align: center;">해당 주소 없음</td>
					</tr>
				</c:if>
				<c:if test="${!empty list }">
					<c:forEach var="vo" items="${list }">
						<tr>
							<td>${vo.zipcode }</td>
							<c:set var="address" value="${vo.sido } ${vo.gugun } ${vo.dong }" />
							<c:set var="bunji" value="${vo.startBunji }" />
							<c:if test="${!empty vo.endBunji }">
								<c:set var="bunji" value="${vo.startBunji } ~ ${vo.endBunji }" />
							</c:if>
							<td><a href="#"
								onclick="setZipcode('${vo.zipcode }','${address }')">
									${address } ${bunji }</a></td>
						</tr>
					</c:forEach>
				</c:if>
				
				<!-- 반복끝 -->
			</tbody>
		</table>
		<div class="divPage">
			<c:if test="${pagingInfo.firstPage>1 }">
				<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})"> <img
					src="<c:url value='/images/first.JPG'/>">
				</a>
			</c:if>
			<c:forEach var="i" begin="${pagingInfo.firstPage }"
				end="${pagingInfo.lastPage }">
				<c:if test="${i == paingingInfo.currentPage }">
					<span>${i }</span>
				</c:if>
				<c:if test="${i != paingingInfo.currentPage }">
					<a href="#" onclick="pageFunc(${i})">[${i }]</a>
				</c:if>
			</c:forEach>
			<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
				<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"> <img
					src="<c:url value='/images/last.JPG'/>">
				</a>
			</c:if>
	
		</div>
		</c:if>
</body>
</html>