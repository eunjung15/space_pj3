<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../form/adminTop.jsp"%>
<style type="text/css">
	
	#spaceTypeCategoryDelBt, #spaceTypeCategoryActiveBt{
		float: right;
		margin-top: 16px;
		margin-right: 5px;
		margin-bottom: 20px;
	}	

	h5{
		float: left;
	}
	
	th{
		text-align: center;
	}
	
	td{
		text-align: center;
	}
	
	#searchDiv>div {
    	float: right;
	}
	
	i.bi.bi-exclamation-circle {
 		color: #ffd600;
   		font-size: 40px;
   		display: block;
   		margin-block: -13px;
	}
	
	.marginTop{
		margin-top: 5px;
	}
	
	.marginTop>div{
		text-align: left;
	}
	
	.maginbottom{
		margin-bottom: 10px;
	}
	
	.active{
		color: green;
	}
	
	.deActive{
		color: red;
	}
	
	#categoryPlusBt{
		margin-bottom: 10px; 
	}
	
	#categoryPlusDiv{
		width: 100%;
		text-align: center;
		vertical-align: middle;
	}
	
	#categoryPlusDiv>input{
		width: 500px;
		margin: auto;
    	float: left;
    	margin-right: 5px;
	}
	
	#categoryPlusDiv>label{
		float: left;
		margin-right: 5px;
	}
	
	#categoryPlusDiv>button{
		float: left;
		margin-right: 5px;
	}
	
	form[name=spaceTypeCategoryFrm]{
		margin: auto;
	}
	
</style>
<script type="text/javascript">
	$(function() {
		$('tbody tr').hover(function() {
			$(this).find('td').css("background-color", "#d1cece");
		}, function() {
			$(this).find('td').css("background-color", "white");
		});
		
		$('#okBt').hide();
		
						
		$('input[name=chkAll]').click(function() {
			var checkState = $(this).is(':checked')
			$('td>input[type=checkbox]').prop('checked', checkState);
		});
		
		$('#spaceTypeCategoryActiveBt').click(function() {
			if($('td>input[type=checkbox]:checked').length<1){
				$('#confirm1 .modal-body').html("최소 하나 이상의 카테고리를 선택하세요.");
				$('#cancelBt').html("확인");
				$('#confirm1').modal("show");
			}else{
				$('#confirm1 .modal-body').html("선택된 카테고리를 활성화 시키겠습니까?");
				$('#okBt').show();
				$('#okBt').addClass("btn-success");
				$('#cancelBt').html("취소");
				$('#okBt').html("활성화");
				$('#confirm1').modal("show");
				$('#okBt').click(function() {
					$(this).removeClass("btn-success");
					$('form[name=trFrm]').attr("action", "/spaceCollection/admin/space/spaceTypeCategoryActive");
					$('form[name=trFrm]').submit();
				});
			}
		});
		
		$('#spaceTypeCategoryDelBt').click(function() {
			if($('td>input[type=checkbox]:checked').length<1){
				$('#confirm1 .modal-body').html("최소 하나 이상의 카테고리를 선택하세요.");
				$('#cancelBt').html("확인");
				$('#confirm1').modal("show");
			}else{
				$('#confirm1 .modal-body').html("선택된 카테고리를 비활성화 시키겠습니까? 비활성 시 해당 카테고리를 선택할 수 없습니다.");
				$('#okBt').show();
				$('#okBt').addClass("btn-danger");
				$('#cancelBt').html("취소");
				$('#okBt').html("비활성화");
				$('#confirm1').modal("show");
				$('#okBt').click(function() {
					$(this).removeClass("btn-danger");
					$('form[name=trFrm]').attr("action", "/spaceCollection/admin/space/spaceTypeCategoryDeActive");
					$('form[name=trFrm]').submit();
				});
			}	
		});
		
		
		$('#categoryPlusBt').click(function() {
			var str = "";
			str += "<form name='spaceTypeCategoryFrm' method='post' action='<c:url value='/admin/space/spaceTypeCategoryWrite'/>'>"
				+ "<div class='col-sm-3' id='categoryPlusDiv'>"
				+ "<label for='categoryName'>카테고리명</label>"
				+ "<input type='text' class='form-control' id='categoryName' name='categoryName'>"
				+ "<button type='button' class='btn btn-primary' onClick='lenghthCheck(this)'>등록</button>"
				+ "<button type='button' class='btn btn-secondary' onClick='changeDiv()'>취소</button>"
				+ "</div>"
				+ "<br>"
				+ "<br>"
				+ "</form>";
			
			
			$(this).replaceWith(str);
		});
			
	});
	
	function lenghthCheck(evt) {
		if($(evt).parent().find('input').val().trim().length<1){
			$('.modal-body').html("카테고리 이름을 입력하세요.");
			$('#cancelBt').html("확인")
			$('#confirm1').modal('show');
		}else{
			$('form[name=spaceTypeCategoryFrm]').submit();
		}
	}
	
	function changeDiv() {
		var str = "";
		str += "<button class='btn btn-outline-secondary' type='button' id='categoryPlusBt' onClick='changeDiv2()'>"
			+ "<i class='bi bi-plus-square-dotted'></i> 카테고리 추가"
			+ "</button>";
			
		$('form[name=spaceTypeCategoryFrm]').replaceWith(str);
	}
	
	function changeDiv2() {
		var str = "";
		str += "<form name='spaceTypeCategoryFrm' method='post' action='<c:url value='/admin/space/spaceTypeCategoryWrite'/>'>"
			+ "<div class='col-sm-3' id='categoryPlusDiv'>"
			+ "<label for='categoryName'>카테고리명</label>"
			+ "<input type='text' class='form-control' id='categoryName' name='categoryName'>"
			+ "<button type='submit' class='btn btn-primary' onClick='lenghthCheck(this)'>등록</button>"
			+ "<button type='button' class='btn btn-secondary' onClick='changeDiv()'>취소</button>"
			+ "</div>"
			+ "<br>"
			+ "<br>"
			+ "</form>"
			
		
		$('#categoryPlusBt').replaceWith(str);
	}
	
	function pageFunc(curPage){
		$('input[name="currentPage"]').val(curPage);
		$('form[name="frmPage"]').submit();
	}
</script>
<main id="main" class="main">

	<div class="pagetitle">
		<h1>공간 관리</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">홈</li>
				<li class="breadcrumb-item">공간 관리</li>
				<li class="breadcrumb-item active">공간 카테고리 관리</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section">
		<div class="row">
			<div class="col-lg-6" style="width: 100%">
				<div class="card" id="pageDiv" >
					<div class="card-body">
 						<h5 class="card-title" style="font-weight: bold;"><a>공간 카테고리 관리</a></h5>
 						<form name="frmPage" method="post" action="<c:url value='/admin/space/spaceTypeCategoryList'/>">
 							<input type="hidden" name="currentPage">
 						</form>
						<table class="table">
							<colgroup>
								<col style="width:15%;"  />
								<col style="width:15%;"  />
								<col style="width:55%;" />
								<col style="width:15%;" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col"><input type="checkbox" name="chkAll"></th>
									<th scope="col">카테고리 번호</th>
									<th scope="col">카테고리 이름</th>
									<th scope="col">사용 여부</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty list }">
									<tr>
										<td colspan="4" style="text-align: center;">동록된 카테고리가 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${!empty list }">
									<form name="trFrm" method="post">
										<button type="button" class="btn btn-outline-success subBt" id="spaceTypeCategoryActiveBt">활성화</button>
										<button type="button" class="btn btn-outline-danger subBt" id="spaceTypeCategoryDelBt">비활성화</button>
										<c:set var="i" value="0"/>
										<c:forEach var="spaceTypeCategoryVo" items="${list }">
											<tr>
												<td>
													<input type="checkbox" name="spaceTypeCategoryItemList[${i }].categoryNo" value="${spaceTypeCategoryVo.categoryNo }">
												</td>
												<td style="cursor:pointer;">
													${spaceTypeCategoryVo.categoryNo }
												</td>
												<td style="cursor:pointer;">
													${spaceTypeCategoryVo.categoryName }
												</td>
												<td style="cursor:pointer;">
													<c:if test="${spaceTypeCategoryVo.categoryDelFlag == 'Y' }">
														<span class="deActive">비활성화</span>
													</c:if>
													<c:if test="${spaceTypeCategoryVo.categoryDelFlag != 'Y' }">
														<span class="active">활성화</span>
													</c:if>
												</td>
											</tr>
											<c:set var="i" value="${i+1 }"/>
										</c:forEach>
									</form>
								</c:if>
							</tbody>
						</table>
						<div class="d-grid gap-2 margin-bottom" >
							<button class="btn btn-outline-secondary" type="button" id="categoryPlusBt">
								<i class="bi bi-plus-square-dotted"></i> 카테고리 추가
							</button>
						</div>
						<div class="divPage">
						
							<nav aria-label="...">
								<ul class="pagination justify-content-center">
									<c:if test="${pagingInfo.firstPage>1 }">
										<li class="page-item <c:if test='${pagingInfo.firstPage <=1 }'>disabled</c:if>">
											<a class="page-link" href="#" aria-label="Previous" onclick="pageFunc(${pagingInfo.firstPage-1})">이전</a>
							    		</li>
									</c:if>	
							    	<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">		
										<c:if test="${i == pagingInfo.currentPage }">
											<li class="page-item active" aria-current="page">
									      		<a class="page-link" href="#">${i}</a>
									    	</li>		
								        </c:if>
										<c:if test="${i != pagingInfo.currentPage }">		
									         <li class="page-item">
									         	<a class="page-link" aria-label="Previous" href="#" onclick="pageFunc(${i})">${i }</a>
									         </li>
									    </c:if>   		
									</c:forEach>
							      	<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
							      		<li class="page-item <c:if test='${pagingInfo.lastPage >= pagingInfo.totalPage }'>disabled</c:if>">
								      		<a class="page-link" href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">다음</a>
								    	</li>
									</c:if>
							  	</ul>
							</nav>
						
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
<!-- End #main -->
<%@ include file="../../form/adminBottom.jsp"%>
