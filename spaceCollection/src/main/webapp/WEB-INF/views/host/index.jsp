<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/hostTop.jsp" %>

<style type="text/css">
	.start {
		margin: 0 auto;
		padding: 200px 0 130px;
		background-image: url('https://partner.spacecloud.kr/static/media/icons_pc.d588971f.png');
		background-size: 400px;
		background-repeat: no-repeat;
		background-position-x: 94%;
    	background-position-y: 65%;
		max-width: 1200px;
	}
	
	.startMain {
		margin-bottom: 20px;
		letter-spacing: -2px;
	}
	
	.mainItem1 {
		font-size: 40px;
		font-weight: bold;
		line-height: 35px;
		margin-bottom: 70px;
		color: #333;
		letter-spacing: -2.5px;
	}
	

	.mainItem2 {font-size: 18px; margin-bottom: 50px;}
	

	.proposal {
		width: 200px;
		height: 65px;
		text-decoration: none;
		background: #ffd014;
		color: white;
		border: 0;
		border-radius: 5px;
		font-weight: bold;
	}
	
	.registration {
		width: 200px;
		height: 65px;
		text-decoration: none;
		background: #704de4;
		color: white;
		border: 0;
		border-radius: 5px;
		font-weight: bold;
	}
	
	.mainItem3 {
		font-size: 21px;
		margin-bottom: 60px;
		font-weight: bold;
	}
	
	.mainImg {
		width: 400px;
		height: 400px;
	}
	
	.descriptionCard {
		padding: 40px 50px 0 40px;
	}
	
	.mainTitle {
		background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOQAAAAkCAYAAAHuuKavAAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAA5KADAAQAAAABAAAAJAAAAADNxE3gAAAF7klEQVR4Ae1dQYzbRBSdmSB1tfSQPZIsZ1TOlRBbOBSpSEhsWCqxBwQc4IQQIgEJcewRIcGm4syBgjgsEpQtEhKV4ABdeuG84swmR7pSy6oruh7+Hyep49hjTzwe/8STi+2Z7z/vv+exx+Nvh7HRr9cZ/DVez7MsYs+xge7moYw21L+xrsqjZdH1ovaiCOIokLT1JP9iZ6/9RNoOSeU27EXccRa11uw/evVoDXT6Ne4wbbuIPS96QGSxEvc/Q2taVLbK3TcYpYRzdjUrkqL2kw4f53rccLSBcdk8yyr9czzK79+9948OeJFAKfgXEOB3ugCL1lHwL0Cli7pA8vQZ3f4U/E/6JALtdg6/ZIxfFoy//dle62sd+HnqqvKvgux2Bj8zKS/FgTcbj65dub52FC833a7avwAAF5ICxECOTv+9YxpQ3J6CfwEB/h4HFt3ubQ7+i24brxPwnzkSkEw+YhyYwQ4u/GcGaYCXrGlmkHAJyT18nidKF/7Ds2vs/i4KtshoZ+wnbUiH9S78KyU3VtqJ/c4GAAykav9TgwEENDrla8+4nPN9uI+9gPbUfnXFPxESCEgc9GQJhUfi9rf8NMuu7Pq64888t+YRgAtxeeeH1vd5bMuw0Z2787S3DPhFb/PwWp5gdTYyCEq969a17fEzhvzDvTHf0hFFvs7jVxIJKfg75MXSAPT4Q3LUNRIex9ySUm5o+NJW2RrCaxvRVHr861zdY+GtBE7JabhKqeIHVYuIwDx+mEFOUqj30vBlFsjdpMklnKbY2Vt/Lmk/KmV1xJ8oJAryfmf4WiCDt2AwdB6MhiDq7ZWzZ7sff9MsPM/sQvC64Z8RMtf1hvNn+nvtWy4EMW2jrvgnQl7ZutM0eqrD+U0Q83lTosuyrzt+NdjZfUU2jERENeAZppoWK0sZA78eP2NKyP37gwcGvD00DcWsfPLc4wch1QjvoTTmaxnPjs0dmu3h8Ye5AQJvM8yom7XGNKvZUkclHj9D/kXSvaKpBCd372VmNpr6zGvv8TOG/KtrZF7SUu04fyq1bhEqlgC/HSEZe2wR9NJgXHj8VoSECfc/NSSRr1oG/FaEFFx8QV4tDcBlwC9s5OqVkbWt4X2qyuNnDPmHt8CKPcnAjLopZh1vePwh/+rUCkf13LcPFNIiPf7RFB0c1V14NHlg2pnmexht2kq2vcc/EhKp6t9oP2lyZGM+q42XfLJlymdRd/yTx1hRunqdw1+kZBejZbjOGX/ABN+uMoc1jilpu474E4VMJAfTP2TwLpP82bzTYkp4Ln9jXHxOXfykmCmVqYcDnv/KJHHFf2qHxGe1f5wMPoUz7Hs2WcDL8NNn2h9QeF3EZly2fXn+bTNq5q8q/mc6ZJj5cgy3+PKcWQim1vyg2VjdoDTuNY2gDHvPfxms5vdZNf9TM+YwZu+HGVhld0YkSJ7DtrDN/HQtt6Xnv1p9KfA/uULmSuotiS/Kr7GXFPKMW8//DCVOC6jwr66QcGaA2bj536gryhy2jRiK+lnU/T3/1SpHiX/e3Rq+zk6Da9VSMmq9Id7oX299RQKLIxCef0dEpzRDjX8BnfHNFKzuiylhcRU9pZgpYakp//hZlvOuYs9shxKWTLCWDCjFTAmLJXoz3VCKGbAImNUZZoJ2ZEAJi6OQ8SMcnn9XZCe0Q41/fJnudgLOSoooYXFFAKWYKWGpK/8CP5ijUtxcMZDSDmJALCnVS1vs+a9WWmr8C/X1Kkg0rpYWaB0wLMqXtGxy5fm3yaa5L2r8wxA6/OX5jvvY1vqS8FfQrMea4tDzn0KMo2Iq/E86JMaNCbX7J8Of0v5zyDo38AW7jTOtF3yiecis59/6EWbkkAL/Ux1yjF4l2AbHu6V1TOiITbG67RPLx4xPLz3/03y43qqS/8QOGSUAL+Vg9EnR1DrMV4V/VP6Q6gd6ozFTWvf8V6uGa/4zO2ScDvX/usfHL/LT4BJ0sMeho7Vg2UI7cDaEjjuE5d+yIW6urK7+WMeJmjhnNrc9/zbZNPdVNv//Ay2JNhJJ6FzsAAAAAElFTkSuQmCC'); 
		background-size: 85px 13px;
		background-repeat: no-repeat;
		background-position: center top;
	}
	
	.text {
		font-size: 35px;
		font-weight: bold;
		line-height: 32px;
		padding-top: 50px;
		text-align: center;
		
	}
	
	.cardsWrap {
		display: flex;
		justify-content: center;
	}
	
	.cardItem {
		margin: 5px 80px 10px 80px;
	}
	
	.cardItem img {
		width: 250px;
		height: 200px;
	}
	
	.cardTitle {
		text-align: center;
		font-weight: bold;
		font-size: 19px;
		color: black;
	}
	
	.cardText {
		text-align: center;
		font-size: 14px;
		color: #656565;
		font-weight: bold;
	}
	
	.notiTitle {
		font-weight: bold;
		font-size: 40px;
		text-align: center;
		color: black;
	}
	
	.spaceRegistration {
		background-color: #ffd014;
		padding: 80px 50px 60px 40px;
	}
	
	.itemWrap {
		text-align: center; 
	}
	
	.regItem1 {
		font-size: 40px;
	    font-weight: 700;
	    font-stretch: normal;
	    font-style: normal;
	    line-height: 1.4;
	    letter-spacing: -.5px;
	    color: #333;
	}
	
	.regItem2 {
		margin-top: 40px;
	    font-weight: 300;
	    font-size: 22px;
	    font-stretch: normal;
	    font-style: normal;
	    line-height: 1.5;
	    letter-spacing: -.5px;
	    color: #333;
	}
	
	.btReg {
		width: 192px;
	    margin: 60px auto 0;
	    min-height: 64px;
	    background-color: #3f64c7;
	    border-radius: 4px;
	    font-size: 17px;
	    line-height: 1;
	    letter-spacing: -.5px;
	    color: white;
	    font-weight: bold;
	    border: 0;
	}
	
	.notice {
		width: 1200px;
		margin: 0 auto;
    	padding: 75px 0;
	}
	
	.noticeTitle {
		font-size: 40px;
	    font-weight: 700;
	    font-stretch: normal;
	    font-style: normal;
	    line-height: 1.4;
	    letter-spacing: -.5px;
	    text-align: center;
	    color: #333;
	    margin-bottom: 50px;
	}
	
	.noticeWrap {
	    display: flex;
	    flex-direction: column;
	    justify-content: space-evenly;
	    border-bottom: 1px solid #e0e0e0;
	}
	
	.item {
		font-size: 14px;
		height: 57px;
	    border-top: 1px solid #e0e0e0;
	    padding-top: 23px;
	}
	
	.boardWrap {
		height: 100%;
	    font-family: NanumBarunGothic;
	    font-size: 16px;
	    font-weight: 400;
	    font-stretch: normal;
	    font-style: normal;
	    line-height: 1;
	    letter-spacing: -.5px;
	    color: #333;
	}
	
	.boardDate {
		float: right;
	    font-weight: 300;
	    font-size: 16px;
	    font-stretch: normal;
	    font-style: normal;
	    line-height: 1;
	    letter-spacing: -.5px;
	    color: #333;
	}
	
</style>

<script type="text/javascript">
	$(function() {
		$('.proposal').click(function() {
			window.open('https://kr.object.ncloudstorage.com/scloud-service/web/spacecloud_host_proposal_20220713.pdf');
		});
		
		$('.registration').click(function() {
			location.href = "<c:url value='/host/registration/registration1' />";
		});
		
		$('.regItem3').click(function() {
			location.href = "<c:url value='/host/registration/registration1' />";
		});
	});
</script>


<section>
	<div class="start" >
		<div class="startMain">
			<div class="mainItem1">
				<p>지금 MZ세대들을 위한</p>
				<p>공간비즈니스를 시작해보세요!</p>
			</div>
			<div class="mainItem2">
				<button class="proposal" >입점 제안서</button>
				<button class="registration" >공간 등록하기</button>
			</div>
			<div class="mainItem3">
				<p>| 등록 가능 공간 | 모임 · 촬영 · 스터디 · 연습 · 행사 · 공유오피스까지</p>
			</div>
			<!-- <div class="mainImage">
				<img class="mainImg" src="https://partner.spacecloud.kr/static/media/icons_pc.d588971f.png">
			</div> -->
		</div>
	</div>
	
	<div class="descriptionCard">
		<div class="mainTitle">
			<div class="logo"></div>
			<div class="text">
				<p>대한민국 No.1 공간공유 플랫폼,</p>
				<p>스페이스컬렉션의 호스트가 되세요!</p>
			</div>
		</div>
		<br><br>
		<div class="cardsWrap">
			<div class="cardItem">
				<img alt="예약관리아이콘" src="https://partner.spacecloud.kr/static/media/2021_host_main_icon-01.f5cc2c43.png">
				<p class="cardTitle">쉽고 빠른 예약관리</p>
				<p class="cardText">누구나 쉽게 공간을 등록하고<br>
									예약과 정산을 관리할수 있습니다</p>
			</div>
			<div class="cardItem">
				<img alt="전문관리아이콘" src="https://partner.spacecloud.kr/static/media/2021_host_main_icon-02.7552b03c.png">
				<p class="cardTitle">호스트 전문 케어팀</p>
				<p class="cardText">호스트의 공간운영, 광고상품 관리를<br>
									전담하는 호스트 케어팀이 서포트 합니다</p>
			</div>
		</div>
	</div>
	<br><br>
	
	<div class="notice">
		<div class="noticeTitle">공지사항</div>
		<c:forEach var="vo" items="${boardVo }">
			<div class="noticeWrap">
				<div class="item">
					<a href="<c:url value='/host/notice' />" class="board_title">
						<div class="boardWrap">${vo.boardTitle }
							<div class="boardDate"> 
								<fmt:formatDate value="${vo.boardRegDate }" pattern="yyyy.MM.dd"/> 
							</div>
						</div>
					</a>
				</div>
			</div>
		</c:forEach>
	</div>
	<br><br>
	
	<div class="spaceRegistration">
		<div class="itemWrap">
			<div class="regItem1">
				<p>예약부터 마케팅까지,<br>
					스페이스컬렉션와 함께하세요</p>
			</div>
			<div class="regItem2">
				<p>스페이스컬렉션와 함께라면 호스트님의 공간 비지니스가 더 편리해집니다.<br>
					스페이스컬렉션에서 나만의 고객을 만나시고,<br>
					광고, 통계, 정산 보고서를 통해 데이터 기반의 사업을 만들어가세요.</p>
			</div>
			<div class="regItem3">
				<button class="btReg" >공간 호스트 시작하기</button>
			</div>
		</div>
	</div>
</section>
<br><br><br>


<%@ include file="/WEB-INF/views/form/hostBottom.jsp" %>