<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../form/adminTop.jsp"%>
<style type="text/css">
	div#searchDiv>div {
 	   width: 100%;
	}
	
	.labelNext{
		width: 70%;
		float: left;
	}
	
	div#searchDiv>div label {
    	float: left;
    	width: 86px;
    	margin-bottom: 14px;
		text-align: right;
		margin-right: 10px
	}
	
	#keyword{
		clear: both;
	}
	
	.titleLimit{
		display: block;
		padding-top: 6px;
		font-size: 15px;
		color: gray;
	}
	
	#strCount{
		float: left;
	}
	
	i.bi.bi-exclamation-circle {
 		color: #ffd600;
   		font-size: 40px;
   		display: block;
   		margin-block: -13px;
	}
	
	form#fileFrm>* {
    	width: 100%;
	}
	
	#fileDiv{
		width: 100%;
		border: solid 1px rgb(212,212,212);
		margin-top: 20px;
		padding-bottom: 10px;
	}
	
	input[type=file]{
		margin-top: 10px;
	}
	
	#btDiv{
		margin-top: 10px;
		float: right;
	}
	
	#btDiv>button{
		width: 100px;
	}
	
	#fileDiv>div{
		width: 85%;
		float: left;
	}
	
	#fileDiv>button {
		width: 100px;
		margin-top: 10px;
		float: right;
	}
	
	i.bi.bi-exclamation-circle{
 		color: #ffd600;
   		font-size: 40px;
   		display: block;
   		margin-block: -13px;
	}
	
	#ajaxInput span{
		margin-top: 5px;
		margin-bottom: 5px;
		margin-right: 20px;
	}
	
	#deleteFileBt{
		margin-left: 15px;
	}
	
	.input-group i{
		display: block;
		margin-top: 5px; 
		cursor: pointer;
	}
	
</style>
<script type="text/javascript" src="<c:url value='/resource/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$('#strCount').html('&nbsp;&nbsp('+0);
		
		CKEDITOR.replace('contents', {
			uploadUrl : '<c:url value='/admin/board/boardWrite'/>',
			filebrowserUploadUrl : '<c:url value='/admin/board/fileUpload'/>',
			width : '100%'
			
		});
		
		$('#submit').click(function() {
			$('form').submit();
		});
		
		$('#cancel').click(function() {
			$('#confirm').addClass('historyback');
			$('.modal-footer>#cancel').css('visibility', 'visible');
			$('.modal-body').html("작성을 취소하시겠습니까? 작성된 내용은 저장되지 않습니다.");
			$('#confirm1').modal('show');

			$('.historyback').click(function() {
				$(this).removeClass('historyback');
				history.back();
				
			});
		});
		
		$('form').submit(function() {
			if($('#boardTitle').val().trim().length<1){
				$('#confirm').addClass('titleFocus');
				$('.modal-body').html("제목을 입력하세요.");
		        $('#confirm1').modal('show');

		        $('.titleFocus').click(function() {
					$('#boardTitle').val('');
					$('#boardTitle').focus();
					$(this).removeClass('titleFocus');
				}); 
				
				return false;
			}
			
			var content = CKEDITOR.instances.contents.getData();
			
			if(content==""){
				$('#confirm').addClass('contentFocus');
				$('.modal-body').html("게시물 내용을 입력하세요.");
		        $('#confirm1').modal('show');
		        
				$('.contentFocus').click(function() {
					CKEDITOR.instances.contents.focus();
					$(this).removeClass('contentFocus');
				}); 
				
				return false;
			}
			
			
		});
		
			
		$('#boardTitle').keyup(function (e) {
			let titleStr = $(this).val();
		    
		    // 글자수 세기
		    if (titleStr.length == 0 || titleStr == '') {
		    	$('#strCount').html('&nbsp;&nbsp('+0);
		    } else {
		    	$('#strCount').html('&nbsp;&nbsp(' + titleStr.length);
		    }
		    
		    // 글자수 제한
		    if (titleStr.length > 45) {
		    	// 45자 부터는 타이핑 되지 않도록
		        $(this).val($(this).val().substring(0, 45));
		        // 45자 넘으면 알림창 뜨도록
		        $('.modal-body').html("제목은 45자를 초과할 수 없습니다.");
		        $('#confirm1').modal('show');
				$('#confirm1').on('hidden.bs.modal', function (e) {
					$('#boardTitle').focus();
				});
		    };
		});	
		
		$('input[type=submit]').click(function() {
			$('#boardFrm').submit();
		});
		var a = 5;
		$('.input-group i').click(function() {
			$(this).parent().find("span").replaceWith("<div class='input-group'><input type='file' class='form-control' id='fileItems' aria-describedby='inputGroupFileAddon04' aria-label='Upload' name='file"+a+"Items'></div>");
			$(this).parent().find("input[type=hidden]").attr("disabled", false);
			$(this).replaceWith("");
			a = a+1;
		});
		
	});
</script>
<main id="main" class="main">

	<div class="pagetitle">
		<h1>게시판 생성/관리</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">홈</li>
				<li class="breadcrumb-item">게시판 생성/관리</li>
				<li class="breadcrumb-item">게시물 관리</li>
				<li class="breadcrumb-item active">게시물 수정</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section">
		<div class="row">
			<div class="col-lg-6" style="width: 100%">

				<div class="card" id="pageDiv" >
					<div class="card-body">
 						<h5 class="card-title" style="font-weight: bold;">게시물 수정</h5>
 						<form class="row gx-3 gy-2 align-items-center" name="boardFrm" id="boardFrm" method="post" 
 						action="<c:url value='/admin/board/boardEdit'/>" enctype="multipart/form-data"
 							onkeydown="return event.key != 'Enter';">
							<div id="searchDiv">
								<div class="col-sm-3" id="select">
									<label class="col-sm-2 col-form-label" for="boardTypeName">게시판 분류</label>
									<input type="text" name="boardTypeName" class="form-control labelNext" value="${map.BOARD_TYPE_NAME }" readonly="readonly">
								</div>
								<div class="col-sm-3" id="keyword">
									<label class="col-sm-2 col-form-label" for="boardTitle">제목</label>
									<input type="text" class="form-control labelNext" id="boardTitle" name="boardTitle" value="${map.BOARD_TITLE }">
									<span class="titleLimit" id="strCount"></span>
									<span class="titleLimit" id="titleLimit">&nbsp;/45자 이내)</span>
									<input type="hidden" class="form-control" id="userid" name="userid" value="관리자">
								</div>
								
							</div>
							<textarea name="boardContent" id="contents">${map.BOARD_CONTENT }</textarea>
							<input type="hidden" name="boardTypeId" id="boardTypeId" value="${map.BOARD_TYPE_ID }">
							<input type="hidden" name="boardNum" id="boardNum" value="${param.boardNum }">
							<input type="hidden" name="userNum" value="9999999">
							<input type="hidden" name="fileOk">
							<input type="hidden" name="boardTypeId">
							<c:if test="${map.BOARD_TYPE_FILE_OK == 'Y' }">
								<div id="fileDiv">
									<div class="input-group" id="ajaxInput">
										<c:set var="i" value="0"/>
										<c:forEach var="spaceFileVo" items="${spaceFileList }">
												<div class='input-group'>
													<span>${spaceFileVo.imgOriginalName }</span>
													<i class="bi bi-x-square-fill"></i>
													<input type="hidden" name="spaceFileItems[${i }].imgTempName" value="${spaceFileVo.imgTempName }" disabled="disabled">
													<input type="hidden" name="spaceFileItems[${i }].imgForeignKey" value="${spaceFileVo.imgForeignKey }" disabled="disabled">
												</div>
												<c:set var="i" value="${i+1 }"/>
										</c:forEach>
										<c:set var="cnt" value="${map.BOARD_TYPE_FILE_NUM - fn:length(spaceFileList) }"/>
										<c:set var="a" value="0"/>
										<c:forEach begin="1" end="${cnt }">
												<div class='input-group'>
													<input type='file' class='form-control' id='fileItems' aria-describedby='inputGroupFileAddon04' 
														aria-label='Upload' name='file${a }Items'>
												</div>
												<c:set var="a" value="${a+1 }"/>					
										</c:forEach>
									</div>
								</div>
							</c:if>
						</form>
							<input type="hidden" id="boardTypeFileSize" value="${boardTypeVo.boardTypeFileSize }">
						
						<div class="col-auto" id="btDiv">
							<button type="button" class="btn btn-primary" id="submit">수정</button>
							<button type="button" class="btn btn-secondary" id="cancel">취소</button>
						</div>
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
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" id="cancel" style="visibility: hidden;">취소</button>
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal" id="confirm">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- EndModal1 -->

</main>

<%@ include file="../../form/adminBottom.jsp"%>    
