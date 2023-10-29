<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../form/adminTop.jsp"%>
<style type="text/css">
	form>div{
		margin-top: 10px;
	}
	
	form>button{
		float: right;
	}
	
	#createBt{
		margin-right: 5px;
	}
	
</style>
<script type="text/javascript">
	$(function() {
		$('#boardTypeFileNum').val(0);
		$('#boardTypeFileNum').attr('readonly', true);
		$('#boardTypeFileSize').val(0);
		$('#boardTypeFileSize').attr('readonly', true);
		
		
		$('#cancelBt2').click(function() {
			location.href="<c:url value='/admin/board/boardTypeSetting'/>";
		});
		
		$('#createBt2').click(function() {
			$('form').submit();
		});
		
		
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
		
	});
</script>
<main id="main" class="main">

	<div class="pagetitle">
		<h1>게시판 생성</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">홈</li>
				<li class="breadcrumb-item">게시판 생성/관리</li>
				<li class="breadcrumb-item active">게시판 생성</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section">
		<div class="row">
			<div class="col-lg-6" style="width: 100%">

				<div class="card" id="pageDiv" >
					<div class="card-body">
 						<h5 class="card-title" style="font-weight: bold;">게시판 생성</h5>
 						<form id="frm" action="<c:url value='/admin/board/boardTypeCreate'/>" method="post">
 							<div class="row mb-3">
                  				<label for="boardTypeName" class="col-sm-2 col-form-label">게시판 이름</label>
                  				<div class="col-sm-10">
                    				<input type="text" class="form-control" name="boardTypeName" id="boardTypeName">
                  				</div>
                			</div>
                			<div class="form-check form-switch" id="boardTypeCommentOkDiv">
                      			<input class="form-check-input" type="checkbox" name="boardTypeCommentOk" id="boardTypeCommentOk">
                      			<label class="form-check-label" for="boardTypeCommentOk">댓글 사용 여부</label>
                    		</div>
                			<div class="form-check form-switch" id="boardTypeFileOkDiv">
                      			<input class="form-check-input" type="checkbox" name="boardTypeFileOk" id="boardTypeFileOk">
                      			<label class="form-check-label" for="boardTypeFileOk">첨부파일 사용 여부</label>
                    		</div>
                    		<div class="row mb-3">
                  				<label for="boardTypeFileNum" class="col-sm-2 col-form-label">첨부 파일 개수</label>
                  				<div class="col-sm-10">
                    				<input type="text" class="form-control" name="boardTypeFileNum" id="boardTypeFileNum">
                  				</div>
                			</div>
                    		<div class="row mb-3">
                  				<label for="boardTypeFileSize" class="col-sm-2 col-form-label">첨부 파일 사이즈</label>
                  				<div class="col-sm-10">
                    				<input type="text" class="form-control" id="boardTypeFileSize" name="boardTypeFileSize">
                  				</div>
                			</div>
                			<div class="form-check form-switch">
                      			<input class="form-check-input" type="checkbox" id="boardTypeUse" name="boardTypeUse">
                      			<label class="form-check-label" for="boardTypeUse">게시판 활성화</label>
                    		</div>
                			
							<button type="button" class="btn btn-secondary rounded-pill" id="cancelBt" data-bs-toggle="modal" data-bs-target="#confirm2">닫기</button>
							<button type="button" class="btn btn-primary rounded-pill" id="createBt" data-bs-toggle="modal" data-bs-target="#confirm1">생성하기</button>
							
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
					<h5 class="modal-title">게시판 생성</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">해당 내용으로 게시판을 생성하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button class="btn btn-primary" id="createBt2">생성하기</button>
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
					<h5 class="modal-title">게시판 생성 중지</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">게시판 생성을 중단하시겠습니까? <br> 작성된 내용은 저장되지 않습니다.</div>
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

