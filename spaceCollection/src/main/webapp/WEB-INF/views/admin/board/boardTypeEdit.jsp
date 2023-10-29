<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../form/adminTop.jsp"%>
<style type="text/css">
	form>button{
		float: right;
	}
	
	#editBt{
		margin-right: 5px;
	}
	.row{
		margin-bottom: 10px;
	}
	
</style>
<script type="text/javascript">
	$(function() {
		backupForm();
		
		$('#boardTypeFileOk').click(function() {
			if($('#boardTypeFileOk').is(":checked")){
				$('#boardTypeFileNum').removeAttr('readonly');
				$('#boardTypeFileSize').removeAttr('readonly');
			}else{
				$('#boardTypeFileNum').val(0);
				$('#boardTypeFileNum').attr('readonly', true);
				$('#boardTypeFileSize').val(0);
				$('#boardTypeFileSize').attr('readonly', true);
			}
		});
		
		$('#cancelBt2').click(function() {
			location.href="<c:url value='/admin/board/boardTypeList'/>";
		});
		
		
		$('#editBt2').click(function() {
			if(isChangeForm()){
				$('form').submit();
			}else{
				location.href="<c:url value='/admin/board/boardTypeEditn'/>";
			}
		});
		
	});
	
	var bForm = null;
	function backupForm(){
		beforeForm = $('#frm').serialize();
	}
		
	function isChangeForm() {
		var afterForm = $('#frm').serialize();
		if(beforeForm != afterForm){
			return true;
		}else{
			return false;
		}
	}
</script>
<main id="main" class="main">

	<div class="pagetitle">
		<h1>게시판 수정</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">홈</li>
				<li class="breadcrumb-item">게시판 생성/관리</li>
				<li class="breadcrumb-item active">게시판 수정</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section">
		<div class="row">
			<div class="col-lg-6" style="width: 100%">

				<div class="card" id="pageDiv" >
					<div class="card-body">
 						<h5 class="card-title" style="font-weight: bold;">게시판 수정</h5>
 						<form id="frm" action="<c:url value='/admin/board/boardTypeEdit'/>" method="post">
 							<input type="hidden" name="boardTypeId" value="${param.boardTypeId }">
 							<div class="row">
                  				<div class="col-2">
                  					<label for="boardTypeName" class="col-form-label">게시판 이름</label>
                  				</div>
                  				<div class="col-6">
                    				<input type="text" class="form-control" name="boardTypeName" id="boardTypeName" value="${vo.boardTypeName }">
                  				</div>
                			</div>
                			<div class="row">
                				<div class="col-2">
	                      			<label class="form-check-label" for="boardTypeCommentOk">댓글 사용 여부</label>
                    			</div>
                    			<div class="col-6 form-check form-switch">
                    				<input class="form-check-input" type="checkbox" name="boardTypeCommentOk" id="boardTypeCommentOk"
	                      			<c:if test="${vo.boardTypeCommentOk=='Y'}">
	                      				checked = "checked";
	                      			</c:if>>
                    			</div>
                			</div>
                			<div class="row">
	                			<div class="col-2">
	                      			<label class="form-check-label" for="boardTypeFileOk">첨부파일 사용 여부</label>
	                    		</div>
	                    		<div class="col-6 form-check form-switch">
	                    			<input class="form-check-input" type="checkbox" name="boardTypeFileOk" id="boardTypeFileOk"
	                      			<c:if test="${vo.boardTypeFileOk=='Y'}">
	                      				checked = "checked";
	                      			</c:if>>
	                    		</div>
                			</div>
                    		<div class="row">
                  				<div class="col-2">
                  					<label for="boardTypeFileNum" class="col-form-label">첨부 파일 개수</label>
                  				</div>
                  				<div class="col-6">
                    				<input type="text" class="form-control" name="boardTypeFileNum" id="boardTypeFileNum" value="${vo.boardTypeFileNum }">
                  				</div>
                			</div>
                    		<div class="row">
                    			<div class="col-2">
	                  				<label for="boardTypeFileSize" class="col-form-label">첨부 파일 사이즈</label>
                    			</div>
                  				<div class="col-6">
                    				<input type="text" class="form-control" id="boardTypeFileSize" name="boardTypeFileSize" value="${vo.boardTypeFileSize }">
                  				</div>
                			</div>
                			<div class="row">
	                			<div class="col-2">
	                      			<label class="form-check-label" for="boardTypeUse">게시판 활성화</label>
	                    		</div>
	                    		<div class="col-6 form-check form-switch">
	                    			<input class="form-check-input" type="checkbox" id="boardTypeUse" name="boardTypeUse"<c:if test="${vo.boardTypeUse=='Y'}">
	                      				checked = "checked";
	                      			</c:if>>
	                    		</div>
                			</div>
                			
							<button type="button" class="btn btn-secondary rounded-pill" id="cancelBt" data-bs-toggle="modal" data-bs-target="#confirm2">닫기</button>
							<button type="button" class="btn btn-primary rounded-pill" id="editBt" data-bs-toggle="modal" data-bs-target="#confirm1">수정하기</button>
							
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
					<h5 class="modal-title">게시판 수정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">변경사항을 저장하시겠습니까??</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button class="btn btn-primary" id="editBt2">저장하기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- EndModal -->
	<!-- Modal2 -->
	<div class="modal fade" id="confirm2" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">게시판 수정 중지</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">게시판 수정을 중단하시겠습니까? <br> 작성된 내용은 저장되지 않습니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button class="btn btn-primary" id="cancelBt2">중단하기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- EndModa2 -->
</main>
<!-- End #main -->
<%@ include file="../../form/adminBottom.jsp"%>

