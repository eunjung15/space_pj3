<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- <html>
<head>
<meta charset="UTF-8">
<title>register</title> -->
<%@include file="/WEB-INF/views/form/userTop.jsp" %>
<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/guest.js'/>"></script>
  <!-- Bootstrap CSS -->
<!--   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->

<style>
    .registerBody {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#F6F6F6), to(#F6F6F6));
      background: -webkit-linear-gradient(bottom left, #F6F6F6 0%, #F6F6F6 100%);
      background: -moz-linear-gradient(bottom left, #F6F6F6 0%, #F6F6F6 100%);
      background: -o-linear-gradient(bottom left, #F6F6F6 0%, #F6F6F6 100%);
      background: linear-gradient(to top right, #F6F6F6 0%, #F6F6F6 100%);
    }

    .input-form {
      max-width: 680px;

      margin-top: 180px;
      margin-bottom: 100px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
    
    .divCondition{
    	font-size: 5px;
    	color: #656565
    }
  </style>
  <script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
    
	    
  </script>
<!-- </head>
<body> -->
<div class="registerBody">
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입</h4>
        <form class="validation-form" name="frmRegister" method="post" action="<c:url value='/guest/register'/>" novalidate>
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="userId">아이디</label>
              <input type="text" class="form-control" name="userId" id="userId" placeholder="" value="" required>
              <span class="error"></span>
              <div class="invalid-feedback">
                아이디를 입력해주세요.
              </div>
            </div>
            <div class="col-md-6">
              <label for="userName">이름</label>
              <input type="text" class="form-control" name="userName" id="userName" placeholder="" value="" required>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
            </div>
          </div>
            <div class="mb-2">
              <label for="userPwd">비밀번호</label>
              <input type="password" class="form-control" name="userPwd" id="userPwd" placeholder="" value="" required>
              <div class="divCondition">-문자/숫자/특수문자 3가지 조합 (8~30자)<br>
              -3개 이상 키보드 상 배열이 연속되거나 동일한 문자/숫자 제외
              </div>
              <div class="invalid-feedback">
                비밀번호를 입력해주세요.
              </div>
            </div>
            <div class="mb-2">
              <label for="name">비밀번호 확인</label>
              <input type="password" class="form-control" id="chkPwd" placeholder="" value="" required>
              <span class="errorPwd"></span>
              <div class="invalid-feedback">
                비밀번호 확인을해주세요.
              </div>
            </div>
		    <div class="row">
	            <div class="col-md-5 mb-3">
	            	<label for="userEmail">이메일</label>
	            	<input type="email" class="form-control" name="userEmail" id="userEmail" placeholder="you@example.com" required>
		            <div class="invalid-feedback">
		            	이메일을 입력해주세요.
		            </div>
	            </div>
	          	<div class="col-md-3 mb-3">
					<label>&nbsp;</label>
					  <input type="button" class="btn btn-secondary" id="mail-Check-Btn" value="이메일 인증"
					  	style="width: 165px; height: 50px; text-align: center;" >
	            </div>
		    </div>
          <div class="row">
			  <div class="col-md-5 mb-3">
				  <label for="zipcode">우편번호</label>
				  <input type="text" class="form-control" id="zipcode" name="zipcode" placeholder="" value="" required
				  	style="width: 250px;" onclick="sample6_execDaumPostcode()" readonly>
				  <div class="invalid-feedback">
				    우편번호를 입력해주세요.
				  </div>
			  </div>
			  <div class="col-md-3 mb-3">
				<label>&nbsp;</label>
				  <input type="button" class="btn btn-secondary" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
				  	style="width: 165px; height: 50px; text-align: center;">
              </div>
          </div>
          <div class="mb-3">
			  <label for="address">주소</label>
			  <input type="text" class="form-control" id="address" name="address" placeholder="서울특별시 강남구" required
			  	onclick="sample6_execDaumPostcode()" readonly>
			  <div class="invalid-feedback">
			    주소를 입력해주세요.
			  </div>
		  </div>
          
          <div class="mb-3">
		 	<label for="addressDetail">상세주소<span class="text-muted">&nbsp;(필수 아님)</span></label>
		  	<input type="text" class="form-control" id="addressDetail" name="addressDetail" placeholder="상세주소를 입력해주세요.">
		  </div>
          
          <div class="mb-3">
            <label for="userHp">휴대전화</label>
            <input type="text" class="form-control" name="userHp" id="userHp" placeholder="(-)를 제외한 전화번호를 입력해주세요 ex)01012346789" required>
            <div class="invalid-feedback">
              휴대전화를 입력해주세요.
            </div>
          </div>
          <br>
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="agreementAll">
            <label class="custom-control-label" for="agreementAll">아래 약관의 모두 동의합니다.</label>
          </div>
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="agreement1" required>
            <label class="custom-control-label" for="agreement1">개인정보 수집 및 이용에 동의합니다.(필수)</label>
            <div class="invalid-feedback">
              필수 항목을 체크해주세요.
            </div>
          </div>
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="agreement2" required>
            <label class="custom-control-label" for="agreement2">본인은 만 14세 이상입니다.(필수)</label>
            <div class="invalid-feedback">
              필수 항목을 체크해주세요.
            </div>
          </div>
            <input type="checkbox" class="select-agreement" id="agreement3">
            <input type="hidden" name="userMarketingSmsOk" value="Y">
            <label for="agreement3">이벤트 등 프로모션 알림 SMS (선택)</label><br>
            <input type="checkbox" class="select-agreement" id="agreement4">
            <input type="hidden" name="userMarketingEmailOk" value="Y">
            <label for="agreement4">이벤트 등 프로모션 알림 Email (선택)</label>
          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block" id="register" name="register" type="submit">가입 완료</button>
        </form>
      </div>
    </div>
  </div>
</div>
<input type ="hidden" name="chkId" id="chkId">
<input type="hidden" name="chkEmail" id="chkEmail" value="N">
<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(function(){
	    $("#agreementAll").click(function(){
	      
	      var isChecked = $(this).prop("checked");
	      $(".custom-control-input").prop("checked", isChecked);
	      $(".select-agreement").prop("checked", isChecked);
	      
	      
    	});
	    
	    $("button[name=register]").click(function(){
	    	if($("#userId").val().length<1){
	    		alert("아이디를 입력해주세요.");
	    		$('#userId').focus();
				return false;
	    	}
	    	
	    	if (!validate_userId($('#userId').val())) {
				alert("아이디는 영문, 숫자, _(밑줄문자)만 가능합니다");
				$('#userId').focus();
				return false;
			}
	    	
	    	if (!validate_userPwd($('#userPwd').val())){
	    		alert("비밀번호 양식이 맞지 않습니다.");
	    		return false;
	    	}
			
			if ($('#userPwd').val() != $('#chkPwd').val()) {
				alert("비밀번호가 일치하지 않습니다.확인하세요");
				$("#userPwd").focus();
				return false;
			}
			
			if (!validate_hp($("#userHp").val())
					|| !validate_hp($("#userHp").val())) {
				alert("전화번호는 숫자만 가능합니다");
				$("#userHp").focus();
				return false;
				//event.preventDefault();
			}
			
			if($('#userHp').val().length<7){
				alert("전화번호는 최소7자리 입니다.");
			}
			
			if($('#chkId').val()!='Y'){
		         alert('아이디 중복확인을 해주세요.');
		         $('#btnChkId').focus();
		         return false;
		    }
	    	var zipcode=$('#zipcode').val();
	    	if($('#zipcode').val()==""){
	    		alert("우편번호를 입력해주세요.");
		    	return false;
	    	}
	    	
	    	if($("#chkEmail").val()!="Y"){
				alert("이메일 인증을 해주세요.");
				return false;
			}
	    	
	    });
	    
	    $('#userId').keyup(function(){
			var userId = $('#userId').val();
			if(validate_userId(userId) && userId.length>=2){
				$.ajax({
					url:"<c:url value='/guest/ajaxCheckId'/>",
					type:"post",
					data:"userId="+userId,
					success:function(res){
						
						if(res){
							$('.error').text("이미 등록된 아이디").css("color","#ea5454");
							$('#chkId').val('N');							
						}else{
							$('.error').text("사용 가능한 아이디").css("color","gray");
							$('#chkId').val('Y');						
						}
						
					},
					error:function(status, error){
						alert(status+" : " + error);
					}
				});
			}else{
				$('.error').text('아이디 규칙에 맞지 않습니다.').css("color","#ea5454");
				$('#chkId').val('N');
			}
			
		});
	    
	    $('#chkPwd,#userPwd').keyup(function(){
	    	
			if($('#chkPwd').val()!=$('#userPwd').val()){
				$('.errorPwd').text('비밀번호가 일치하지 않습니다.').css("color","#ea5454");	
			}else{
				$('.errorPwd').text('비밀번호가 일치합니다.').css("color","gray");
			}
			
		});
	    
	    $('#mail-Check-Btn').click(function() {
	    	
			window.open("<c:url value='/email/emailCheck?userEmail="+$("#userEmail").val()+"&type=register'/>"
						,"이메일 인증 팝업","width=768,height=434,scrollbars=no, resizable=no");
	    	
		}); // end send eamil
		
	    
	});//window.document
	
	

    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("zipcode").value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addressDetail").focus();
            }
        }).open();
    }
</script>
<%@include file="/WEB-INF/views/form/userBottom.jsp" %>
<!-- </body>
</html> -->