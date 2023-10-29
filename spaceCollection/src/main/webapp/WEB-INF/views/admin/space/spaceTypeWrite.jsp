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
	
	
	i.bi.bi-exclamation-circle {
 		color: #ffd600;
   		font-size: 40px;
   		display: block;
   		margin-block: -13px;
	}
	
	.m-left{
		margin-left: 12px;
	}
	
	#btDiv{
		margin-top: 10px;
		float: right;
	}
	
	#btDiv>button{
		width: 100px;
	}
	
	
	p{
		text-align: left;
		float: right;
		color: gray;
		font-size: 15px;
		width: 29%;
	}
	
</style>
<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$('#okBt').hide();
		
		$('#strCount1').html('&nbsp;&nbsp('+0);
		$('#strCount2').html('&nbsp;&nbsp('+0);
		
		countStr();
		
		$('#submit').click(function() {
			$('form[name=spaceTypeFrm]').attr("action", "<c:url value='/admin/space/spaceType/spaceTypeWrite'/>");
			$('form[name=spaceTypeFrm]').submit();
		});
		
		$('#edit').click(function() {
			$('form[name=spaceTypeFrm]').attr("action", "<c:url value='/admin/space/spaceType/spaceTypeEdit'/>");
			$('form[name=spaceTypeFrm]').submit();
		});
		
		$('#cancel').click(function() {
			$('#okBt').addClass('historyback btn-primary');
			$('.modal-body').html("작성을 취소하시겠습니까? 작성된 내용은 저장되지 않습니다.");
			$('#okBt').html("확인");
			$('#cancelBt').html("취소");
			$('#okBt').show();
			$('#confirm1').modal('show');

			$('.historyback').click(function() {
				$(this).removeClass('historyback btn-primary');
				location.href = "<c:url value='/admin/space/spaceTypeList'/>";
				
			});
			
			
		});
		
		
		$('form').submit(function() {
			if($('#spaceTypeName').val().trim().length<1){
				$('#okBt').hide();
				$('#cancelBt').addClass('titleFocus btn-primary');
				$('#cancelBt').html('확인');
				$('.modal-body').html("제목을 입력하세요.");
		        $('#confirm1').modal('show');

		        $('.titleFocus').click(function() {
					$('#spaceTypeName').val('');
					$('#spaceTypeName').focus();
					$(this).removeClass('titleFocus');
				}); 
				
				return false;
			}
			
			if($('#explanation').val().trim().length<1){
				$('#okBt').hide();
				$('#cancelBt').html("확인");
				$('#cancelBt').addClass('contentFocus');
				$('.modal-body').html("게시물 내용을 입력하세요.");
		        $('#confirm1').modal('show');
		        
				$('.contentFocus').click(function() {
					$('#explanation').focus();
					$(this).removeClass('contentFocus');
				}); 
				
				return false;
			}
			
			
		});
		
			
		$('#spaceTypeName').keyup(function (e) {
			let titleStr = $(this).val();
		    
		    // 글자수 세기
		    if (titleStr.length == 0 || titleStr == '') {
		    	$('#strCount1').html('&nbsp;&nbsp('+0);
		    } else {
		    	$('#strCount1').html('&nbsp;&nbsp(' + titleStr.length);
		    }
		    
		    // 글자수 제한
		    if (titleStr.length > 15) {
		        $(this).val($(this).val().substring(0, 15));
		        $('.modal-body').html("타입명은 15자를 초과할 수 없습니다.");
		        $('#cancelBt').html("확인");
		        $('#confirm1').modal('show');
				$('#confirm1').on('hidden.bs.modal', function (e) {
					$('#spaceTypeName').focus();
				});
		    };
		});
		    	
		$('#explanation').keyup(function (e) {
			let titleStr = $(this).val();
		    
		    // 글자수 세기
		    if (titleStr.length == 0 || titleStr == '') {
		    	$('#strCount2').html('&nbsp;&nbsp('+0);
		    } else {
		    	$('#strCount2').html('&nbsp;&nbsp(' + titleStr.length);
		    }
		    
		    // 글자수 제한
		    if (titleStr.length > 100) {
		        $(this).val($(this).val().substring(0, 100));
		        $('.modal-body').html("설명은 100자를 초과할 수 없습니다.");
		        $('#cancelBt').html("확인");
		        $('#confirm1').modal('show');
				$('#confirm1').on('hidden.bs.modal', function (e) {
					$('#explanation').focus();
				});
		    };
		});	
		
		$('input[type=submit]').click(function() {
			$('#spaceTypeFrm').submit();
		});
	});
		    	
	function countStr() {
		var titleCnt = $('input[name=spaceTypeName]').val();
		var contentCnt = $('textarea[name=explanation]').val();
		
		
		$('#strCount1').html('&nbsp;&nbsp(' + titleCnt.length);
		$('#strCount2').html('&nbsp;&nbsp(' + contentCnt.length);
	}
</script>
<main id="main" class="main">

	<div class="pagetitle">
		<h1>공간 관리</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">홈</li>
				<li class="breadcrumb-item">공간 관리</li>
				<li class="breadcrumb-item">공간 타입 관리</li>
				<c:if test="${map.CATEGORY_NO == null }">
					<li class="breadcrumb-item active">공간 타입 등록</li>
				</c:if>
				<c:if test="${map.CATEGORY_NO != null }">
					<li class="breadcrumb-item active">공간 타입 수정</li>
				</c:if>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section">
		<div class="row">
			<div class="col-lg-6" style="width: 100%">

				<div class="card" id="pageDiv" >
					<div class="card-body">
						<c:if test="${map.CATEGORY_NO == null }">
	 						<h5 class="card-title" style="font-weight: bold;">공간 타입 등록</h5>
						</c:if>
						<c:if test="${map.CATEGORY_NO != null }">
	 						<h5 class="card-title" style="font-weight: bold;">공간 타입 수정</h5>
						</c:if>
 						<form class="row gx-3 gy-2 align-items-center" name="spaceTypeFrm" id="spaceTypeFrm" method="post" 
 						onkeydown="return event.key != 'Enter';">
 							<input type="hidden" name="spaceTypeNo" value="${map.SPACE_TYPE_NO }">
							<div id="searchDiv">
								<div class="col-sm-3" id="select">
									<label class="col-sm-2 col-form-label" for="categoryNo">카테고리명</label>
									<select class="form-select labelNext " name="categoryNo" id="categoryNo">
										<c:forEach var="spaceTypeCategoryVo" items="${list }">
											<option value="${spaceTypeCategoryVo.categoryNo }" 
												<c:if test="${map.CATEGORY_NAME == spaceTypeCategoryVo.categoryName }">
													selected = 'selected'
												</c:if> >
												${spaceTypeCategoryVo.categoryName }
											</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-sm-3" id="keyword">
									<label class="col-sm-2 col-form-label" for="spaceTypeName">공간 타입명</label>
									<input type="text" class="form-control labelNext" id="spaceTypeName" name="spaceTypeName" value="${map.SPACE_TYPE_NAME }">
								</div>
								<div class="col-sm-3">
									<p>
										<span id="strCount1"></span>&nbsp;/15자 이내)
									</p>
								</div>
								<div class="row sm-3">
									<label for="explanation" class="col-sm-2 col-form-label m-left">설명</label>
									<textarea class="form-control labelNext" name="explanation" style="height: 100px" id="explanation">${map.EXPLANATION }</textarea>
								</div>
								<div class="col-sm-3">
									<p>
										<span id="strCount2"></span>&nbsp;/100자 이내)
									</p>
								</div>
							</div>
						</form>
						
						<div class="col-auto" id="btDiv">
							<c:if test="${param.spaceTypeName == null }">
								<button type="button" class="btn btn-primary" id="submit">등록</button>
							</c:if>
							<c:if test="${param.spaceTypeName != null }">
								<button type="button" class="btn btn-primary" id="edit">수정</button>
							</c:if>
							<button type="button" class="btn btn-secondary" id="cancel">취소</button>
						</div>
				 	</div>
				</div>

			</div> 
		</div>
	</section>
	<!-- Moda1 -->
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
					<button type="button" class="btn btn-secondary" id="cancelBt"
						data-bs-dismiss="modal"></button>
					<button type="button" class="btn" id="okBt"></button>
				</div>
			</div>
		</div>
	</div>
	<!-- EndModal1 -->

</main>

<%@ include file="../../form/adminBottom.jsp"%>    
