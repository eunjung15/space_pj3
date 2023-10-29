<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../form/adminTop.jsp"%>
<style type="text/css">
	label{
		font-weight: bold;
	}
	
	form{
		width: 100%;
	}
	
	#commentsContent{
		height: 100px;
	}
	
	div#commentDiv {
    	margin: 0 auto;
    	width: 100%;
	}
	
	#submitBt, #editBt, #listBt{
		margin-top: 10px;
	}
	
	hr{
		color: gray;
	}
	
	#files{
		float: right;
	}
	
	#fileSpan{
		float: right;
		cursor: pointer;
	}
	
	#fileList{
		padding-top: 5px;
	}
	
	li>a{
		color: #555555;
		float: left;
		margin-right: 30px;
		margin-top: 7px;
	}
	
	li {
		list-style: none;
	}
	
	i.bi.bi-exclamation-circle{
 		color: #ffd600;
   		font-size: 40px;
   		display: block;
   		margin-block: -13px;
	}
	
	a~p{
		margin-top: 10px;
	}
	
	#commentsDel, #commentsEdit{
		color: #555555;
		float: right;
		margin-left: 10px;
		cursor: pointer;
	}
	
	#commentsMoreDiv{
		text-align: center;
	}
	
	#commentsMoreDiv>span{
		color: #555555;
		cursor: pointer;
	}
	
	.commentEditBt{
		margin-top: 10px;
	}
</style>
<script type="text/javascript">
	$(function() {

		if($('#commentOk').val() == 'Y'){
			$.commentsLoad();
		}

		
		$('#okBt').hide();
		$('#fileList').hide();
		
		$('#fileSpan').click(function() {
			$('#fileList').toggle();
		});
		
		$('#listBt').click(function() {
			location.href="<c:url value='/admin/board/boardList'/>";
		});
		
		$('form[name=commentsFrm]').submit(function() {
			if($('textarea').val().trim()==''){
				$('#okBt').hide();
				$('#cancelBt').html("확인");
				$('.modal-body').html("댓글을 입력해주세요.");
		        $('#confirm1').modal('show');
				
				event.preventDefault();
			}
		});
		
		$('#editBt').click(function() {
			location.href="/spaceCollection/admin/board/boardEdit?boardNum="+$('input[name=boardNum]').val();
		});
	});
	
	function commentEdit(evt) {
		var str = "";
		str += "<form name='commentsEditFrm' method='post>";
		str += "<div class='col-sm-10' id='commentDiv'>";
		str += "<textarea class='form-control' style='height: 100px' name='commentContent'></textarea>";
		str += "</div>";
		str += "<div class='d-grid gap-2 d-md-flex justify-content-md-end'>";
		str += "<button type='submit' class='btn btn-primary right commentEditBt' name='commentEditBt'>댓글 수정</button>";
		str += "</div>";
		str += "<input type='hidden' name='boardNum' value='${map.BOARD_NUM }'>";
		str += "<input type='hidden' name='commentNum'>";
		str += "<input type='hidden' name='userNum' value='9999999'>";
		str += "</form>";
		str += "<hr>";
		var commentNum = $(evt).parent().prev().val();
		
		$(evt).parent().replaceWith(str);
		$('input[name=commentNum]').val(commentNum);
		
		
		$('.commentEditBt').click(function() {
			$.ajax({
				url : "<c:url value='/admin/board/boardDetail/ajax_commentsEdit'/>",
				type : 'post',
				data : $('form[name=commentsEditFrm]').serializeArray(),
				dataType : 'json',
				success:function(){
					$.commentsLoad();
				},error:function(xhr, status, error){
					alert(status + " : " + error);
				}
			});
		});
	}
	
	function moreComment() {
		$('input[name=addNum]').val(parseInt($('input[name=addNum]').val())+5);
		$.commentsLoad();
	}
	
	function commentDelete(evt) {
		var commentNum = $(evt).parent().find("input[name=commentNum]").val()
		$('#okBt').show();
		$('#cancelBt').html("취소");
		$('#okBt').html("삭제");
		$('#okBt').addClass('deleteComments');
		$('.modal-body').html("댓글을 삭제하시겠습니까?");
		$('#confirm1').modal('show');
		$('.deleteComments').click(function() {
			$(this).removeClass('deleteComments');
			$.ajax({
				url : "<c:url value='/admin/board/boardDetail/ajax_commentsDelete'/>",
				type : 'get',
				data : "commentNum="+commentNum,
				dataType : 'json',
				success:function(){
					$.commentsLoad();
				},error:function(xhr, status, error){
					alert(status + " : " + error);
				}
			});
			$('#confirm1').modal('hide');	
		});
	}
	
	$.commentsLoad = function(){
		$.ajax({
			url : "<c:url value='/admin/board/boardDetail/ajax_commentLoad'/>",
			type: 'get',
			data: "boardNum=" + $('input[name=boardNum]').val() + "&addNum=" + $('input[name=addNum]').val(),
			dataType: 'json',
			success:function(res){
				var str = "";
				if(res!=null && res.length>0){
					$('#ajaxComments').html("");
					
					$.each(res, function() {
						str = "<input type='hidden' class='commentNum' value='"+this.COMMENT_NUM+"'>"
							+ "<div>"					
							+ "<a href='#'><i class='bi bi-person-fill'></i><span>"+this.USER_ID+"</span></a>"
							+ "<span id='commentsDel' class='commentsDel' onClick='commentDelete(this)'>삭제</span>"
							+ "<span id='commentsEdit' class='commentsEdit' onClick='commentEdit(this)'>수정</span>"
							+ "<p style='white-space: pre;'>"+this.COMMENT_CONTENT+"</p>"
							+ "<span>"+this.COMMENT_REG_DATE+"</span>"
							+ "<input type='hidden' name='commentNum' value='"+this.COMMENT_NUM+"'>"
							+ "<hr>"
							+ "</div>";
						$('#ajaxComments').append(str);
					});
					
					if($('input[name=addNum]').val() == res.length){
						$('#commentsMoreDiv').html("<span onClick='moreComment()'>댓글 더 보기</span>");
					}else{
						$('#commentsMoreDiv').html("");
					}
					
				}else{
					str = "<span>등록된 댓글이 없습니다.</span>"
					$('#ajaxComments').append(str);
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
		<h1>게시물 상세보기</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">홈</li>
				<li class="breadcrumb-item">게시판 생성/관리</li>
				<li class="breadcrumb-item">게시물 관리</li>
				<li class="breadcrumb-item active">게시물 상세보기</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section">
		<div class="row">
			<div class="col-lg-6" style="width: 100%">

				<div class="card" id="pageDiv" >
					<div class="card-body">
 						<h5 class="card-title" style="font-weight: bold;">게시물 상세보기</h5>
 						<span>${map.BOARD_TYPE_NAME }</span>
						<h4>${map.BOARD_TITLE }</h4>
						<p><a href="#"><i class="bi bi-person-fill"></i>${map.USER_ID }</a><br>
							<fmt:parseDate var="regdate" value="${map.BOARD_REG_DATE }" pattern="yyyy-MM-dd HH:mm"/>
							<fmt:formatDate value="${regdate }" pattern="yyyy-MM-dd HH:mm"/> 조회 0
						</p>
						
						<hr>
						<c:if test="${!empty spaceFileList }">
							<div id="files">
								<span id="fileSpan"><i class="bi bi-folder"></i> 첨부파일 : ${fn:length(spaceFileList) }</span>
								<br>
								<div id="fileList" class="card">
									<ul>
										<c:forEach var="spaceFileVo" items="${spaceFileList }">
											<li>
												<a href="<c:url value='/admin/board/download?boardNum=${spaceFileVo.imgForeignKey }&fileName=${spaceFileVo.imgTempName }'/>">
													<i class="bi bi-files"></i> ${spaceFileVo.imgOriginalName }
												</a>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</c:if>
						<div>
							<!-- 내용 -->
							<div>
								${map.BOARD_CONTENT }
							</div>
						</div>
						<hr>
						<!-- 좋아요 댓글수 -->
						<!-- 댓글쓰기란 -->
						<c:if test="${map.BOARD_TYPE_COMMENT_OK=='Y' }">
							<input type="hidden" value="${map.BOARD_TYPE_COMMENT_OK }" id="commentOk">
							<form name="commentsFrm" method="post" action="<c:url value='/admin/board/boardDetail/commentsWrite'/>">
								<label for="commentsContent">댓글</label>
								<div class="col-sm-10" id="commentDiv">
				                	<textarea class="form-control" style="height: 100px" name="commentContent"></textarea>
				                </div>
				                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                  					<button type="submit" class="btn btn-primary right" id="submitBt">댓글 등록</button>
                  					<button type="button" class="btn btn-secondary right" id="editBt">수정</button>
                  					<button type="button" class="btn btn-secondary right" id="listBt">목록</button>
								</div>
								<input type="hidden" name="boardNum" value="${map.BOARD_NUM }">							
								<input type="hidden" name="userNum" value="9999999">							
							</form>
							<hr>
							<input type="hidden" name="addNum" value="5">
							<div id="ajaxComments">
							
							</div>
							<div id="commentsMoreDiv">
								
							</div>
						</c:if>
				 	</div>
				</div>

			</div> 
		</div>
	</section>
	<!-- Modal -->
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
						data-bs-dismiss="modal" id="cancelBt"></button>
					<button type="button" class="btn btn-danger" id="okBt"></button>
				</div>
			</div>
		</div>
	</div>
	<!-- EndModal -->
</main>

<%@ include file="../../form/adminBottom.jsp"%>    
