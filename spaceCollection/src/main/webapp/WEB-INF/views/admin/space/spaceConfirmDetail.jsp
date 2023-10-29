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
	
	
	.fr{
		text-align: right;
		width: 160px;
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
	
	#carouselExampleIndicators {
		width: 900px;
		height: 550px;
		display: block;
		margin-left: auto;
		margin-right: auto;
		margin-bottom: 20px;
		background-color: rgb(215, 215, 215);
		padding: 10px;
	}

.carousel-inner {
	width: 900px;
	height: 550px;
	margin: auto;
} 

#carouselExampleIndicators img {
	display: block;
	margin: auto;
	object-fit: contain;
	max-width: 70%;
	max-height: 500px;
}
	
	.confirm{
		color: rgb(13,110,253);
		font-weight: bold;
	}
	.denine{
		color: red;
		font-weight: bold;
	}
	.request{
		color: rgb(255,214,1);
		font-weight: bold;
	}
	
	td, th{
		text-align: center;
		width: 100px;
	}
	
	div>select{
		margin-top: 10px;
	}
	
</style>
<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$('#okBt').hide();
		
		$('#listBt').click(function() {
			location.href = "<c:url value='/admin/space/spaceConfirmList'/>";
		});
		
		$('#confirmBt').click(function() {
			$('#confirm1').modal("show");
			$('#confirmOkBt').click(function() {
				$('#confirm1').modal("hide");
				$('form[name=confirmFrm]').attr('action', '/spaceCollection/admin/space/spaceConfirmList/confirmOne');
				$('form').submit();
			});
		});
		
		
		
		$('#denineBt').click(function() {
			$('#confirm2').modal("show");
			$('#denineOkBt').click(function() {
				$('#confirm2').modal("hide");
				$('form[name=confirmFrm]').attr('action', '/spaceCollection/admin/space/spaceConfirmList/denineOne');
				$('form').submit();
			});
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
				<li class="breadcrumb-item">공간 승인 관리</li>
				<li class="breadcrumb-item active">공간 승인 상세보기</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section">
		<div class="row">
			<div class="col-lg-6" style="width: 100%">

				<div class="card" id="pageDiv">
					<div class="card-body">
						<input type="hidden" name="spaceNum" value="${map.SPACE_NUM }">
						<input type="hidden" name="userEmail" value="${map.USER_EMAIL }">
						<h5 class="card-title" style="font-weight: bold;">공간 승인 상세보기</h5>
						<div class="row-sm-3">
							<h5 class="card-title">신청자 정보</h5>
							<div class="row">
								<div class="col-3 fr">
									<span class="tag">이름 :</span>
								</div>
								<div class="col-9 back">
									<span>${map.USER_NAME }</span>
								</div>
							</div>
							<div class="row">
								<div class="col-3 fr">
									<span class="tag">아이디 :</span>
								</div>
								<div class="col-9 back">
									<span>${map.USER_ID }</span>
								</div>
							</div>
							<div class="row">
								<div class="col-3 fr">
									<span class="tag">이메일 :</span>
								</div>
								<div class="col-9 back">
									<span>${map.USER_EMAIL }</span>
								</div>
							</div>
							<div class="row">
								<div class="col-3 fr">
									<span class="tag">연락처 :</span>
								</div>
								<div class="col-9 back">
									<span>${map.USER_HP }</span>
								</div>
							</div>
						</div>
						<hr>
						<div class="row-sm-3">
							<h5 class="card-title">공간 정보</h5>

							<div class="row">
								<div class="col-3 fr">
									<span class="tag">카테고리 :</span>
								</div>
								<div class="col-9 back">
									<span>${map.CATEGORY_NAME }</span>
								</div>
							</div>

							<div class="row">
								<div class="col-3 fr">
									<span class="tag">공간 타입명 :</span>
								</div>
								<div class="col-9 back">
									<span>${map.SPACE_TYPE_NAME }</span>
								</div>
							</div>
							<div class="row">
								<div class="col-3 fr">
									<span class="tag">공간 번호 :</span>
								</div>
								<div class="col-9 back">
									<span>${map.SPACE_NUM }</span>
								</div>
							</div>
							<div class="row">
								<div class="col-3 fr">
									<span class="tag">공간명 :</span>
								</div>
								<div class="col-9 back">
									<span>${map.SPACE_NAME }</span>
								</div>
							</div>
							<div class="row">
								<div class="col-3 fr">
									<span class="tag">공간 주소 :</span>
								</div>
								<div class="col-9 back">
									<span>${map.SPACE_ADDRESS }</span>
								</div>
							</div>
							
							<div class="row">
								<div class="col-3 fr">
									<span class="tag">연락처 :</span>
								</div>
								<div class="col-9 back">
									<span>${map.SPACE_PHONE_NUM }</span>
								</div>
							</div>
							<div class="row">
								<div class="col-3 fr">
									<span class="tag">사업자 번호 :</span>
								</div>
								<div class="col-9 back">
									<span>${map.SPACE_BUSINESS_NUM }</span>
								</div>
							</div>
							<div class="row">
								<div class="col-3 fr">
									<span class="tag">사업자 등록증 파일 :</span>
								</div>
								<div class="col-9 back">
									<span><a href="<c:url value='/admin/space/download?spaceNum=${spaceFileVo.imgForeignKey }&fileName=${spaceFileVo.imgTempName }'/>">
										${str }									
									</a></span>
								</div>
							</div>
							<div class="row">
								<div class="col-3 fr">
									<span class="tag">승인 요청일 :</span>
								</div>
								<div class="col-9 back">
									<span>${map.SPACE_REQUEST_DATE }</span>
								</div>
							</div>
							<div class="row">
								<div class="col-3 fr">
									<span class="tag">결정일 :</span>
								</div>
								<div class="col-9 back">
									<span>${map.SPACE_REG_DATE }</span>
								</div>
							</div>
							<div class="row">
								<div class="col-3 fr">
									<span class="tag">상태 :</span>
								</div>
								<div class="col-9 back">
									<c:if test="${map.SPACE_REQUEST_STATUS=='승인' }">
										<span class="confirm">${map.SPACE_REQUEST_STATUS }</span>
									</c:if>
									<c:if test="${map.SPACE_REQUEST_STATUS=='거절' }">
										<span class="denine">${map.SPACE_REQUEST_STATUS }</span>
									</c:if>
									<c:if test="${map.SPACE_REQUEST_STATUS=='요청중' }">
										<span class="request">${map.SPACE_REQUEST_STATUS }</span>
									</c:if>
								</div>
							</div>
						</div>
						<br>
						<hr>
						<div class="row-sm-3">
							<h5 class="card-title">공간 설명</h5>
							<div class="row">
								<div class="col-3 fr">
									<span class="tag">공간 태그 :</span>
								</div>
								<div class="col-9 back">
									<p>${map.SPACE_TAG }</p>
								</div>
							</div>
							<div class="row">
								<div class="col-3 fr">
									<span class="tag">인트로 :</span>
								</div>
								<div class="col-9 back">
									<p>${map.SPACE_INTRO }</p>
								</div>
							</div>
							<div class="row">
								<div class="col-3 fr">
									<span class="tag">설명 :</span>
								</div>
								<div class="col-9 back">
									<p>${map.SPACE_INFO }</p>
								</div>
							</div>
							<div class="row">
								<div class="col-3 fr">
									<span class="tag">주의사항 :</span>
								</div>
								<div class="col-9 back">
									<p>${map.SPACE_WARN }</p>
								</div>
							</div>
						</div>

						<hr>
						<div class="row-sm-3">
							<h5 class="card-title">공간 이미지</h5>
							<div id="carouselExampleIndicators" class="carousel slide">
								<div class="carousel-indicators">
									<c:set var="i" value="0"/>
									<c:forEach var="imgName" items="${imgList }">
										<button type="button"
											data-bs-target="#carouselExampleIndicators"
											<c:if test="${i==0 }">
											data-bs-slide-to="${i }" 
											class="active" aria-current="true" aria-label="Slide ${i+1 }"
											</c:if>
											<c:if test="${i>0 }">
											data-bs-slide-to="${i }" 
											aria-label="Slide ${i }"
											</c:if>
											aria-label="Slide ${i+1 }"></button>
											<c:set var="i" value="${i+1 }"/>
									</c:forEach>
								</div>
								<div class="carousel-inner">
									<c:set var="i" value="0"/>
									<c:forEach var="imgName" items="${imgList }">
										<c:if test="${i==0 }">
											<div class="carousel-item active">
										</c:if>
										<c:if test="${i>0 }">
											<div class="carousel-item">
										</c:if>
											<img src="<c:url value='/space_images/${imgName }'/>"
												class="d-block w-100">
										</div>
										<c:set var="i" value="${i+1 }"/>
									</c:forEach>
								</div>
								<button class="carousel-control-prev" type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
							</div>
						</div>
						<hr>
						<div class="row-sm-3">
							<h5 class="card-title">환불 정보</h5>
							<table class="table">
								<thead class="table-light">
									<tr>
										<th scope="col">7일 전</th>
										<th scope="col">6일 전</th>
										<th scope="col">5일 전</th>
										<th scope="col">4일 전</th>
										<th scope="col">3일 전</th>
										<th scope="col">2일 전</th>
										<th scope="col">1일 전</th>
										<th scope="col">당일</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${map.REFUND_7_DAY }</td>
										<td>${map.REFUND_6_DAY }</td>
										<td>${map.REFUND_5_DAY }</td>
										<td>${map.REFUND_4_DAY }</td>
										<td>${map.REFUND_3_DAY }</td>
										<td>${map.REFUND_2_DAY }</td>
										<td>${map.REFUND_1_DAY }</td>
										<td>${map.REFUND_DAY }</td>
									</tr>
								</tbody>
							</table>
						</div>
						<hr>
						<div class="col-auto" id="btDiv">
							<c:if test="${map.SPACE_REQUEST_STATUS == '요청중' }">
								<button type="button" class="btn btn-outline-danger"
									id="denineBt">거절</button>
								<button type="button" class="btn btn-outline-primary"
									id="confirmBt">승인</button>
							</c:if>
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
				<div class="modal-body">
					해당 공간을 승인하시겠습니까?
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" id="cancelBt"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="confirmOkBt">승인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- EndModal1 -->
	<!-- Moda1 -->
	<div class="modal fade" id="confirm2" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title"><i class="bi bi-exclamation-circle"></i></h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					거절 사유를 선택하세요.
					<form method="post" name="confirmFrm">
						<input type="hidden" name="spaceNum" value="${map.SPACE_NUM }">
						<input type="hidden" name="userEmail" value="${map.USER_EMAIL }">
						<input type="hidden" name="spaceTypeName" value="${map.SPACE_TYPE_NAME }">
						<input type="hidden" name="spaceName" value="${map.SPACE_NAME }">
						<input type="hidden" name="spaceRequestDate" value="${map.SPACE_REQUEST_DATE }">
						<input type="hidden" name="spaceRequestStatus" value="${map.SPACE_REQUEST_STATUS }">
						<div class="d-flex justify-content-center">
							<select class="form-select d-flex justify-content-center" name="reason"  style="width: 300px">
								<option value="정보누락">정보누락</option>
								<option value="허위정보 기재">허위정보 기재</option>
								<option value="공간 부적합">공간 부적합</option>
								<option value="기타 부적합 사유">기타 부적합 사유</option>
							</select>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" id="cancelBt"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-danger" id="denineOkBt">거절</button>
				</div>
			</div>
		</div>
	</div>
	<!-- EndModal1 -->

</main>

<%@ include file="../../form/adminBottom.jsp"%>    
