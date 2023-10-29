<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../form/userTop.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
	.wrap {
		min-height: 100vh;
		background: -webkit-gradient(linear, left bottom, right top, from(#F6F6F6),
			to(#F6F6F6));
		background: -webkit-linear-gradient(bottom left, #F6F6F6 0%, #F6F6F6 100%);
		background: -moz-linear-gradient(bottom left, #F6F6F6 0%, #F6F6F6 100%);
		background: -o-linear-gradient(bottom left, #F6F6F6 0%, #F6F6F6 100%);
		background: linear-gradient(to top right, #F6F6F6 0%, #F6F6F6 100%);
		width: 100%;
		padding-top: 140px;
		margin-right: 50px;
		padding-bottom: 100px;
	}
	
	.align_center {
		width: 1500px;
		margin: 0 auto;
	}
	
	#menubar {
		margin: 0 auto;
		text-align: center;
	}
	
	#review {
		padding: 15px 250px 15px 250px;
		background: #ebebeb;
		border-top: 1px solid #2d5aa0;
		font-size: 17px;
	}
	#QnA {
		padding: 15px 250px 15px 250px;
		background: #2d5aa0;
		border-top: 1px solid #2d5aa0;
		font-size: 17px;
		color: white;
	}
	
	h1 {
		font-weight: bold;
		font-size: 40px;
		padding: 50px;
		text-align: center;
		margin-bottom: 100px;
	}
	
	.qnaList{
		background: #eeeeee;
		width: 1110px;
		margin: 0 auto;
		padding:12px;
		border: 2px solid #2d5aa0;
	}
	
	.answer{
		color: #2d5aa0;
		font-weight: bold;
		text-align: left;
	}
	
	.fontBold{
		font-weight: bold;
		color: black;
	}
	
	.qnaDetail{
		background: white;
		padding: 5px;
		border: 2px solid #e1e1e1;
	}
	.count{
		text-align: left;
		margin-left:210px;
		color: black;
		font-size: 20px;
		font-weight: bold;
		margin-top: 30px;
	}
	.editMenu{
		padding-left:0px;
	}
	#condition {
		width: 130px;
		height: 43px;
		border-radius: 0px;
		border: 1px solid #e0e0e0;
		padding: 5px;
		outline: none;
		margin-left: 1170px;
		margin-top: 50px;
	}
	
	.chkBox{
		float: right;
		padding: 3px;
	}
	#deleteQna{
		border: 1px solid #5a6ff2;
		background: #6e81e5;
		color: white;
		font-size: 17px;
		padding: 15px 35px 15px 35px;
		margin-left: 1200px;
	}
	
	.qnaContent{
		color: #000000d1;
		margin:15px 0px 15px 10px;
		word-wrap: break-word;
	}
	
	#qnaAnswer{
		color: #000000d1;
		margin:15px 0px 15px 10px;
		word-wrap: break-word;
	}
	
	.page_wrap {
		text-align:center;
		font-size:0;
		margin-bottom: 150px;
 	}
	.divPage {
		text-align:center;
		font-size:0;
	}
	.divPage {
		display:inline-block;
	}
	.divPage .none {
		display:none;
	}
	.divPage a {
		display:block;
		margin:0 3px;
		float:left;
		border:1px solid #e6e6e6;
		width:28px;
		height:28px;
		line-height:28px;
		text-align:center;
		background-color:#fff;
		font-size:13px;
		color:#999999;
		text-decoration:none;
	}
	.divPage .arrow {
		border:1px solid #ccc;
	}
	.divPage .prev {
		background:#f8f8f8 url('img/page_prev.png') no-repeat center center;
		margin-right:7px;
	}
	.divPage .next {
		background:#f8f8f8 url('img/page_next.png') no-repeat center center;
		margin-left:7px;
	}
	.divPage .active {
		background-color:#42454c;
		color:#fff;
		border:1px solid #42454c;
	}
	
	#QNAWrite{
		width: 40px;
		height: 20px;
		border-radius: 5px;
		font-size: 15px;
		padding: 0px
	}
	
</style>
<script type="text/javascript">
	$(function(){
		
		$("#condition").change(function(){
			var condition = $('#condition').val();
			$('input[name=searchCondition]').val(condition);
			$('form[name=frmPage]').submit();
		});
		
		$("#deleteQna").click(function(){
			var count=$('input[type=checkbox]:checked').length;
			
			if(count>0){
				
				if(confirm('선택한 상품을 삭제하시겠습니까?')){
					$('form[name=frmQna]').prop('action'
							,"<c:url value='/deleteMyQna'/>")
					$('form[name=frmQna]').submit();
				}
			}else{
				alert("상품을 먼저 선택해주세요");
			}
			
		});
		
		$('.QNAWriteBt').click(function(){
			// 현재 클릭한 버튼의 부모 요소인 .qnaDetail 찾기
		    var qnaDetail = $(this).closest(".qnaDetail");
			//QnA번호 가져오기
		    var  qnaNum= qnaDetail.find(".chkBox").val(); 
			//내용 가져오기
		    var qnaContent = qnaDetail.find(".qnaContent").text();
		    
			$('#message-text').val(qnaContent);
			$('#editQnaNum').val(qnaNum);
		});
		
		$('#message-text').keyup(function (e) {
			let content = $(this).val();
		    
		    // 글자수 세기
		    if (content.length == 0 || content == '') {
		    	$('.textLimit').text('최대 0 / 200자 제한');
		    } else {
		    	$('.textLimit').text('최대 '+content.length +' / 200자 제한');
		    }
		    
		    // 글자수 제한
		    if (content.length > 200) {
		    	// 200자 부터는 타이핑 되지 않도록
		        $(this).val($(this).val().substring(0, 200));
		        // 200자 넘으면 알림창 빨간글씨로 알려주기
		        $('.textLimit').css("color","red");
		    }else{
		    	$('.textLimit').css("color","black");
		    };
		});
		
	});//window.document
	function qnaList(curPage){
		var condition = $('#condition').val();
		$('input[name=currentPage]').val(curPage);
		$('input[name=searchCondition]').val(condition);
		$('form[name=frmPage]').submit();
	}
	
	function QnAEditBtn(){
		var qnaContent = document.getElementById('message-text').value;
		var qnaNum = document.getElementById('editQnaNum').value;
		 $.ajax({
			url:"<c:url value='/editQna'/>",
			type:"POST",
			dataType:"json",
			data:{
				qnaContent:qnaContent,
				qnaNum:qnaNum
			},
			success:function(res){
				if(res){
					alert('QnA 수정 완료!');
					location.reload();
				}else{
					alert('QnA 수정 실패!');
				}
			},
		 });
	 }

</script>
<!-- 페이징 처리를 위한 form 시작-->
<form name="frmPage" method="post" action="<c:url value='/myQnA'/>">
	<input type="hidden" name="searchCondition" value="">
	<input type="hidden" name="currentPage" value="1">	
</form>
<!-- 페이징 처리 form 끝 -->
<div class="wrap">
	<div class="align_center">
		<h1>나의 Q&A 관리</h1>
		<div id="menubar">
			<a href="<c:url value='/myReview'/>" id="review">
				이용후기
			</a>
			<a href="<c:url value='/myQnA'/>" id="QnA">
				Q&A
			</a>
		</div>
		<form name="frmQna" action="<c:url value='/myQnA'/>" method="post">
		<select id="condition">
			<option selected="selected" value="">전체</option>
			<option value="Y"
				<c:if test="${param.searchCondition=='Y' }">
				selected="selected"
				</c:if>>답변 있음</option>
			<option value="N"
				<c:if test="${param.searchCondition=='N' }">
				selected="selected"
				</c:if>>답변 없음</option>
		</select>
		<div class="count">
			Q&A <span style="color: #2d5aa0;">${pagingInfo.totalRecord }개</span>
		</div>
		<c:if test="${empty qnaList }">
				<h1>등록된 QnA가 없습니다.</h1>
		</c:if>
		<c:if test="${!empty qnaList }">
		<!-- 반복시작 -->
		<c:set var="idx" value="0"/>
			<c:forEach var="map" items="${qnaList }">
			<input type="hidden" name=qnaNum value="${map['QNA_NUM'] }">
				<div class="qnaList">
					<div class="qnaDetail">
						<label class="fontBold">${map['USER_ID'] }</label>
						<input type="checkbox" class="chkBox" name="qnaNum" value="${map['QNA_NUM'] }">
						<br>
						<div class="qnaContent">${map['QNA_CONTENT'] }<br></div>
						<div class="editMenu">
							<a href="<c:url value='/detail?spaceNum=${map["SPACE_NUM"] }'/>" class="answer">${map['SPACE_NAME'] }</a>
							${map['QNA_REG_DATE'] }
							| <button type="button" class="btn btn-primary QNAWriteBt" id="QNAWrite" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">
								수정
							  </button>
						</div>
						<hr>
						<c:if test="${!empty map['QNA_ANSWER'] }">
							<label class="fontBold">호스트님의 답글</label><br>
							<p id="qnaAnswer">${map['QNA_ANSWER'] }</p>
						</c:if>
						<c:if test="${empty map['QNA_ANSWER'] }">
							<div>호스트님의 답변을 기다리는 중 입니다.</div>
						</c:if>
					</div>
				</div>
				<br>
				<c:set var="idx" value="${idx+1 }"/>
			</c:forEach>
			<!-- 반복끝 -->
		<button type="button" id="deleteQna">삭제</button>
		</c:if>
		</form>
	</div>
<div class = 'row'>
	<c:if test="${!empty sessionScope.userId}">
	<c:if test="${sessionScope.userId != user_id}">
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" style=" background: #ffd014; padding: 0 20px 0 0;">
						<h1 class="modal-title fs-5" id="exampleModalLabel" style="font-weight: bold; font-size:24px; padding: 20px;"
						>질문 수정하기</h1>
						<button type="button" class="btn-close" id="closeBTN"onclick="resetQna()" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form>
							<input type="hidden" name="qnaNum" id="editQnaNum">
							<div class="mb-3">
							<label for="message-text" class="col-form-label" style="float:left; font-size:16px;font-weight: bold;color:black; margin-bottom:1%;">
							질문:
							</label>
							<label class ="textLimit" style="float:left; font-size:16px;color:black;margin-left:50%;margin-top:1%;"></label>		            
							<textarea class="form-control" id="message-text" rows="10" maxlength="210"></textarea>
							<span class="error"></span>
							</div>
						</form>
						<p style="color:red"> 단, 공간 및 예약에 대한 문의가 아닌 글은 무통보 삭제될 수 있습니다.</p>
					</div>
					<div class="modal-footer" style="padding:2% 30% 2% 0%;">
					<button type="button" id="modalQuit" class="btn" onclick="resetQna()" style="background: #ffd014;" data-bs-dismiss="modal">취소</button>
					<button type="button" onclick="QnAEditBtn()" class="btn" style="background: #193D76; color:white" >등록</button>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	</c:if>
	<div class="modal fade" id="answerModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<input type="hidden" id="answerNumVal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style=" background: #ffd014; height: 60px;">
					<h1 class="modal-title fs-5" id="exampleModalLabel" style="font-weight: bold; font-size:24px">답변 작성하기</h1>
					<button type="button" class="btn-close" id="closeBTN"onclick="resetQna()" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class="mb-3">
							<label for="message-text" class="col-form-label" style="float:left; font-size:16px;font-weight: bold;color:black; margin-bottom:1%;">
							답변:
							</label>
							<label class = "textLimit" style="float:left; font-size:16px;color:black;margin-left:50%;margin-top:1%;">최대 0 / 200자 제한</label>
							 <textarea class="form-control" id="answerMessage" rows="10"></textarea>
						</div>
					</form>
					<p style="color:red"> 단, 공간 및 예약에 대한 문의가 아닌 글은 무통보 삭제될 수 있습니다.</p>
				</div>
				<div class="modal-footer" style="padding:2% 30% 2% 0%;">
					<button type="button" id="modalQuit" class="btn" onclick="resetQna()" style="background: #ffd014;" data-bs-dismiss="modal">취소</button>
					<button type="button" onclick="answerQna()" class="btn" style="background: #193D76; color:white;">수정</button>
				</div>
			</div>
		</div>
	</div>
</div>
						
<div class="page_wrap">
	<div class="divPage">
		<!-- 페이지 번호 추가 -->		
		<c:if test="${pagingInfo.firstPage>1 }">
			<a href="#" onclick="qnaList(${pagingInfo.firstPage-1})" class="arrow prev">			
			    <img src='<c:url value="/images/page_prev.png" />'  border="0">	</a>
		</c:if>
		<!-- [1][2][3][4][5][6][7][8][9][10] -->
		<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
			<c:if test="${i==pagingInfo.currentPage }">
				<a class="active">${i }</a>
			</c:if>
			<c:if test="${i!=pagingInfo.currentPage }">						
				<a href="#" onclick="qnaList(${i})" >
					${i }
				</a>
			</c:if>		
		</c:forEach>
		
		<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
			<a href="#" onclick="qnaList(${pagingInfo.lastPage+1})" class="arrow next">			
				<img src="<c:url value="/images/page_next.png" />" border="0" >
			</a>
		</c:if>
		<!--  페이지 번호 끝 -->
	</div>
</div>

<%@include file="../form/userBottom.jsp" %>