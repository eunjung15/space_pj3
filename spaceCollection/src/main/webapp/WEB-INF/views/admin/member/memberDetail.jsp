<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../form/adminTop.jsp"%>
<style type="text/css">
	main>div>nav{
		float: left;
	}
	
	section{
		clear: both;
	}
	
	div.row{
		margin-top: 10px;
	}
	
	div.label{
		color: #677fa9;
		font-weight: bold;
	}
	
	#card {
    	min-height: 420px;
	}
	
	th, td{
		text-align: center;
	}
	
	#searchDiv>div {
    	float: right;
	}
	
	div#select {
    	width: 150px;
	}
	
	#searchDiv>div{
		margin-left: 5px;
	}
	
	form[name=boardTypeNameFrm] {
  	  clear: both;	
	}
	
	form[name=boardTypeNameFrm]>div {
 	   width: 500px;
 	   float: left;
	}
	
	form[name=boardTypeNameFrm]>div>label {
 	   width: 140px;
	}

	div#boardTypeselectDiv {
    	width: 200px;
    	margin-left: -38px;
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
	
	#return, #withdrawal{
		margin-top: 50px;
	}
	
	.goList{
		margin-top: -10px;
	}
	
	#profileImg{
		height: 190px;
	}
</style>
<script type="text/javascript">
	$(function() {
		$('#okBt').hide();
		
		$('li button').click(function() {
			$('input[name=searchKeyword]').val('');
		});

		$('form input[name=userId]').val($('main input[name=userId]').val());
		
		$('#reservationSearchBt').click(function() {
			$.reservationSend(1);
		});
		
		$('button[name=reservationTab]').click(function() {
			$.reservationListSearch();
			$.reservationSend(1);
		});

		$('#reviewSearchBt').click(function() {
			$.reviewSend(1);
		});
		
		$('button[name=reviewTab]').click(function() {
			$.reviewSend(1);
			$.reviewListSearch();
		});
		
		$('#commentsSearchBt').click(function() {
			$.commentsSend(1);
		});
		
		$('button[name=commentsTab]').click(function() {
			$.commentsSend(1);
			$.commentsListSearch();
		});
		
		$('#spaceSearchBt').click(function() {
			$.spaceSend(1);
		});
		
		$('button[name=spaceTab]').click(function() {
			$.spaceSend(1);
			$.spaceListSearch();
		});
		
		$('input[name=chkAll]').click(function() {
			var checkState = $(this).is(':checked')
			$('td>input[type=checkbox]').prop('checked', checkState);
		});
		
		$('li.nav-item>button').click(function() {
			$('input[name=chkAll]').prop('checked', false);
		});
		
		$('#withdrawal').click(function() {
			$('#okBt').addClass('withdrawal');
			$('.bi-exclamation-circle').css('color', 'red');
			$('.modal-body').html('해당 회원을 탈퇴시키겠습니까?<br>해당 회원이 작성한 모든 자료가 삭제됩니다.');
			$("#okBt").addClass('btn-danger');
			$('#okBt').html('탈퇴');
			$('#cancelBt').html('취소');
			$('#okBt').show();
			$('#confirm1').modal('show');
			$('.withdrawal').click(function() {
				$(this).removeClass('withdrawal')
				$("#okBt").removeClass('btn-danger');
				location.href="/spaceCollection/admin/member/memberWithdrawal?userId=" + $('main>input[name=userId]').val();
			});
		});
		
		$('#return').click(function() {
			$('#okBt').addClass('return');
			$('.bi-exclamation-circle').css('color', '#ffd600');
			$('.modal-body').html('해당 회원을 복구시키겠습니까?');
			$('#okBt').addClass('btn-success');
			$('#okBt').html('복구');
			$('#cancelBt').html('취소');
			$('#okBt').show();
			$('#confirm1').modal('show');
			$('.return').click(function() {
				$(this).removeClass('return');
				$("#okBt").removeClass('btn-success');
				location.href="/spaceCollection/admin/member/memberReturn?userId=" + $('main>input[name=userId]').val();
			});
		});
		
		$('#goMList').click(function() {
			location.href="<c:url value = '/admin/member/memberList'/>";
		});
		
		$('#goWMList').click(function() {
			location.href="<c:url value = '/admin/member/withdrawalMemberList'/>";
		});
		
	});
	
	function mouseIn(evt) {
		$(evt).find('td').css("background-color", "#d1cece");
	}
	function mouseOut(evt) {
		$(evt).find('td').css("background-color", "white");
	}
	
	$.reservationListSearch = function() {
		$.ajax({
			url : "<c:url value='/admin/member/memberDetail/ajax_reservationList'/>",
			type: 'post',
			data: $('form[name=reservationSearchFrm]').serializeArray(),
			dataType: 'json',
			success:function(res){
				$('#blockSize').val(res.pagingInfo.blockSize);
				$('input[name=currentPage]').val(res.searchVo.currentPage);
				$('input[name=userId]').val(res.searchVo.userId);
				$('input[name=searchKeyword]').val(res.searchVo.searchKeyword);
				$('input[name=searchCondition]').val(res.searchVo.searchCondition);
				
				var str = "";
				if(res.ajaxList!=null && res.ajaxList.length>0){
					
					$('#reservationTbody').html("");
					
					str = "";
						$.each(res.ajaxList, function() {
								str += "<tr onmouseenter='mouseIn(this)' onmouseout='mouseOut(this)'>"
								str += "<td onclick='location.href=';' style='cursor: pointer;''>" + this.RESERVATION_NUM;
								str += "</td>";
								str += "<td onclick='location.href=';' style='cursor: pointer;'>" + this.SD_TYPE;
								str += "</td>";
								str += "<td onclick='location.href=';' style='cursor: pointer;'>" + this.SPACE_NAME;
								str += "</td>";
								str += "<td onclick='location.href=';' style='cursor: pointer;'>" + this.RESERVE_PEOPLE;
								str += "</td>";
								str += "<td onclick='location.href=';' style='cursor: pointer;'>" + this.RESERVER_PAY_DAY;
								str += "</td>";
						});
						
						$('#reservationTbody').html(str);
						pageMake(res.pagingInfo);
				}else{
					str = "<tr>"
						+ "<td colspan='5' style='text-align: center;''>예약 내역이 없습니다.</td>"
						+ "</tr>"
					$('#reservationTbody').html(str);
				}
				
			},
			
			error:function(xhr, status, error){
				alert(status + " : " + error);
			}
		});
	}
	
	$.commentsListSearch = function() {
		$.ajax({
			url : "<c:url value='/admin/member/memberDetail/ajax_commentsList'/>",
			type: 'post',
			data: $('form[name=commentsSearchFrm]').serializeArray(),
			dataType: 'json',
			success:function(res){
				$('#blockSize').val(res.pagingInfo.blockSize);
				$('input[name=currentPage]').val(res.searchVo.currentPage);
				$('input[name=userId]').val(res.searchVo.userId);
				$('input[name=searchKeyword]').val(res.searchVo.searchKeyword);
				$('input[name=searchCondition]').val(res.searchVo.searchCondition);
				var i = 0;
				var str = "";
				if(res.ajaxList!=null && res.ajaxList.length>0){
					
					$('#commentsTbody').html("");
					
					str = "<form name='trFrm' method='post' action=''>"
						$.each(res.ajaxList, function() {
								str += "<tr onmouseenter='mouseIn(this)' onmouseout='mouseOut(this)'>"
								str += "<td onclick='location.href='/spaceCollection/admin/board/boardDetail?boardNum="+this.BOARD_NUM+" style='cursor: pointer;''>" + this.COMMENT_NUM
								str += "</td>"
								str += "<td onclick='location.href=';' style='cursor: pointer;'>" + this.BOARD_NUM
								str += "</td>"
								str += "<td onclick='location.href=';' style='cursor: pointer;'>" + this.BOARD_TITLE
								str += "</td>"
								str += "<td onclick='location.href=';' style='cursor: pointer;'>" + this.COMMENT_CONTENT
								str += "</td>"
								str += "<td onclick='location.href=';' style='cursor: pointer;'>" + this.COMMENT_REG_DATE
								str += "</td>"
						});
						str += "</form>";
						i++;
						$('#commentsTbody').html(str);
						pageMake(res.pagingInfo);
				}else{
					str = "<tr>"
						+ "<td colspan='6' style='text-align: center;''>댓글 내역이 없습니다.</td>"
						+ "</tr>"
					$('#commentsTbody').html(str);
				}
				
			},
			
			error:function(xhr, status, error){
				alert(status + " : " + error);
			}
		});
	}
	
	$.reviewListSearch = function() {
		$.ajax({
			url : "<c:url value='/admin/member/memberDetail/ajax_reviewList'/>",
			type: 'post',
			data: $('form[name=reviewSearchFrm]').serializeArray(),
			dataType: 'json',
			success:function(res){
				$('#blockSize').val(res.pagingInfo.blockSize);
				$('input[name=currentPage]').val(res.searchVo.currentPage);
				$('input[name=userId]').val(res.searchVo.userId);
				$('input[name=searchKeyword]').val(res.searchVo.searchKeyword);
				$('input[name=searchCondition]').val(res.searchVo.searchCondition);
				var i = 0;
				var str = "";
				if(res.ajaxList!=null && res.ajaxList.length>0){
					
					$('#reviewTbody').html("");
					
					str = "<form name='trFrm' method='post' action=''>"
						$.each(res.ajaxList, function() {
								str += "<tr onmouseenter='mouseIn(this)' onmouseout='mouseOut(this)'>"
								str += "<td onclick='location.href=';' style='cursor: pointer;''>" + this.REVIEW_NUM
								str += "</td>"
								str += "<td onclick='location.href=';' style='cursor: pointer;'>" + this.RESERVATION_NUM
								str += "</td>"
								str += "<td onclick='location.href=';' style='cursor: pointer;'>" + this.SPACE_NAME
								str += "</td>"
								str += "<td onclick='location.href=';' style='cursor: pointer;'>" + this.RESERVER_PAY_DAY
								str += "</td>"
								str += "<td onclick='location.href=';' style='cursor: pointer;'>" + this.REVIEW_REG_DATE
								str += "</td>"
						});
						str += "</form>";
						i++;
						$('#reviewTbody').html(str);
						pageMake(res.pagingInfo);
				}else if(res.ajaxList.length==0){
					str = "<tr>"
						+ "<td colspan='6' style='text-align: center;''>리뷰 내역이 없습니다.</td>"
						+ "</tr>"
					$('#reviewTbody').html(str);
				}
				
			},
			
			error:function(xhr, status, error){
				alert(status + " : " + error);
			}
		});
	}
	
	$.spaceListSearch = function() {
		$.ajax({
			url : "<c:url value='/admin/member/memberDetail/ajax_spaceList'/>",
			type: 'post',
			data: $('form[name=spaceSearchFrm]').serializeArray(),
			dataType: 'json',
			success:function(res){
				$('#blockSize').val(res.pagingInfo.blockSize);
				$('input[name=currentPage]').val(res.searchVo.currentPage);
				$('input[name=userId]').val(res.searchVo.userId);
				$('input[name=searchKeyword]').val(res.searchVo.searchKeyword);
				$('input[name=searchCondition]').val(res.searchVo.searchCondition);
				var i = 0;
				var str = "";
				if(res.ajaxList!=null && res.ajaxList.length>0){
					
					$('#spaceTbody').html("");
					
					str = "<form name='trFrm' method='post' action=''>"
						$.each(res.ajaxList, function() {
								str += "<tr onmouseenter='mouseIn(this)' onmouseout='mouseOut(this)'>";
								str += "<td onclick='location.href=';' style='cursor: pointer;''>" + this.SPACE_NUM;
								str += "</td>";
								if(this.SPACE_REQUEST_STATUS == '승인'){
									str += "<td onclick='locationHref("+this.SPACE_NUM+")' style='cursor: pointer;'>" + this.SPACE_NAME;
	
								}else{
									str += "<td onclick='locationHref2("+this.SPACE_NUM+")' style='cursor: pointer;'>" + this.SPACE_NAME;
								}
								
								str += "</td>";
								str += "<td onclick='location.href=';' style='cursor: pointer;'>" + this.SPACE_TYPE_NAME;
								str += "</td>";
								str += "<td onclick='location.href=';' style='cursor: pointer;'>" + this.SPACE_REQUEST_STATUS;
								if(this.SPACE_REQUEST_STATUS == '승인'){
									
								}else if(this.SPACE_REQUEST_STATUS == '거절'){
									
								}else if(this.SPACE_REQUEST_STATUS == '승인 요청'){
									
								}
								str += "</td>";
								str += "<td onclick='location.href=';' style='cursor: pointer;'>" + this.SPACE_REQUEST_DATE;
								str += "</td>";
								str += "<td onclick='location.href=';' style='cursor: pointer;'>" + this.SPACE_REG_DATE;
								str += "</td>";
						});
						str += "</form>";
						i++;
						$('#spaceTbody').html(str);
						pageMake(res.pagingInfo);
				}else if(res.ajaxList.length==0){
					str = "<tr>"
						+ "<td colspan='7' style='text-align: center;''>공간 등록 내역이 없습니다.</td>"
						+ "</tr>"
					$('#spaceTbody').html(str);
				}
				
			},
			
			error:function(xhr, status, error){
				alert(status + " : " + error);
			}
		});
	}
	
	function pageMake(pagingInfo) {
		//페이징 처리
		var blockSize = pagingInfo.blockSize;
		var countPerPage = pagingInfo.countPerPage;
		//게시물 구분
		var kindFlag = pagingInfo.kindFlag;
		
		
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
				if(kindFlag =='reservation'){
					str += "<li class='page-item'><a class='page-link' aria-label='Previous' href='#' onclick='$.reservationSend("+ i +")'>"+i+"</a>";
				}else if(kindFlag == 'review'){
					str += "<li class='page-item'><a class='page-link' aria-label='Previous' href='#' onclick='$.reviewSend("+ i +")'>"+i+"</a>";
				}else if(kindFlag == 'comments'){
					str += "<li class='page-item'><a class='page-link' aria-label='Previous' href='#' onclick='$.commentsSend("+ i +")'>"+i+"</a>";
				}else if(kindFlag == 'space'){
					str += "<li class='page-item'><a class='page-link' aria-label='Previous' href='#' onclick='$.spaceSend("+ i +")'>"+i+"</a>";
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
		if(kindFlag == 'reservation'){
			$('.reservationDivPage').html(str);	
		}else if(kindFlag == 'review'){
			$('.reviewdivPage').html(str);
		}else if(kindFlag == 'comments'){
			$('.commentsdivPage').html(str);
		}else if(kindFlag == 'space'){
			$('.spacedivPage').html(str);
		}
			
		
	}
	
	$.reservationSend = function(curPage) {
		$('input[name=currentPage]').val(curPage);
		
		$.ajax({
			url:"<c:url value='/admin/member/memberDetail/ajax_reservationList'/>",
			type:"post",
			data:$('form[name=reservationSearchFrm]').serializeArray(),
			dataType:"json",
			success:function(res){
				totalCount = res.pagingInfo.totalRecord;
				
				if(res!=null){
					$.reservationListSearch(res);
					pageMake();
				}
				
			},
			error:function(xhr, status, error){
				alert("에러 발생: " + error);
			}
		});
	}
		
	$.reviewSend = function(curPage) {
		$('input[name=currentPage]').val(curPage);
		
		$.ajax({
			url:"<c:url value='/admin/member/memberDetail/ajax_reviewList'/>",
			type:"post",
			data:$('form[name=reviewSearchFrm]').serializeArray(),
			dataType:"json",
			success:function(res){
				totalCount = res.pagingInfo.totalRecord;
				
				if(res!=null){
					$.reviewListSearch(res);
					pageMake();
				}
				
			},
			error:function(xhr, status, error){
				alert("에러 발생: " + error);
			}
		});
	}
		
	$.commentsSend = function(curPage) {
		$('input[name=currentPage]').val(curPage);
			
		$.ajax({
			url:"<c:url value='/admin/member/memberDetail/ajax_commentsList'/>",
			type:"post",
			data:$('form[name=commentsSearchFrm]').serializeArray(),
			dataType:"json",
			success:function(res){
				totalCount = res.pagingInfo.totalRecord;
				
				if(res!=null){
					$.commentsListSearch(res);
					pageMake();
				}
				
			},
			error:function(xhr, status, error){
				alert("에러 발생: " + error);
			}
		});
	}
	
	$.spaceSend = function(curPage) {
		$('input[name=currentPage]').val(curPage);
			
		$.ajax({
			url:"<c:url value='/admin/member/memberDetail/ajax_spaceList'/>",
			type:"post",
			data:$('form[name=spaceSearchFrm]').serializeArray(),
			dataType:"json",
			success:function(res){
				totalCount = res.pagingInfo.totalRecord;
				
				if(res!=null){
					$.spaceListSearch(res);
					pageMake();
				}
				
			},
			error:function(xhr, status, error){
				alert("에러 발생: " + error);
			}
		});
	}
	
	function locationHref(spaceNum) {
		location.href = "/spaceCollection/admin/space/spaceList/spaceDetail?spaceNum=" + spaceNum;
	}
	function locationHref2(spaceNum) {
		location.href = "/spaceCollection/admin/space/spaceConfirmList/spaceConfirmDetail?spaceNum=" + spaceNum;
	}
				
</script>
<main id="main" class="main">
	<input type="hidden" name="userId" value="${memberMap.USER_ID }">
	<div class="pagetitle">
		<h1>회원 상세보기</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">홈</li>
				<li class="breadcrumb-item">회원 관리</li>
				<li class="breadcrumb-item">회원 관리</li>
				<li class="breadcrumb-item active">회원 상세보기</li>
			</ol>
		</nav>
		<div style="float: right;">
			<c:if test="${memberMap.USER_OUT_TYPE != 'Y'}">
				<button class="btn btn-primary goList" id="goMList">회원 목록</button>
			</c:if>
			<c:if test="${memberMap.USER_OUT_TYPE == 'Y'}">
				<button class="btn btn-primary goList" id="goWMList">회원 목록</button>
			</c:if>
		</div>
	</div>
	<!-- End Page Title -->

	<section class="section profile">
		<div class="row">
			<div class="col-xl-4">
				<div class="card">
					<div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
						<c:if test="${memberMap.USER_SNS_CODE != null }">
							<img src="${memberMap.USER_PROFILE_IMAGE }" alt="Profile" class="rounded-circle" id="profileImg">
						</c:if>
						<c:if test="${memberMap.USER_SNS_CODE == null }">
							<img src="<c:url value='/user_images/default_profile.jpg'/>" alt="Profile" class="rounded-circle">	
						</c:if>
						<h2>${memberMap.USER_NAME }</h2>
						<h3>${memberMap.USER_ID }</h3>
					</div>
				</div>
			</div>

			<div class="col-xl-8">
				<div class="card" id="card">
					<div class="card-body pt-3">
						<ul class="nav nav-tabs nav-tabs-bordered">
							<li class="nav-item">
								<button class="nav-link active" data-bs-toggle="tab"
									data-bs-target="#profileOverview">회원 정보</button>
							</li>
							<c:if test="${memberMap.USER_OUT_TYPE != 'Y' }">
								<li class="nav-item">
									<button class="nav-link" data-bs-toggle="tab"
										data-bs-target="#reservationList" name="reservationTab">예약 내역</button>
								</li>
								<li class="nav-item">
									<button class="nav-link" data-bs-toggle="tab"
										data-bs-target="#reviewList" name="reviewTab">리뷰 내역</button>
								</li>
								<li class="nav-item">
									<button class="nav-link" data-bs-toggle="tab"
										data-bs-target="#commentList" name="commentsTab">댓글 내역</button>
								</li>
								<li class="nav-item">
									<button class="nav-link" data-bs-toggle="tab"
										data-bs-target="#spaceList" name="spaceTab">공간 등록 내역</button>
								</li>
							</c:if>
						</ul>
						<div class="tab-content pt-2">
							<!-- 회원정보 시작 -->
							<div class="tab-pane fade show active" id="profileOverview">
								<h5 class="card-title" style="font-weight: bold;">회원 상세정보</h5>

								<div class="row">
									<div class="col-lg-3 col-md-4 label ">이름</div>
									<div class="col-lg-9 col-md-8">${memberMap.USER_NAME }</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-4 label">연락처</div>
									<div class="col-lg-9 col-md-8">${memberMap.USER_HP }</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-4 label">주소</div>
									<div class="col-lg-9 col-md-8">${memberMap.ZIPCODE }<br>
										${memberMap.ADDRESS } ${memberMap.ADDRESS_DETAIL }
									</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-4 label">이메일</div>
									<div class="col-lg-9 col-md-8">${memberMap.USER_EMAIL }
									</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-4 label">마케팅 수신 동의</div>
									<div class="col-lg-9 col-md-8">
										이메일 : 
										<c:if test="${memberMap.USER_MARKETING_EMAIL_OK == 'Y' }">
											<span style="color: green;">동의</span>
										</c:if> 
										<c:if test="${memberMap.USER_MARKETING_EMAIL_OK != 'Y' }">
											<span style="color: red;">미동의</span>
										</c:if> 
										<br> 
										SMS : 
										<c:if test="${memberMap.USER_MARKETING_SMS_OK == 'Y' }">
											<span style="color: green;">동의</span>
										</c:if> 
										<c:if test="${memberMap.USER_MARKETING_SMS_OK != 'Y' }">
											<span style="color: red;">미동의</span>
										</c:if> 
										<br> 
									</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-4 label">가입일자</div>
									<div class="col-lg-9 col-md-8">
										${memberMap.USER_REG_DATE }
									</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-4 label">탈퇴여부</div>
									<div class="col-lg-9 col-md-8">
										<c:if test="${memberMap.USER_OUT_TYPE == 'Y' }">
											<span style="color: red;">탈퇴(탈퇴일 : ${memberMap.USER_OUT_DATE })</span>
										</c:if>
										<c:if test="${empty memberMap.USER_OUT_TYPE }">
											<span style="color: green;">가입</span>
										</c:if>
									</div>
									<div class="col text-center">
										<c:if test="${memberMap.USER_OUT_TYPE == 'Y' }">
											<button type="button" id="return" class="btn btn-outline-success">회원 복구</button>
										</c:if>
										<c:if test="${memberMap.USER_OUT_TYPE != 'Y' }">
											<button type="button" id="withdrawal" class="btn btn-outline-danger">회원 탈퇴</button>
										</c:if>
									</div>
								</div>
							</div>
							<!-- 회원정보 끝 -->
							<c:if test="${memberMap.USER_OUT_TYPE != 'Y' }">
								<!-- 예약 내역 시작 -->
								<div class="tab-pane fade pt-3" id="reservationList">
									<form class="row gx-3 gy-2 align-items-center" name="reservationSearchFrm" onsubmit="return false">
					 							<input type="hidden" name="currentPage" value="1">
					 							<input type="hidden" name="userId" value="${memberMap.USER_ID }">
					 												
											<div class="row mb-3">
												<table class="table">
													<colgroup>
														<col style="width: 13%;" />
														<col style="width: 13%;" />
														<col style="width: 42%;" />
														<col style="width: 16%;" />
														<col style="width: 16%;" />
													</colgroup>
													<thead>
														<tr>
															<th scope="col">예약 번호</th>
															<th scope="col">장소 구분</th>
															<th scope="col">예약 장소</th>
															<th scope="col">예약 인원</th>
															<th scope="col">예약일</th>
														</tr>
													</thead>
													<tbody id="reservationTbody">
														<!-- ajax로 예약 내역 출력 -->
													</tbody>
												</table>
												<div class="reservationDivPage">
													<!-- ajax로 페이징 -->
												</div>
													<div id="searchDiv">
														<div class="col-auto">
															<button type="button" id="reservationSearchBt" class="btn btn-primary">검색</button>
														</div>
														<div class="col-sm-3" id="keyword">
															<label class="visually-hidden" for="searchKeyword">searchCondition</label>
															<input type="text" class="form-control" id="searchKeyword"
																name="searchKeyword" value="${searchVo.searchKeyword }">
														</div>
														<div class="col-sm-3" id="select">
															<select class="form-select" name="searchCondition"
																id="searchCondition">
																<option value="reservation_num"
																	<c:if test="${param.searchCondition=='reservation_num'}">
									            						selected="selected"
									            					</c:if>>예약번호</option>
																<option value="space_name"
																	<c:if test="${param.searchCondition=='space_name'}">
									            						selected="selected"
									            					</c:if>>예약 장소명</option>
															</select>
														</div>
													</div>
											</div>
			
									</form>
								</div>
								<!-- 예약 내역 끝 -->
								<!-- 후기 내역 시작 -->
								<div class="tab-pane fade pt-3" id="reviewList">
									<form class="row gx-3 gy-2 align-items-center" name="reviewSearchFrm" onsubmit="return false">
										
					 							<input type="hidden" name="currentPage" value="1">
					 							<input type="hidden" name="userId" value="${memberMap.USER_ID }">
					 												
											<div class="row mb-3">
												<table class="table">
													<colgroup>
														<col style="width: 13%;" />
														<col style="width: 13%;" />
														<col style="width: 42%;" />
														<col style="width: 16%;" />
														<col style="width: 16%;" />
													</colgroup>
													<thead>
														<tr>
															<th scope="col">리뷰 번호</th>
															<th scope="col">예약 번호</th>
															<th scope="col">예약 장소</th>
															<th scope="col">예약일</th>
															<th scope="col">작성일</th>
														</tr>
													</thead>
													<tbody id="reviewTbody">
														<!-- ajax로 예약 내역 출력 -->
													</tbody>
												</table>
												<div class="reviewdivPage">
													<!-- ajax로 페이징 -->
												</div>
													<div id="searchDiv">
														<div class="col-auto">
															<button type="button" id="reviewSearchBt" class="btn btn-primary">검색</button>
														</div>
														<div class="col-sm-3" id="keyword">
															<label class="visually-hidden" for="searchKeyword">searchCondition</label>
															<input type="text" class="form-control" id="searchKeyword"
																name="searchKeyword" value="${searchVo.searchKeyword }">
														</div>
														<div class="col-sm-3" id="select">
															<select class="form-select" name="searchCondition"
																id="searchCondition">
																<option value="review_num"
																	<c:if test="${param.searchCondition=='review_num'}">
									            						selected="selected"
									            					</c:if>>리뷰번호</option>
																<option value="reservation_num"
																	<c:if test="${param.searchCondition=='reservation_num'}">
									            						selected="selected"
									            					</c:if>>예약번호</option>
																<option value="space_name"
																	<c:if test="${param.searchCondition=='space_name'}">
									            						selected="selected"
									            					</c:if>>예약 장소명</option>
															</select>
														</div>
													</div>
											</div>
			
									</form>
								</div>
								<!-- 후기 내역 끝 -->
								<!-- 댓글 내역 시작 -->
								<div class="tab-pane fade pt-3" id="commentList">
									<form class="row gx-3 gy-2 align-items-center" name="commentsSearchFrm" onsubmit="return false">

										<input type="hidden" name="currentPage" value="1"> 
										<input type="hidden" name="userId" value="${memberMap.USER_ID }">

										<div class="row mb-3">
											<table class="table">
												<colgroup>
													<col style="width: 13%;" />
													<col style="width: 13%;" />
													<col style="width: 42%;" />
													<col style="width: 16%;" />
													<col style="width: 16%;" />
												</colgroup>
												<thead>
													<tr>
														<th scope="col">댓글 번호</th>
														<th scope="col">게시물 번호</th>
														<th scope="col">게시물 제목</th>
														<th scope="col">작성 내용</th>
														<th scope="col">작성일</th>
													</tr>
												</thead>
												<tbody id="commentsTbody">
													<!-- ajax로 예약 내역 출력 -->
												</tbody>
											</table>
											<div class="commentsdivPage">
												<!-- ajax로 페이징 -->
											</div>
											<div id="searchDiv">
												<div class="col-auto">
													<button type="button" id="commentsSearchBt"
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
														<option value="comment_num"
															<c:if test="${param.searchCondition=='comment_num'}">
									            						selected="selected"
									            					</c:if>>댓글
															번호</option>
														<option value="board_num"
															<c:if test="${param.searchCondition=='board_num'}">
									            						selected="selected"
									            					</c:if>>게시물
															번호</option>
														<option value="board_title"
															<c:if test="${param.searchCondition=='board_title'}">
									            						selected="selected"
									            					</c:if>>게시물
															제목</option>
													</select>
												</div>
											</div>
										</div>

									</form>
								</div>
								<!-- 댓글 내역 끝 -->
								<!-- 공간 등록 내역 시작 -->
								<div class="tab-pane fade pt-3" id="spaceList">
									<form class="row gx-3 gy-2 align-items-center" name="spaceSearchFrm" onsubmit="return false">

										<input type="hidden" name="currentPage" value="1"> 
										<input type="hidden" name="userId" value="${memberMap.USER_ID }">

										<div class="row mb-3">
											<table class="table">
												<colgroup>
													<col style="width: 14%;" />
													<col style="width: 23%;" />
													<col style="width: 23%;" />
													<col style="width: 12%;" />
													<col style="width: 14%;" />
													<col style="width: 14%;" />
												</colgroup>
												<thead>
													<tr>
														<th scope="col">공간 번호</th>
														<th scope="col">공간명</th>
														<th scope="col">공간 종류</th>
														<th scope="col">상태</th>
														<th scope="col">요청일</th>
														<th scope="col">승인일</th>
													</tr>
												</thead>
												<tbody id="spaceTbody">
													<!-- ajax로 예약 내역 출력 -->
												</tbody>
											</table>
											<div class="spacedivPage">
												<!-- ajax로 페이징 -->
											</div>
											<div id="searchDiv">
												<div class="col-auto">
													<button type="button" id="spaceSearchBt"
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
									            					</c:if>>공간 번호
														</option>
														<option value="space_name"
															<c:if test="${param.searchCondition=='space_name'}">
									            						selected="selected"
									            		</c:if>>공간명
														</option>
													</select>
												</div>
											</div>
										</div>

									</form>
								</div>
								<!-- 공간 등록 내역 끝 -->
							</c:if>
						</div>
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
					<h5 class="modal-title"><i class="bi bi-exclamation-circle"></i></h5>
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