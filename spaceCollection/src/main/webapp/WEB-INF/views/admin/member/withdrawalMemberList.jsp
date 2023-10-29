<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../form/adminTop.jsp"%>
<style type="text/css">
	
	#memberReturnBt{
		float: right;
		margin-top: 16px;
		margin-right: 5px;
		margin-bottom: 20px;
	}	

	h5{
		float: left;
	}
	
	th{
		text-align: center;
	}
	
	td{
		text-align: center;
	}
	
	#searchDiv>div {
    	float: right;
	}
	
	div#select {
    	width: 114px;
	}
	
	#searchDiv>div{
		margin-left: 5px;
	}
	
	i.bi.bi-exclamation-circle {
 		color: #ffd600;
   		font-size: 40px;
   		display: block;
   		margin-block: -13px;
	}
	
	td>span {
		color: red;
	}
	
</style>
<script type="text/javascript">
	$(function() {
		$('tbody tr').hover(function() {
			$(this).find('td').css("background-color", "#d1cece");
		}, function() {
			$(this).find('td').css("background-color", "white");
		});
		
		$('#searchBt').click(function() {
			if($('#searchKeyword').val().length<1){
				event.preventDefault();
				$('#confirm1 .modal-body').html("검색어를 입력해주세요.");
				$('#confirm1').modal("show");
			}
		});
		
		$('input[name=chkAll]').click(function() {
			var checkState = $(this).is(':checked')
			$('td>input[type=checkbox]').prop('checked', checkState);
		});
		
		$('#memberReturnBt').click(function() {
			if($('td>input[type=checkbox]:checked').length<1){
				$('#confirm1 .modal-body').html("복구시킬 회원을 선택해주세요.");
				$('#confirm1').modal("show");
			}else{
				$('#okBt').addClass('btn-success');
				$('#okBt').html('복구');
				$('#confirm2 .modal-body').html("선택된 회원을 복구시키겠습니까?");
				$('#confirm2').modal("show");
				$('#okBt').click(function() {
					$(this).removeClass('btn-success');
					$('form[name=trFrm]').submit();
				});
			}
		});
			
	});
	
	function pageFunc(curPage){
		$('input[name="currentPage"]').val(curPage);
		$('form[name="frmPage"]').submit();
	}
</script>
<main id="main" class="main">

	<div class="pagetitle">
		<h1>탈퇴 회원 관리</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">홈</li>
				<li class="breadcrumb-item">회원 관리</li>
				<li class="breadcrumb-item active">
					탈퇴 회원 관리 
				</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section">
		<div class="row">
			<div class="col-lg-6" style="width: 100%">

				<div class="card" id="pageDiv" >
					<div class="card-body">
 						<h5 class="card-title" style="font-weight: bold;"><a>탈퇴 회원 관리</a></h5>
 						<form name="frmPage" method="post" action="<c:url value='/admin/member/memberList'/>">
 							<input type="hidden" name="currentPage">
							<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
							<input type="hidden" name="searchCondition" value="${param.searchCondition}">
 						</form>
                		<button type="button" class="btn btn-outline-success" id="memberReturnBt">회원 복구</button>
						<table class="table">
							<colgroup>
								<col style="width: 5%";  />
								<col style="width:12%";  />
								<col style="width:12%;" />
								<col style="width:20%;" />
								<col style="width:20%;" />		
								<col style="width:15%;" />		
								<col style="width:15%;" />		
							</colgroup>
							<thead>
								<tr>
									<th scope="col"><input type="checkbox" name="chkAll"></th>
									<th scope="col">회원 번호</th>
									<th scope="col">이름</th>
									<th scope="col">아이디</th>
									<th scope="col">이메일</th>
									<th scope="col">탈퇴일</th>
									<th scope="col">가입일</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty list }">
									<tr>
										<td colspan="7" style="text-align: center;">동록된 회원이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${!empty list }">
									<form name="trFrm" method="post" action="<c:url value='/admin/member/memberReturn'/>">
										<c:set var="i" value="0"/>
										<c:forEach var="userInfoVo" items="${list }">
											<tr>
												<td>
													<input type="checkbox" name="userInfoItemList[${i }].userId" value="${userInfoVo.userId }">
												</td>
												<td onclick="location.href='<c:url value='/admin/member/memberDetail?userId=${userInfoVo.userId }'/>';" style="cursor:pointer;">
													${userInfoVo.userNum }
												</td>
												<td onclick="location.href='<c:url value='/admin/member/memberDetail?userId=${userInfoVo.userId }'/>';" style="cursor:pointer;">
													${userInfoVo.userName }
												</td>
												<td onclick="location.href='<c:url value='/admin/member/memberDetail?userId=${userInfoVo.userId }'/>';" style="cursor:pointer;">
													${userInfoVo.userId }
												</td>
												<td onclick="location.href='<c:url value='/admin/member/memberDetail?userId=${userInfoVo.userId }'/>';" style="cursor:pointer;">
													${userInfoVo.userEmail }
												</td>
												<td onclick="location.href='<c:url value='/admin/member/memberDetail?userId=${userInfoVo.userId }'/>';" style="cursor:pointer;">
													<fmt:formatDate value="${userInfoVo.userOutDate }" pattern="yyyy-MM-dd"/>
												</td>
												<td onclick="location.href='<c:url value='/admin/member/memberDetail?userId=${userInfoVo.userId }'/>';" style="cursor:pointer;">
													<fmt:formatDate value="${userInfoVo.userRegDate }" pattern="yyyy-MM-dd"/>
												</td>
											</tr>
											<c:set var="i" value="${i+1 }"/>
										</c:forEach>
									</form>
								</c:if>
							</tbody>
						</table>
						<div class="divPage">
						
							<nav aria-label="...">
								<ul class="pagination justify-content-center">
									<c:if test="${pagingInfo.firstPage>1 }">
										<li class="page-item <c:if test='${pagingInfo.firstPage <=1 }'>disabled</c:if>">
											<a class="page-link" href="#" aria-label="Previous" onclick="pageFunc(${pagingInfo.firstPage-1})">이전</a>
							    		</li>
									</c:if>	
							    	<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">		
										<c:if test="${i == pagingInfo.currentPage }">
											<li class="page-item active" aria-current="page">
									      		<a class="page-link" href="#">${i}</a>
									    	</li>		
								        </c:if>
										<c:if test="${i != pagingInfo.currentPage }">		
									         <li class="page-item">
									         	<a class="page-link" aria-label="Previous" href="#" onclick="pageFunc(${i})">${i }</a>
									         </li>
									    </c:if>   		
									</c:forEach>
							      	<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
							      		<li class="page-item <c:if test='${pagingInfo.lastPage >= pagingInfo.totalPage }'>disabled</c:if>">
								      		<a class="page-link" href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">다음</a>
								    	</li>
									</c:if>
							  	</ul>
							</nav>
						
						</div>	
						<form class="row gx-3 gy-2 align-items-center" id="memberFrm" method="post" action="<c:url value='/admin/member/memberList'/>">
							<div id="searchDiv">
								<div class="col-auto">
									<button type="submit" id="searchBt" class="btn btn-primary">검색</button>
								</div>
								<div class="col-sm-3" id="keyword">
									<label class="visually-hidden" for="searchKeyword">searchCondition</label>
									<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" value="${searchVo.searchKeyword }">
								</div>
								<div class="col-sm-3" id="select">
									<select class="form-select" name="searchCondition" id="searchCondition">
										<option value="user_id" <c:if test="${param.searchCondition=='user_id'}">
						            		selected="selected"
						            	</c:if> >아이디</option>
										<option value="user_name" <c:if test="${param.searchCondition=='user_name'}">
						            		selected="selected"
						            	</c:if> >이름</option>
									</select>
								</div>
							</div>
						</form>				
					</div>
				</div>
			</div> 
		</div>
		
	</section>
	<!-- Modal1 -->
	<div class="modal fade" id="confirm1" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title"><i class="bi bi-exclamation-circle"></i></h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal" id="confirm">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- EndModal1 -->
	<!-- Moda2 -->
	<div class="modal fade" id="confirm2" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title"><i class="bi bi-exclamation-circle" style="color: red;"></i></h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn" id="okBt"></button>
				</div>
			</div>
		</div>
	</div>
	<!-- EndModal2 -->
	
</main>
<!-- End #main -->
<%@ include file="../../form/adminBottom.jsp"%>
