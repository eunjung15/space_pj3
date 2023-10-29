<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
 		@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
       	.rate { display: inline-block;border: 0;margin-right: 15px; caret-color: transparent;}
		.rate > input {display: none; caret-color: transparent;}
		.rate > label {float: right;color: #ddd; caret-color: transparent;}
		.rate > label:before {font-size:2rem;display: inline-block;padding: .3rem .2rem;margin: 0;cursor: pointer;font-family: FontAwesome;content: "\f005 "; caret-color: transparent;}
		.rate .half:before {content: "\f089 "; position: absolute;padding-right: 0; caret-color: transparent;}
		.rate input:checked ~ label, 
		.rate label:hover,.rate label:hover ~ label { color: #f73c32 !important; caret-color: transparent;} 
		.rate input:checked + .rate label:hover,
		.rate input input:checked ~ label:hover,
		.rate input:checked ~ .rate label:hover ~ label,  
		.rate label:hover ~ input:checked ~ label { color: #f73c32 !important; caret-color: transparent;}
		
	header{
		padding-top:10px;
		height: 60px;
		margin: 0% 0% 0% 0%;
		background: #193D76;
		text-align: center;
		color: white;
		font-size:27px;
		font-weight: bold;
	}
	body{
		margin:0% 0% 0% 0%;
	}
	.rating-box{
		display:inline-block;
		padding:0% 0% 0% 0%;
	}
	.spaceName{
		padding:3% 2% 0% 3%;
	}
	.form-floating{
		padding: 0% 8% 0% 8%;
	}
	.form-control{
		height:250px !important;
		border:#193D76 3px solid;
	}
	h4{
		display: inline-block;
	}
	.spaceH4{
		font-weight:bold;
		padding:2% 2% 2% 2%;
		border-radius: 1rem;	
	}
	.btnArea{
		padding:6% 0% 0% 0%;
		margin-left: 30%;
	}
	.reserveBt{
	    width: 27%;
	    height: 55px;
	    border: none;
	    font-size: 20px;
	    font-weight: bold;
    }
    #reservationList{
    	background: rgba(255, 208, 20, 0.8);
    }
    #reservationList:hover{
    	border:rgba(255, 208, 20, 0.8) 4px solid;
    	background: white;
    }
    
    #home{
    	background: #193D76;
    	color:white;
    }
    
    #home:hover{
    	background: white;
    	border: #193D76 4px solid;
    	color: black;
    }
    
    #content-label{
    	color:lightgrey;
    }
    .textLimit{
    	float: right;
    	padding-right: 9%;
    	padding-top:2%;
    }
    
    .textLimit.limit{
  	 	animation: shake 0.5s 0.08s;
  		 color:red !important;
  	}
  	.rating-box{
  		display: inline-block;
    	padding: 0% 0% 0% 8%;
  	}
  	@keyframes shake {
	  0%, 100% {
	    transform: translateX(0);
	  }
	  10%, 30%, 50%, 70%, 90% {
	    transform: translateX(-5px);
	  }
	  20%, 40%, 60%, 80% {
	    transform: translateX(5px);
	  }
	  	
 
</style>
<header>
	<span class="headerSpan">리뷰작성</span>
</header>
<body>
<form id = "writeReview">
	<div class="spaceName">
		<h4 class="spaceH4">공간명</h4><h3 style="display:inline"> -</h3><h4 style="margin-left:3%;font-weight: bold">${reservMap.SPACE_NAME} / ${reservMap.SD_TYPE}</h4>
	</div>
	<hr>
	<div class="rating-box">
		<fieldset class="rate">
		      <input type="radio" id="rating10" name="reviewRate" value="10"><label for="rating10" title="5점"></label>
		      <input type="radio" id="rating9" name="reviewRate" value="9"><label class="half" for="rating9" title="4.5점"></label>
		      <input type="radio" id="rating8" name="reviewRate" value="8"><label for="rating8" title="4점"></label>
		      <input type="radio" id="rating7" name="reviewRate" value="7"><label class="half" for="rating7" title="3.5점"></label>
		      <input type="radio" id="rating6" name="reviewRate" value="6"><label for="rating6" title="3점"></label>
		      <input type="radio" id="rating5" name="reviewRate" value="5"><label class="half" for="rating5" title="2.5점"></label>
		      <input type="radio" id="rating4" name="reviewRate" value="4"><label for="rating4" title="2점"></label>
		      <input type="radio" id="rating3" name="reviewRate" value="3"><label class="half" for="rating3" title="1.5점"></label>
		      <input type="radio" id="rating2" name="reviewRate" value="2"><label for="rating2" title="1점"></label>
		      <input type="radio" id="rating1" name="reviewRate" value="1"><label class="half" for="rating1" title="0.5점"></label>
	     </fieldset>
     </div>
	 <label class = "textLimit" style="font-size:16px;color:black;">최대 0 / 200자 제한</label>
	<div class="form-floating">
	  <textarea class="form-control" name="reviewContent"id="reviewContent" placeholder="최소 20자" id="floatingTextarea"></textarea>
	  <label for="floatingTextarea" id="content-label" style="margin-left:8%;margin-top:0%">최소 20자</label>
	</div>
	<div class = "btnArea">
		<button class="reserveBt" id="reservationList">작성 완료</button>
		<button class="reserveBt" id="home" onclick="cancel()">취소</button>
	</div>
	<input type="hidden" name = "reservationNum" value="${param.reservationNum}">
	<input type="hidden" name = "userId" value="${param.userId}">
</form>
<c:if test="${!empty param.result} ">
	<input type="hidden" id="result" >
</c:if>
</body>
<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
$(function(){
		$('#writeReview').submit(function(){
			event.preventDefault();
			if($('#reviewContent').val().length < 20){
				alert('20자 이상부터 등록 가능합니다');
			}else{
				$.ajax({
					url:"<c:url value='/ajaxWriteReview'/>",
					type:"post",
					data:$('#writeReview').serializeArray(),
					success:function(result){
						if(result == 1){
							alert('리뷰 등록 성공!');
							self.close();
							opener.location.href="<c:url value='/detail?spaceNum=${param.spaceNum}'/>"
						}else{
							alert('리뷰 등록 실패!');
						}
					},
					error:function(){
						alert('error : 리뷰 등록 실패');
					}
				});
			}
		});
	
});
	
	function cancel(){
		window.close();	
	}
	
	var qnaText = document.getElementById('reviewContent');
	var textLimit = document.getElementsByClassName('textLimit');
 	qnaText.addEventListener('input',function(){
 		if(this.value.length >= 200){
			var truncatedValue = this.value.substring(0, 200); // 200자로 잘라낸 값
	        this.value = truncatedValue;
			textLimit[0].classList.add('limit');
	        textLimit[0].textContent = "최대 200/ 200자 제한";
 		}else{
 			textLimit[0].classList.remove('limit');
 			textLimit[0].textContent="최대 " + this.value.length + "/ 200자 제한";
 		}
 });

</script>

</html>