<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../form/adminTop.jsp"%>
<style type="text/css">
main>div>nav {
	float: left;
}

#spaceConfirmBt, #spaceDenineBt {
	float: right;
	margin-top: 16px;
	margin-right: 5px;
	width: 89px;
}

section {
	clear: both;
}

div.row {
	margin-top: 10px;
}

div.label {
	color: #677fa9;
	font-weight: bold;
}

#card {
	min-height: 420px;
}

th, td {
	text-align: center;
}

.searchDiv>div {
	float: right;
}

div#select {
	width: 150px;
}

.searchDiv>div {
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

#confirm, #denine {
	margin-top: 50px;
}

#MChkDiv {
	margin-top: 5px;
	text-align: left;
}

.excelDownloadBt {
	--bs-btn-bg: #dadddf;
}

#excelModal>div>div>div>p {
	margin-bottom: 20px;
}

.marginTop {
	margin-top: 5px;
}

.marginTop>div {
	text-align: left;
}

#warning {
	color: red;
	text-align: left;
	margin-top: -15px;
}

.request {
	color: #34bb38;
}

.denine {
	color: red;
}

.confirm {
	color: #0d6efd;
}

#spaceConfirmHistoryList{
	clear: both;
}

th>i{
	cursor: pointer;
}

#status{
	float: right;
	width: 144px;
}

.fade:not(.show){
	display: none;
}

</style>
<script type="text/javascript">
	$(function() {
		$('#okBt').hide();
		$.spaceConfirmListSend(1);
		
		//페이지 출력 관련 시작
		$('li button').click(function() {
			$('input[name=searchKeyword]').val('');
		});

		$('#spaceConfirmListSearchBt').click(function() {
			$.spaceConfirmListSend(1);
		});
		
		$('button[name=spaceConfirmListTab]').click(function() {
			$.spaceConfirmListSearch();
			$.spaceConfirmListSend(1);
		});

		$('#spaceConfirmHistoryListSearchBt').click(function() {
			$.spaceConfirmHistoryListSend(1);
		});
		
		$('button[name=spaceConfirmHistoryListTab]').click(function() {
			/* $.spaceConfirmHistoryListSearch(); */
			$.spaceConfirmHistoryListSend(1);
		});
		//페이지 출력 관련 끝
		
		//체크박스 전체 체크 관련 시작
		$('input[name=chkAll]').click(function() {
			var checkState = $(this).is(':checked')
			$('td>input[type=checkbox]').prop('checked', checkState);
		});
		
		$('li.nav-item>button').click(function() {
			$('input[name=chkAll]').prop('checked', false);
		});
		//체크박스 전체 체크 관련 끝
		
		
		//엑셀 다운 관련 시작
		$('#warning').hide();
		
		$('.excelDownloadBt').click(function() {
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
		//엑셀 다운 관련 끝
		
	});
	
	function mouseIn(evt) {
		$(evt).find('td').css("background-color", "#d1cece");
	}
	function mouseOut(evt) {
		$(evt).find('td').css("background-color", "white");
	}
	
	function transForm() {
		$('#downloadBt').click(function() {
			if($('.modal-body input[type=checkbox]:checked').length<1){
				event.preventDefault();
				$('#warning').show();
			}else{
				$('#excelModal').modal('hide');
				$('form[name=excelFrm]').submit();
				$('form[name=trFrm]').attr("action", "/spaceCollection/admin/space/spaceConfirm/denine");
				$('form[name=trFrm]').submit();
			}
		});
	}
	
	$.spaceConfirmListSearch = function() {
		$.ajax({
			url : "<c:url value='/admin/space/spaceConfirmList/ajax_spaceConfirmList'/>",
			type: 'post',
			data: $('form[name=spaceConfirmListSearchFrm]').serializeArray(),
			dataType: 'json',
			success:function(res){
				$('#blockSize').val(res.pagingInfo.blockSize);
				$('input[name=currentPage]').val(res.searchVo.currentPage);
				$('input[name=userId]').val(res.searchVo.userId);
				$('input[name=searchKeyword]').val(res.searchVo.searchKeyword);
				$('input[name=searchCondition]').val(res.searchVo.searchCondition);
				var i = 0;
				var str = "";
				var str2 = "";
				if(res.ajaxList!=null && res.ajaxList.length>0){
					
					$('#spaceConfirmListTbody').html("");
					str2 += "<button type='submit' class='btn btn-outline-primary' id='spaceConfirmBt' onClick='$.spaceConfirm()'>승인</button>";
					str2 += "<button type='button' class='btn btn-outline-danger' id='spaceDenineBt' onClick='$.spaceDenine()'>거절</button>";
					
					$('#buttonDiv').html(str2);
					//$('#spaceConfirmListTbody').append("<form name='trFrm' method='post'>");
					

						$.each(res.ajaxList, function() {
								str += "<tr onmouseenter='mouseIn(this)' onmouseout='mouseOut(this)'>"
								str += "<td>"
								str += "<input type='checkbox' name='spaceItemList["+i+"].spaceNum' value='"+this.SPACE_NUM+"'>";
								str += "</td>";
								str += "<td onclick='locationHref("+this.SPACE_NUM+")' style='cursor: pointer;'>" + this.SPACE_NUM;
								str += "</td>";
								str += "<td onclick='locationHref("+this.SPACE_NUM+")' style='cursor: pointer;'>" + this.SPACE_TYPE_NAME;
								str += "</td>";
								str += "<td onclick='locationHref("+this.SPACE_NUM+")' style='cursor: pointer;'>" + this.SPACE_NAME;
								str += "</td>";
								str += "<td onclick='locationHref("+this.SPACE_NUM+")' style='cursor: pointer;'>" + this.USER_ID;
								str += "</td>";
								str += "<td onclick='locationHref("+this.SPACE_NUM+")' style='cursor: pointer;color: rgb(255,214,1)'>승인 요청";
								str += "</td>";
								str += "<td onclick='locationHref("+this.SPACE_NUM+")' style='cursor: pointer;'>" + this.SPACE_REQUEST_DATE;
								str += "</td>";
								str += "</tr>";
								
								i++;
						});

						i++;
						$('#spaceConfirmListTbody').append(str);
						//$('#spaceConfirmListTbody').append("</form>");
						pageMake(res.pagingInfo);
				}else{
					str = "<tr>"
						+ "<td colspan='7' style='text-align: center;''>승인 요청이 없습니다.</td>"
						+ "</tr>"
					$('#spaceConfirmListTbody').html(str);
				}
				
			},
			
			error:function(xhr, status, error){
				alert(status + " : " + error);
			}
		});
	}
	
	$.spaceConfirmHistoryListSearch = function() {
		$.ajax({
			url : "<c:url value='/admin/space/spaceConfirmList/ajax_spaceConfirmHistoryList'/>",
			type: 'post',
			data: $('form[name=spaceConfirmHistoryListSearchFrm]').serializeArray(),
			dataType: 'json',
			success:function(res){
				$('#blockSize').val(res.pagingInfo.blockSize);
				$('input[name=currentPage]').val(res.searchVo.currentPage);
				$('input[name=userId]').val(res.searchVo.userId);
				$('input[name=searchKeyword]').val(res.searchVo.searchKeyword);
				$('input[name=searchCondition]').val(res.searchVo.searchCondition);
				var str = "";
				if(res.ajaxList!=null && res.ajaxList.length>0){
					$('#spaceConfirmHistoryListTbody>form').html("");
										
						$.each(res.ajaxList, function() {
							str += "<tr onmouseenter='mouseIn(this)' onmouseout='mouseOut(this)'>"
							str += "<td onclick='locationHref("+this.SPACE_NUM+")' style='cursor: pointer;''>" + this.SPACE_NUM;
							str += "</td>";
							str += "<td onclick='locationHref("+this.SPACE_NUM+")' style='cursor: pointer;''>" + this.SPACE_TYPE_NAME;
							str += "</td>";
							str += "<td onclick='locationHref("+this.SPACE_NUM+")' style='cursor: pointer;'>" + this.SPACE_NAME;
							str += "</td>";
							str += "<td onclick='locationHref("+this.SPACE_NUM+")' style='cursor: pointer;'>" + this.USER_ID;
							str += "</td>";
							str += "<td onclick='locationHref("+this.SPACE_NUM+")' style='cursor: pointer;'>" + this.SPACE_REQUEST_DATE;
							str += "</td>";
							str += "<td onclick='locationHref("+this.SPACE_NUM+")' style='cursor: pointer;'>" + this.SPACE_REG_DATE;
							str += "</td>";
							if(this.SPACE_REQUEST_STATUS=="Y"){
								str += "<td onclick='locationHref("+this.SPACE_NUM+")' style='cursor: pointer;color: rgb(13,110,253)'>승인";
							}else if(this.SPACE_REQUEST_STATUS=="R"){
								str += "<td onclick='locationHref("+this.SPACE_NUM+")' style='cursor: pointer;color: rgb(255,214,1)'>승인 요청";
							}else if(this.SPACE_REQUEST_STATUS=="N"){
								str += "<td onclick='locationHref("+this.SPACE_NUM+")' style='cursor: pointer;color: red'>거절";
							}
							str += "</td>";
							str += "</tr>";
							
						});
						$('#spaceConfirmHistoryListTbody').html(str);
						pageMake(res.pagingInfo);
				}else{
					str = "<tr>"
						+ "<td colspan='6' style='text-align: center;''>승인 내역이 없습니다.</td>"
						+ "</tr>"
					$('#spaceConfirmHistoryListTbody').html(str);
				}
				
			},
			
			error:function(xhr, status, error){
				alert(status + " : " + error);
			}
		});
	}
	
	
	function pageMake(pagingInfo) {
		//페이징 처리
		//게시물 구분
		var kindFlag = pagingInfo.kindFlag;
		var blockSize = pagingInfo.blockSize;
		var countPerPage = pagingInfo.countPerPage;
		
		
		var str = "";
		str += "<nav aria-label='...'>";
		str	+= "<ul class='pagination justify-content-center'>";
		
		//이전 블럭으로	
		if(pagingInfo.firstPage>1){
			str += "<li class='page-item"
			if(pagingInfo.firstPage <= 1){
				str += " disabled";
			}
			str += ">";
			str += "<a class='page-link' href='#' aria-label='Previous' onclick='pageFunc("+pagingInfo.firstPage-1+")'>이전</a>";
			str += "</li>";
		}
		//페이지 번호 출력
		for(var i=pagingInfo.firstPage; i<=pagingInfo.lastPage; i++){
			if(i==pagingInfo.currentPage){
				str += "<li class='page-item active' aria-current='page'>";
				str += "<a class='page-link' href='#'>" + i + "</a></li>";
			}else{
				if(kindFlag =='spaceConfirmList'){
					str += "<li class='page-item'><a class='page-link' aria-label='Previous' href='#' onclick='$.spaceConfirmListSend("+ i +")'>"+i+"</a>";
				}else if(kindFlag == 'spaceConfirmHistoryList'){
					str += "<li class='page-item'><a class='page-link' aria-label='Previous' href='#' onclick='$.spaceConfirmHistoryListSend("+ i +")'>"+i+"</a>";
				}
				
				str += "</li>";
			}
		}
		//다음 블럭으로
		if(pagingInfo.lastPage < pagingInfo.totalPage){
			str += "<li class='page-item";
			if(pagingInfo.lastPage >= pagingInfo.totalPage){
				str += " disabled";
			}
			str += ">";
			str += "<a class='page-link' href='#' onclick='pageFunc("+pagingInfo.lastPage+1 + ">다음</a>";
			str += "</li>";
			str += "</ul>";
			str += "</nav>";
		}
		if(kindFlag == 'spaceConfirmList'){
			$('.spaceConfirmListDivPage').html(str);	
		}else if(kindFlag == 'spaceConfirmHistoryList'){
			$('.spaceConfirmHistoryListDivPage').html(str);
		}
	}
	
	$.spaceConfirmListSend = function(curPage) {
		$('input[name=currentPage]').val(curPage);
		
		$.ajax({
			url:"<c:url value='/admin/space/spaceConfirmList/ajax_spaceConfirmList'/>",
			type:"post",
			data:$('form[name=spaceConfirmListSearchFrm]').serializeArray(),
			dataType:"json",
			success:function(res){
				totalCount = res.pagingInfo.totalRecord;
				
				if(res!=null){
					$.spaceConfirmListSearch(res);
					pageMake(res.pagingInfo);
				}
				
			},
			error:function(xhr, status, error){
				alert("에러 발생: " + error);
			}
		});
	}
		
	$.spaceConfirmHistoryListSend = function(curPage) {
		$('input[name=currentPage]').val(curPage);
		
		$.ajax({
			url:"<c:url value='/admin/space/spaceConfirmList/ajax_spaceConfirmHistoryList'/>",
			type:"post",
			data:$('form[name=spaceConfirmHistoryListSearchFrm]').serializeArray(),
			dataType:"json",
			success:function(res){
				totalCount = res.pagingInfo.totalRecord;
				
				if(res!=null){
					$.spaceConfirmHistoryListSearch(res);
					pageMake(res.pagingInfo);
				}
				
			},
			error:function(xhr, status, error){
				alert("에러 발생: " + error);
			}
		});
	}
	
	//승인 또는 거절할 체크박스 유효성 검사 시작
	$.spaceConfirm = function () {
		if($('td>input[type=checkbox]:checked').length<1){
			$('#confirm1 .modal-body').html("최소 하나 이상의 요청을 선택하세요.");
			$('#cancelBt').html("확인");
			$('#confirm1').modal("show");
		}else{
			$('#confirm1 .modal-body').html("선택된 요청을 승인 처리하시겠습니까?");
			$('#okBt').show();
			$('#okBt').addClass("btn-primary");
			$('#cancelBt').html("취소");
			$('#okBt').html("승인");
			$('#confirm1').modal("show");
			$('#okBt').click(function() {
				$('#confirm1').modal("hide");
				$(this).removeClass("btn-primary");
				$('#okBt').hide();
				$('form[name=trFrm]').attr("action", "/spaceCollection/admin/space/spaceConfirmList/confirm");
				$('form[name=trFrm]').submit();
			});
		}
	}
	
	$.spaceDenine = function() {
		if($('td>input[type=checkbox]:checked').length<1){
			$('#confirm1 .modal-body').html("최소 하나 이상의 요청을 선택하세요.");
			$('#cancelBt').html("확인");
			$('#confirm1').modal("show");
		}else{
			$('#confirm1 .modal-body').html("선택된 요청을 거절 처리하시겠습니까?");
			$('#okBt').show();
			$('#okBt').addClass("btn-danger");
			$('#cancelBt').html("취소");
			$('#okBt').html("거절");
			$('#confirm1').modal("show");
			$('#okBt').click(function() {
				$('#confirm1').modal("hide");
				$(this).removeClass("btn-danger");
				$('#okBt').hide();
				$('form[name=trFrm]').attr("action", "/spaceCollection/admin/space/spaceConfirmList/denine");
				$('form[name=trFrm]').submit();				
			});
		}	
	}
	
	function spaceNum(evt,th,thDesc,orderStand) {
		if($(evt).hasClass(thDesc)){
			$(evt).removeClass(thDesc);
			$(evt).addClass(th);
			$('input[name=order]').val(orderStand);
			$.spaceConfirmHistoryListSend(1);
		}else{
			$(evt).removeClass(th);
			$(evt).addClass(thDesc);
			$('input[name=order]').val(orderStand +" desc");
			$.spaceConfirmHistoryListSend(1);
		}
	}
	
	function locationHref(spaceNum) {
		location.href = "/spaceCollection/admin/space/spaceConfirmList/spaceConfirmDetail?spaceNum="+spaceNum;
	}
	//승인 또는 거절할 체크박스 유효성 검사 끝
</script>
<main id="main" class="main">

	<div class="pagetitle">
		<h1>공간 관리</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">홈</li>
				<li class="breadcrumb-item">공간 관리</li>
				<li class="breadcrumb-item active">공간 승인 관리</li>
			</ol>
		</nav>
	</div>
	
	<section class="section profile">
		<div class="row">
			<div class="col-lg-6" style="width: 100%">
				<div class="card" id="card">
					<div class="card-body pt-3">
						<h5 class="card-title" style="font-weight: bold;"><a>공간 승인 관리</a></h5>
						<ul class="nav nav-tabs nav-tabs-bordered">
							<li class="nav-item">
								<button class="nav-link active" data-bs-toggle="tab"
									data-bs-target="#spaceConfirmList" name="spaceConfirmListTab">
									승인 요청</button>
							</li>
							<li class="nav-item">
								<button class="nav-link" data-bs-toggle="tab"
									data-bs-target="#spaceConfirmHistoryList"
									name="spaceConfirmHistoryListTab">승인 내역</button>
							</li>
						</ul>

						<!-- 장소 승인 요청 내역 시작 -->
						<div class="tab-pane fade show active" id="spaceConfirmList">
							<div class="row">
								<div class="col-12" id="buttonDiv"></div>
							</div>
							<div class="row mb-3">

								<form name="trFrm" method="post">
									<table class="table">
										<colgroup>
											<col style="width: 5%;" />
											<col style="width: 7%;" />
											<col style="width: 12%;" />
											<col style="width: 33%;" />
											<col style="width: 15%;" />
											<col style="width: 13%;" />
											<col style="width: 15%;" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col"><input type="checkbox" name="chkAll"></th>
												<th scope="col">번호</th>
												<th scope="col">공간 타입</th>
												<th scope="col">공간명</th>
												<th scope="col">신청인</th>
												<th scope="col">상태</th>
												<th scope="col">신청일</th>
											</tr>
										</thead>
	
										<tbody id="spaceConfirmListTbody">
											<!-- ajax로 승인 요청 내역 출력 -->
										</tbody>
									</table>
								</form>

								<div class="spaceConfirmListDivPage">
									<!-- ajax로 페이징 -->
								</div>
								<form class="col align-items-center"
									name="spaceConfirmListSearchFrm" onsubmit="return false">
									<input type="hidden" name="currentPage" value="1"> <input
										type="hidden" name="order">
									<div class="searchDiv">
										<div style="float: left;">
											<button class="btn btn-light excelDownloadBt" type="button">
												<i class="bi bi-filetype-xlsx"></i> 엑셀 다운로드
											</button>
										</div>
										<div class="col-auto">
											<button type="button" id="spaceConfirmListSearchBt"
												class="btn btn-primary">검색</button>
										</div>

										<div class="col-sm-3" id="keyword">
											<label class="visually-hidden" for="searchKeyword">searchCondition</label>
											<input type="text" class="form-control" id="searchKeyword"
												name="searchKeyword" value="${searchVo.searchKeyword }">
										</div>
										<div class="col-sm-3" id="select">
											<select class="form-select" name="searchCondition"
												id="searchCondition">
												<option value="space_num"
													<c:if test="${param.searchCondition=='space_num'}">
								            		selected="selected"
								            	</c:if>>공간
													번호</option>
												<option value="space_type_name"
													<c:if test="${param.searchCondition=='space_type_name'}">
								            		selected="selected"
								            	</c:if>>공간
													타입명</option>
												<option value="space_name"
													<c:if test="${param.searchCondition=='space_name'}">
								            		selected="selected"
								            	</c:if>>공간명</option>
												<option value="user_id"
													<c:if test="${param.searchCondition=='user_id'}">
								            		selected="selected"
								            	</c:if>>신청인</option>
											</select>
										</div>

									</div>
								</form>
							</div>

						</div>
						<!-- 장소 승인 요청 내역 끝 -->


						<!-- 장소 승인 내역 시작 -->
						<div class="tab-pane fade pt-3" id="spaceConfirmHistoryList">
							<form class="col align-items-center"
								name="spaceConfirmHistoryListSearchFrm" onsubmit="return false">
								<div class="row mb-3">
									<div>
										<select class="form-select" name="status" id="status">
											<option value=""
												<c:if test="${param.status=='user_id'}">
								            		selected="selected"
								            	</c:if>>전체보기</option>
											<option value="Y"
												<c:if test="${param.status=='Y'}">
								            		selected="selected"
								            	</c:if>>승인</option>
											<option value="R"
												<c:if test="${param.status=='R'}">
								            		selected="selected"
								            	</c:if>>승인요청</option>
											<option value="N"
												<c:if test="${param.status=='N'}">
								            		selected="selected"
								            	</c:if>>거절</option>
										</select>
									</div>
									<table class="table" id="temp">
										<colgroup>
											<col style="width: 6%;" />
											<col style="width: 12%;" />
											<col style="width: 31%;" />
											<col style="width: 15%;" />
											<col style="width: 14%;" />
											<col style="width: 14%;" />
											<col style="width: 8%;" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col"><i
													class="bi bi-chevron-bar-expand spaceNumDesc"
													onclick="spaceNum(this, 'spaceNum', 'spaceNumDesc', 'space_num')">
												</i>번호</th>
												<th scope="col"><i
													class="bi bi-chevron-bar-expand spaceTypeNameDesc"
													onclick="spaceNum(this, 'spaceTypeName', 'spaceTypeNameDesc', 'SPACE_TYPE_NAME')">
												</i>공간 타입</th>
												<th scope="col"><i
													class="bi bi-chevron-bar-expand spaceNameDesc"
													onclick="spaceNum(this, 'spaceName', 'spaceNameDesc', 'SPACE_NAME')">
												</i>공간명</th>
												<th scope="col"><i
													class="bi bi-chevron-bar-expand userIdDesc"
													onclick="spaceNum(this, 'userId', 'userIdDesc', 'user_id')">
												</i>신청인</th>
												<th scope="col"><i
													class="bi bi-chevron-bar-expand spaceRequestDateDesc"
													onclick="spaceNum(this, 'spaceRequestDate', 'spaceRequestDateDesc', 'space_request_date')">
												</i>요청일</th>
												<th scope="col"><i
													class="bi bi-chevron-bar-expand spaceRegDateDesc"
													onclick="spaceNum(this, 'spaceRegDate', 'spaceRegDateDesc', 'space_reg_date')">
												</i>결정일</th>
												<th scope="col"><i
													class="bi bi-chevron-bar-expand spaceRequestStatusDesc"
													onclick="spaceNum(this, 'spaceRequestStatus', 'spaceRequestStatusDesc', 'space_request_status')">
												</i>상태</th>
											</tr>
										</thead>
										<tbody id="spaceConfirmHistoryListTbody">
											<!-- ajax로 승인 내역 출력 -->
										</tbody>
									</table>
									<div class="spaceConfirmHistoryListDivPage">
										<!-- ajax로 페이징 -->
									</div>

									<input type="hidden" name="currentPage" value="1"> <input
										type="hidden" name="order" value="${param.order }">
									<div class="searchDiv" class="row" style="width: 100%">
										<div style="float: left;" class="col">
											<button class="btn btn-light excelDownloadBt" type="button">
												<i class="bi bi-filetype-xlsx"></i> 엑셀 다운로드
											</button>
										</div>
										<div class="col-auto">
											<button type="button" id="spaceConfirmHistoryListSearchBt"
												class="btn btn-primary">검색</button>
										</div>

										<div class="col-sm-3" id="keyword">
											<label class="visually-hidden" for="searchKeyword">searchCondition</label>
											<input type="text" class="form-control" id="searchKeyword"
												name="searchKeyword" value="${searchVo.searchKeyword }">
										</div>
										<div class="col-sm-3" id="select">
											<select class="form-select" name="searchCondition"
												id="searchCondition">
												<option value="space_num"
													<c:if test="${param.searchCondition=='space_num'}">
								            		selected="selected"
								            	</c:if>>공간
													번호</option>
												<option value="space_type_name"
													<c:if test="${param.searchCondition=='space_type_name'}">
								            		selected="selected"
								            	</c:if>>공간
													타입명</option>
												<option value="space_name"
													<c:if test="${param.searchCondition=='space_name'}">
								            		selected="selected"
								            	</c:if>>공간명</option>
												<option value="user_id"
													<c:if test="${param.searchCondition=='user_id'}">
								            		selected="selected"
								            	</c:if>>신청인</option>
											</select>

										</div>

									</div>
								</div>
							</form>

						</div>
						<!-- 승인 내역 끝 -->
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- Modal -->
	<div class="modal fade" id="confirm1" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">
						<i class="bi bi-exclamation-circle"></i>
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" id="cancelBt"></button>
					<button type="button" class="btn" id="okBt"></button>
				</div>
			</div>
		</div>
	</div>
	<!-- EndModal -->
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
					<p>
						엑셀에 포함시킬 데이터를 선택하세요.&nbsp;&nbsp; <input class="form-check-input"
							type="checkbox" value="" id="columnChkAll" name="columnChkAll">
						<label class="form-check-label" for="columnChkAll">전체 선택</label>
					</p>
					<div class="container text-center " id="MChkDiv">
						<p id="warning">※ 최소 하나 이상의 컬럼을 선택하세요.</p>
						<c:set var="columnListEng1"
							value="${fn:split('spaceNum,spaceBusinessNum,userId,spacePhoneNum,spaceRequestStatus,spaceRegDate,sdType,sdpeople,sdTime', ',') }" />
						<c:set var="columnListKor1"
							value="${fn:split('공간번호,사업자번호,아이디,연락처,상태,승인일,상세타입,사용인원,운영시간', ',') }" />
						<c:set var="columnListEng2"
							value="${fn:split('spaceName,spaceAddress,userEmail,spaceTag,delFlag,spaceRequestDate,spaceTypeName,sdPrice,facility', ',') }" />
						<c:set var="columnListKor2"
							value="${fn:split('공간명,공간주소,이메일,공간태그,삭제여부,승인요청일,공간타입명,가격정보,시설', ',') }" />
						<form name="excelFrm"
							action="<c:url value='/admin/space/spaceExcelDownload'/>"
							method="post">
							<div class="row align-items-start">
								<div class="col marginTop">
									<c:forEach var="i" begin="0"
										end="${fn:length(columnListEng1)-1 }">
										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												value="${2*i }" id="${columnListEng1[i] }"
												name="headerListIndex[${2*i }]"> <label
												class="form-check-label" for="${columnListEng1[i] }">${columnListKor1[i] }</label>
										</div>
									</c:forEach>
								</div>

								<div class="col marginTop">
									<c:forEach var="i" begin="0"
										end="${fn:length(columnListEng2)-1 }">
										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												value="${2*i+1 }" id="${columnListEng2[i] }"
												name="headerListIndex[${2*i+1 }]"> <label
												class="form-check-label" for="${columnListEng2[i] }">${columnListKor2[i] }</label>
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

<%@ include file="../../form/adminBottom.jsp"%>
