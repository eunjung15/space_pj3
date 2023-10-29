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
	
	
</style>
<script type="text/javascript" src="<c:url value='/resource/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript">
	$(function() {
		
		$.start();
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
		
		var i = 0;
		
		$('select').change(function() {
			$.start();
		});
		
	});
		
		$.start = function(){
			$.ajax({
		
			url : "<c:url value='/admin/board/boardWrite_file'/>",
			type: 'get',
			data: "boardTypeName=" + $('select>option:selected').val(),
			dataType: 'json',
			success:function(res){
				$('#boardTypeName').val(res.boardTypeName);
				$('input[name=boardTypeId]').val(res.boardTypeId);
				if(res.boardTypeFileOk=='Y'){
					$('#fileDiv').show();
					
					var a = 0;
					var file="";
					
						for(var i=0; i<res.boardTypeFileNum; i++){
					var	filePlus = "<div class='input-group'>"
						+"<input type='file' class='form-control' id='fileItems' aria-describedby='inputGroupFileAddon04' aria-label='Upload' name='file"+a+"Items'>"
						+"</div>";
						file += filePlus;
						a++;
					}
					
					$('#ajaxInput').html(file);
				}else{
					$('#fileDiv').hide();
				}
				
			},
			error:function(xhr, status, error){
				alert(status + " : " + error);
			}
		});	
	
	}
</script>
<main id="main" class="main">

	<div class="pagetitle">
		<h1>게시판 생성/관리</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">홈</li>
				<li class="breadcrumb-item">게시판 생성/관리</li>
				<li class="breadcrumb-item">게시물 관리</li>
				<li class="breadcrumb-item active">게시물 작성</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section">
		<div class="row">
			<div class="col-lg-6" style="width: 100%">

				<div class="card" id="pageDiv" >
					<div class="card-body">
 						<h5 class="card-title" style="font-weight: bold;">게시물 작성</h5>
 						<form class="row gx-3 gy-2 align-items-center" name="boardFrm" id="boardFrm" method="post" 
 						action="<c:url value='/admin/board/boardWriteSub'/>" enctype="multipart/form-data"
 							onkeydown="return event.key != 'Enter';">
							<div id="searchDiv">
								<div class="col-sm-3" id="select">
									<label class="col-sm-2 col-form-label" for="boardTypeName">게시판 분류</label>
									<select class="form-select labelNext " name="boardTypeName" id="boardTypeId">
										<c:forEach var="boardTypeVo" items="${list }">
											<option value="${boardTypeVo.boardTypeName }" <c:if test="${boardTypeName == boardTypeVo.boardTypeName}">
							            		selected="selected"
							            	</c:if> >${boardTypeVo.boardTypeName }</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-sm-3" id="keyword">
									<label class="col-sm-2 col-form-label" for="boardTitle">제목</label>
									<input type="text" class="form-control labelNext" id="boardTitle" name="boardTitle">
									<span class="titleLimit" id="strCount"></span>
									<span class="titleLimit" id="titleLimit">&nbsp;/45자 이내)</span>
									<input type="hidden" class="form-control" id="userid" name="userid" value="관리자">
								</div>
								
							</div>
							<textarea name="boardContent" id="contents"></textarea>
							<input type="hidden" name="boardTypeName" id="boardTypeName">
							<input type="hidden" name="userNum" value="9999999">
							<input type="hidden" name="fileOk">
							<input type="hidden" name="boardTypeId">
						
							<div id="fileDiv">
								<div class="input-group" id="ajaxInput">
								</div>
							</div>
						</form>
							<input type="hidden" id="boardTypeFileSize" value="${boardTypeVo.boardTypeFileSize }">
						
						<div class="col-auto" id="btDiv">
							<button type="button" class="btn btn-primary" id="submit">등록</button>
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
