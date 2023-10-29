<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../form/adminTop.jsp"%>
<style type="text/css">
	
	
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
	
	.active{
		color: green;
		font-weight: bold;
	}
	
	.deActive{
		color: red;
		font-weight: bold;
	}
	
	p{
		width: 100%;
	}
	
	.tag{
	}
	
	.fr{
		text-align: right;
		width: 100px;
		float: left;
	}
	
	.back{
		text-align: left;
		ma
	}
	.back>span{
		margin: 10px 0 0 20px;
	}
	
	.fr, .back{
		margin-bottom: 5px;
	}
	
</style>
<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$('#okBt').hide();
		
		$('#listBt').click(function() {
			location.href = "<c:url value='/admin/space/spaceTypeList'/>";
		});
		
		$('#editBt').click(function() {
			location.href = "/spaceCollection/admin/space/spaceType/spaceTypeEdit?spaceTypeName="+$('#spaceTypeName').val();
		});
	});
</script>
<main id="main" class="main">

	<div class="pagetitle">
		<h1>공간 관리</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">홈</li>
				<li class="breadcrumb-item">공간 관리</li>
				<li class="breadcrumb-item">공간 타입 관리</li>
				<li class="breadcrumb-item active">공간 타입 상세보기</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section">
		<div class="row">
			<div class="col-lg-6" style="width: 100%">

				<div class="card" id="pageDiv" >
					<div class="card-body">
 						<h5 class="card-title" style="font-weight: bold;">공간 타입 상세보기</h5>
							<div class="row-sm">
							<div>
								<div class="col fr">
									<span class="tag">카테고리명 :</span>
								</div>
								<div class="col back">
									<span>${map.CATEGORY_NAME }</span>
								</div>
							</div>
							<div>
								<div class="col fr">
									<span class="tag">공간 번호 :</span>
								</div>
								<div class="col back">
									<span>${map.SPACE_TYPE_NO }</span>
								</div>
							</div>
							<div>
								<div class="col fr">
									<span class="tag">공간 타입명 :</span>
								</div>
								<div class="col back">
									<span>${map.SPACE_TYPE_NAME }</span>
									<input type="hidden" name="spaceTypeName" id="spaceTypeName" value="${map.SPACE_TYPE_NAME }">
								</div>
							</div>
							<div>
								<div class="col fr">
									<span class="tag">사용여부 :</span>
								</div>
								<div class="col back">
									<c:if test="${map.SPACE_TYPE_DEL_FLAG != 'Y'}">
										<span class="active">활성화</span>
									</c:if>
									<c:if test="${map.SPACE_TYPE_DEL_FLAG == 'Y'}">
										<span class="deActive">비활성화</span>
									</c:if>
								</div>
							</div>
							<hr>
								<div class="row-sm-3">
									<h5 class="card-title">공간 설명</h5>
									<p>
										${map.EXPLANATION }
									</p>
								</div>
							</div>
							<hr>
						<div class="col-auto" id="btDiv">
							<button type="button" class="btn btn-primary" id="editBt">수정</button>
							<button type="button" class="btn btn-secondary" id="listBt">목록</button>
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
