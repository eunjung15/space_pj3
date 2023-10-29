<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../form/adminTop.jsp"%>
<style type="text/css">
	
	#memberWithdrawalBt{
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
	
	#MChkDiv{
		margin-top: 5px;
		text-align: left;
	}
	
	#excelDownloadBt{
		--bs-btn-bg: #dadddf;
	}
	
	#excelModal>div>div>div>p{
		margin-bottom: 20px;
	}
	
	.marginTop{
		margin-top: 5px;
	}
	
	.marginTop>div{
		text-align: left;
	}
	
	#warning{
		color: red;
		text-align: left;
		margin-top: -15px;
	}
	
	
</style>
<script type="text/javascript">
	$(function() {
		$('tbody tr').hover(function() {
			$(this).find('td').css("background-color", "#d1cece");
		}, function() {
			$(this).find('td').css("background-color", "white");
		});
		
		$('#warning').hide();
		
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
		
		$('#memberWithdrawalBt').click(function() {
			if($('td>input[type=checkbox]:checked').length<1){
				$('#confirm1 .modal-body').html("탈퇴시킬 회원을 선택해주세요.");
				$('#confirm1').modal("show");
			}else{
				$('#confirm2 .modal-body').html("선택된 회원을 탈퇴시키겠습니까?<br>해당 회원이 작성한 모든 자료가 삭제됩니다.");
				$('#confirm2').modal("show");
				$('#okBt').click(function() {
					$('#confirm2').modal("hide");
					$('form[name=trFrm]').submit();
				});
			}
		});
		
		$('#excelDownloadBt').click(function() {
			$('#excelModal').modal('show');
		});
		
		$('#columnChkAll').click(function() {
			var checkState = $(this).is(":checked");
			$('.modal-body input[type=checkbox]').prop('checked', checkState);
		});
		
		$('#downloadBt').click(function() {
			if($('.modal-body input[type=checkbox]:checked').length<1){
				event.preventDefault();
				$('#warning').show();
			}else{
				$('#excelModal').modal('hide');
				$('form[name=excelFrm]').submit();
			}
		});
		
		$('.modal button').click(function() {
			$('.modal-body input[type=checkbox]').prop('checked', false);
		});
		
		$('.modal-body input[type=checkbox]').click(function name() {
			$('#warning').hide();
		});
		
		$('#excelModal button[name=cancelBt]').click(function() {
			$('#warning').hide();
		});
			
	});
	
	function pageFunc(curPage){
		$('input[name="currentPage"]').val(curPage);
		$('form[name="frmPage"]').submit();
	}
</script>
<main id="main" class="main">

	<div class="pagetitle">
		<h1>회원 관리</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">홈</li>
				<li class="breadcrumb-item">회원 관리</li>
				<li class="breadcrumb-item active">
					회원 관리 
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
 						<h5 class="card-title" style="font-weight: bold;"><a>회원 관리</a></h5>
 						<form name="frmPage" method="post" action="<c:url value='/admin/member/memberList'/>">
 							<input type="hidden" name="currentPage">
							<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
							<input type="hidden" name="searchCondition" value="${param.searchCondition}">
 						</form>
                		<button type="button" class="btn btn-outline-danger" id="memberWithdrawalBt">회원 탈퇴</button>
						<table class="table">
							<colgroup>
								<col style="width: 5%";  />
								<col style="width:12%";  />
								<col style="width:12%;" />
								<col style="width:40%;" />
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
									<th scope="col">가입일</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty list }">
									<tr>
										<td colspan="6" style="text-align: center;">등록된 회원이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${!empty list }">
									<form name="trFrm" method="post" action="<c:url value='/admin/member/memberWithdrawal'/>">
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
							<div style="float: left;">
								<button class="btn btn-light" type="button" id="excelDownloadBt">
									<i class="bi bi-filetype-xlsx"></i>  엑셀 다운로드
								</button>
							</div>
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
					<button type="button" class="btn btn-danger" id="okBt">삭제</button>
				</div>
			</div>
		</div>
	</div>
	<!-- EndModal2 -->
	<!-- Moda3 -->
	<div class="modal fade" id="excelModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">엑셀 다운로드 항목 선택</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p >
						엑셀에 포함시킬 데이터를 선택하세요.&nbsp;&nbsp;
						<input class="form-check-input" type="checkbox" value="" id="columnChkAll" name="columnChkAll">
						<label class="form-check-label" for="columnChkAll">전체 선택</label>
					</p>
					<div class="container text-center " id="MChkDiv">
						<p id="warning">※ 최소 하나 이상의 컬럼을 선택하세요.</p>
						<c:set var="columnListEng1" value="${fn:split('userNum,userHp,userId,userRegDate,zipcode,addressDetail,userMarketingSmsOk', ',') }"/>
						<c:set var="columnListKor1" value="${fn:split('회원번호,아이디,이메일,가입일,우편번호,상세주소,마케팅 동의(SMS)', ',') }"/>
						<c:set var="columnListEng2" value="${fn:split('userName,userEmail,userOutType,userOutDate,address,userMarketingEmailOk', ',') }"/>
						<c:set var="columnListKor2" value="${fn:split('이름,연락처,가입상태,탈퇴일,주소,마케팅 동의(이메일)', ',') }"/>
						<form name="excelFrm" action="<c:url value='/admin/member/memberExcelDownload'/>" method="post">
							<div class="row align-items-start">
								<div class="col marginTop">
									<c:forEach var="i" begin="0" end="${fn:length(columnListEng1)-1 }">
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value="${2*i }"
												id="${columnListEng1[i] }" name="headerListIndex[${2*i }]">
											<label class="form-check-label" for="${columnListEng1[i] }">${columnListKor1[i] }</label>
										</div>
									</c:forEach>
								</div>
									
								<div class="col marginTop">
									<c:forEach var="i" begin="0" end="${fn:length(columnListEng2)-1 }">
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value="${2*i+1 }"
												id="${columnListEng2[i] }" name="headerListIndex[${2*i+1 }]">
											<label class="form-check-label" for="${columnListEng2[i] }">${columnListKor2[i] }</label>
										</div>
									</c:forEach>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" name="cancelBt">취소</button>
					<button type="button" class="btn btn-success" id="downloadBt">다운로드</button>
				</div>
			</div>
		</div>
	</div>
	<!-- EndModal3 -->
	
</main>
<!-- End #main -->
<%@ include file="../../form/adminBottom.jsp"%>
