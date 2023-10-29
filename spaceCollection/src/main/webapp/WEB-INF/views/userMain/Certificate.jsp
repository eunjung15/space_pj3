<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>공정거래위원회에 오신것을 환영합니다.</title>
<meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=yes" />
  <meta name="keywords" content="공정거래위원회" />
  <meta name="description" content="공정거래위원회에 오신것을 환영합니다." />
  <link rel="stylesheet" type="text/css" href="/site/www/css/sub.css" />
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/sub_content.css'/>" >
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/sub_layout.css'/>" >
  <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico" />
  <script type="text/javascript" src="/common/js/jquery-1.12.4.min.js"></script>
  <script type="text/javascript" src="/common/js/jquery.easing.1.3.js"></script>
</head>
<style>

</style>

<body>

<script type="text/javascript">
//<![CDATA[
function reCaptcha() {
  $('#imgCaptcha').attr('src', '/captcha.do?id='+Math.random());
 }
//화면 호출시 가장 먼저 호출되는 부분 
$(document).ready(function() {
  
  $('input[type="text"]').keydown(function(e){
    if(event.keyCode == 13){
      $('#captchaCheck').click();
    }
  });
 
 //'확인' 버튼 클릭시
 $('#captchaCheck').click(function(){
     if ( !$('#answer').val() ) {
          alert('이미지에 보이는 숫자를 입력해 주세요.');
          $('#answer').focus();
     } else {
          $.ajax({
              url: '/isRight.do',
              type: 'POST',
              dataType: 'json',
              data : {
                  captcha : $('#answer').val(),
                  setupId : '01'
          },
              async: false,  
              success: function(data) {
                   if(data==1){                     
                     var form = document.searchForm;
                     $('#captchaVal').val($('#answer').val());
                     //alert($('#captchaVal').val());
                     form.submit();
                   }else{
                     reCaptcha();
                       $('#answer').val('').focus();
                   }
                   
             }
        });
     }
 });
});
//]]>
</script>

<div id="contents" style="padding:18px 0 0 29px;">
    <form action="v2_ok.java" action="/captcha.do?" name="searchForm" method="post">
      <input type="hidden" name="captchaVal" id="captchaVal"/>
      <input type="hidden" name="wrkr_no" value="7428600224" />
    </form>
    <div class="security_char">
        <img src="/captcha.do" id="imgCaptcha" alt="보안문자 이미지" style="vertical-align: center;" />
    </div>
    <p class="em_b_orange">※ 위에 보이는 문자를 입력해 주세요.</p>
    <div class="clearfix">
        <label for="secur_txt" class="skip">입력</label>
        <input type="text" class="secur_txt" name="answer" id="answer"/>
        <span class="staff_btn2"><input type="button" id="captchaCheck" value="입력" class="NG"/></span>
        <span class="staff_btn2"><input type="button"  value="새로고침" onClick="reCaptcha()" class="NG"/></span>
    </div>
</div>

</body>
</html>