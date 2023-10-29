<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../form/adminTop.jsp"%>
<link href="<c:url value='/css/boardSetting.css'/>"
	rel="stylesheet">
<script type="text/javascript">
	$(function() {
		$('#boardBt').click(function() {
			location.href="<c:url value='/admin/board/boardTypeCreate'/>";
		});
		
		$('tbody tr').hover(function() {
			$(this).find('td').css("background-color", "#d1cece");
		}, function() {
			$(this).find('td').css("background-color", "white");
		});
	});
</script>
<main id="main" class="main">

	<div class="pagetitle">
		<h1>게시판 생성/관리</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">홈</li>
				<li class="breadcrumb-item active">게시판 생성/관리</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section">
		<div class="row">
			<div class="col-lg-6" style="width: 100%">

				<div class="card" id="pageDiv" >
					<div class="card-body">
 						<h5 class="card-title" style="font-weight: bold;">생성된 게시판</h5>
						<button type="button" class="btn btn-primary rounded-pill" id="boardBt">게시판 생성</button>

						<table class="table">
							<thead>
								<tr>
									<th scope="col">게시판 번호</th>
									<th scope="col">게시판 이름</th>
									<th scope="col">댓글 사용여부</th>
									<th scope="col">첨부파일 사용여부</th>
									<th scope="col">등록일</th>
									<th scope="col">사용여부</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty list }">
									<tr>
										<td colspan="6" style="text-align: center;">생선된 게시판이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${!empty list }">
									<c:forEach var="vo" items="${list }">
									
											<tr onclick="location.href='<c:url value='/admin/board/boardTypeEdit?boardTypeId=${vo.boardTypeId }'/>';" style="cursor:pointer;">
												<td>${vo.boardTypeId }</td>
												<td>${vo.boardTypeName }</td>
												<td>${vo.boardTypeCommentOk }</td>
												<td>${vo.boardTypeFileOk }</td>
												<td><fmt:formatDate value="${vo.boardTypeRegdate }" pattern="yyyy-MM-dd"/></td>
												<td>${vo.boardTypeUse }</td>
											</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
				 	</div>
				</div>

			</div> 
		</div>
	</section>

</main>
<!-- End #main -->
<%@ include file="../../form/adminBottom.jsp"%>

