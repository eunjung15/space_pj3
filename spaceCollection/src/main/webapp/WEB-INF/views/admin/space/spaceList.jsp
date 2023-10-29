<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../form/adminTop.jsp"%>
<style type="text/css">
main>div>nav {
	float: left;
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

#MChkDiv {
	margin-top: 5px;
	text-align: left;
}

.marginTop {
	margin-top: 5px;
}

.marginTop>div {
	text-align: left;
}


#spaceConfirmHistoryList{
	clear: both;
}

th>i{
	cursor: pointer;
}


</style>
<script type="text/javascript">
	$(function() {
		$('#okBt').hide();
		$.spaceListSend(1);
		
		//페이지 출력 관련 시작

		$('#spaceListSearchBt').click(function() {
			$.spaceListSend(1);
		});
		
	});
	
	function mouseIn(evt) {
		$(evt).find('td').css("background-color", "#d1cece");
	}
	function mouseOut(evt) {
		$(evt).find('td').css("background-color", "white");
	}
	
	$.spaceListSearch = function() {
		$.ajax({
			url : "<c:url value='/admin/space/space/ajax_spaceList'/>",
			type: 'post',
			data: $('form[name=spaceListSearchFrm]').serializeArray(),
			dataType: 'json',
			success:function(res){
				$('#blockSize').val(res.pagingInfo.blockSize);
				$('input[name=currentPage]').val(res.searchVo.currentPage);
				$('input[name=userId]').val(res.searchVo.userId);
				$('input[name=searchKeyword]').val(res.searchVo.searchKeyword);
				$('input[name=searchCondition]').val(res.searchVo.searchCondition);
				var str = "";
				if(res.ajaxList!=null && res.ajaxList.length>0){
					$('#spaceListTbody>form').html("");
										
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
							str += "</tr>";
							
						});
						$('#spaceListTbody').html(str);
						pageMake(res.pagingInfo);
				}else{
					str = "<tr>"
						+ "<td colspan='6' style='text-align: center;''>승인 내역이 없습니다.</td>"
						+ "</tr>"
					$('#spaceListTbody').html(str);
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
				str += "<li class='page-item'><a class='page-link' aria-label='Previous' href='#' onclick='$.spaceListSend("+ i +")'>"+i+"</a>";
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
		
		$('.spaceListDivPage').html(str);	
	}
	
	$.spaceListSend = function(curPage) {
		$('input[name=currentPage]').val(curPage);
		
		$.ajax({
			url:"<c:url value='/admin/space/space/ajax_spaceList'/>",
			type:"post",
			data:$('form[name=spaceListSearchFrm]').serializeArray(),
			dataType:"json",
			success:function(res){
				totalCount = res.pagingInfo.totalRecord;
				
				if(res!=null){
					$.spaceListSearch(res);
					pageMake(res.pagingInfo);
				}
				
			},
			error:function(xhr, status, error){
				alert("에러 발생: " + error);
			}
		});
	}
	
	
	function spaceNum(evt,th,thDesc,orderStand) {
		if($(evt).hasClass(thDesc)){
			$(evt).removeClass(thDesc);
			$(evt).addClass(th);
			$('input[name=order]').val(orderStand);
			$.spaceListSend(1);
		}else{
			$(evt).removeClass(th);
			$(evt).addClass(thDesc);
			$('input[name=order]').val(orderStand +" desc");
			$.spaceListSend(1);
		}
	}
	
	function locationHref(spaceNum) {
		location.href = "/spaceCollection/admin/space/spaceList/spaceDetail?spaceNum="+spaceNum;
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
				<li class="breadcrumb-item active">공간 관리</li>
			</ol>
		</nav>
	</div>
	
	<section class="section profile">
		<div class="row">
			<div class="col-lg-6" style="width: 100%">
				<div class="card" id="card">
					<div class="card-body pt-3">
						<h5 class="card-title" style="font-weight: bold;"><a>공간 관리</a></h5>
						<hr>
						<div class="tab-pane show" id="spaceList">
							<form class="col align-items-center"
								name="spaceListSearchFrm" onsubmit="return false">
								<input type="hidden" name="status" value="Y">
								<div class="row mb-3">
									<table class="table" id="temp">
										<colgroup>
											<col style="width: 7%;" />
											<col style="width: 15%;" />
											<col style="width: 32%;" />
											<col style="width: 16%;" />
											<col style="width: 15%;" />
											<col style="width: 15%;" />
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
											</tr>
										</thead>
										<tbody id="spaceListTbody">
											<!-- ajax로 승인 내역 출력 -->
										</tbody>
									</table>
									<div class="spaceListDivPage">
										<!-- ajax로 페이징 -->
									</div>

									<input type="hidden" name="currentPage" value="1"> <input
										type="hidden" name="order" value="${param.order }">
									<div class="searchDiv" class="row" style="width: 100%">
										<div class="col-auto">
											<button type="button" id="spaceListSearchBt"
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
</main>

<%@ include file="../../form/adminBottom.jsp"%>
