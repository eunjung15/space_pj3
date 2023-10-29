<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/hostTop.jsp"%>

<style type="text/css">
	.divMain {
		display: flex;
		justify-content: center;
	}

	.contents {
		margin: 140px 0 150px 0; 
		width: 1000px;
	}
	
	.guide {
		color: #656565;
	}
	
	.noti {
		text-align: -webkit-center;
		width: 1000px;
		background: #80808014;
		display: inline-block;
		padding: 17px 5px 15px 0;
		font-size: 16px;
	}
	
	.notiBox {
		text-align: center;
		display: inline-block;
	}
	
	ul {
		text-align: left;
	}

	.icon {
		width: 90px;
		height: 90px;
	}
	
	.main {
		width: 1000px;
		margin-top: 50px;
	}
	
	.accordion-header span {
		padding: 15px 0 0 20px;
		font-weight: bold;
		font-size: 20px;
	}
	
	.accordion-body span {
		padding-top: 20px;
		color: #333;
		font-stretch: normal;
    	font-style: normal;
    	font-size: 13px;
	}

	.accordion {
		margin-bottom: 60px;
	}
	
	.collap {
		float: left;
		margin-top: 
	}
	
	.dropdown .btn {
		background: white;
		border: 1px solid #704de4 !important;
		color: #704de4;
		margin: 10px 0 5px 10px;
	}
	
	.dropdown-menu {
		background: white;
		border: 1px solid #704de4 !important;
		color: #704de4;
	}
	
	.btBar {
		display: flex;
		justify-content: center;
	}
	
	.btBar button {
		border-radius: 0.5rem;
		width: 100%;
		height: 80px;
		margin: 0 10px 60px 10px;
		color: white;
		font-size: 20px;
		font-weight: bold;
	}
	
	
	
</style>

<script type="text/javascript">
	$(function() {
		$('#back').click(function() {
			history.back();
		});
		
		$('#next').click(function() {
			var count = $('input[type=checkbox]:checked').length;
			if (count > 0) {
				
			} else {
				alert('공간 유형을 선택하세요.');
				
				return false;
			}
			
		});
		
		$('.accordion-button').click(function() {
			// 클릭한 아코디언 내부의 체크박스들
		    var checkboxes = $(this).closest('.accordion-item').find('.form-check-input');
		        
		    // 다른 아코디언 내부의 체크박스들
		    var otherCheckboxes = $('.accordion-item .form-check-input').not(checkboxes);
		        
		    // 다른 아코디언의 체크박스들을 해제
		    otherCheckboxes.prop('checked', false);
		});
		
	});
</script>

<div class="divMain">
<section class="contents">
	<article class="noti">
		<div class="notiBox">
			<ul class="guide">
				<li>6개의 공간 용도(모임, 연습, 촬영, 행사, 캠핑, 오피스) 중 1개의 용도 안에서만 유형을 선택할 수
					있습니다.</li>
				<li>선택한 공간 용도 안에서, 등록한 공간에 적합한 유형은 모두 선택이 가능합니다.</li>
				<li>검수 단계에서 검수 기준에 적합하지 않은 유형은 제외될 수 있습니다.</li>
				<li>검수 신청 후, 공간 유형 변경은 고객센터를 통해서만 가능하오니, 신중히 선택해주세요!</li>
			</ul>
		</div>
	</article>

	<article class="main">
		<form name="frmRegi1" method="get" action="<c:url value='/host/registration/registration2' />" >
		
			<div class="accordion accordion-flush" id="accordionFlushExample">
				<c:forEach var="AllVo" items="${type }" varStatus="loopStatus">
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button collapsed btacco" type="button"
								data-bs-toggle="collapse" data-bs-target="#flush-collapseOne${loopStatus.index}"
								aria-expanded="false" aria-controls="flush-collapseOne">
								<span>${AllVo.spaceCategoryVo.categoryName }</span>
							</button>
						</h2>
						<c:forEach var="list" items="${AllVo.spaceTypeList}" >
							<div class="collap">
								<div id="flush-collapseOne${loopStatus.index}" class="accordion-collapse collapse"
									data-bs-parent="#accordionFlushExample">
									<div class="accordion-body">
											<div class="form-check">
											  	<input class="form-check-input" type="checkbox" value="${list.spaceTypeName }" 
											  		id="flexCheckDefault" name="spaceTypeName" >
											  	<label class="form-check-label" for="flexCheckDefault">
											  		<div class="dropdown">
													  	<button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" 
													  		aria-expanded="false">
													    	${list.spaceTypeName }
													  	</button>
													  	<ul class="dropdown-menu">
													    	<li><a class="dropdown-item" href="#">${list.explanation }</a></li>
													  	</ul>
													</div>
											  	</label>
											</div>
											
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:forEach>
			</div>	<!-- 아코디언 -->
			
			<div class="btBar">
				<button type="button" class="btn btn-secondary" id="back" >이전</button>
				<button type="submit" class="btn btn-warning" id="next" >다음</button>
			</div>
		
		</form>
	</article>

</section>
</div>

</body>
</html>