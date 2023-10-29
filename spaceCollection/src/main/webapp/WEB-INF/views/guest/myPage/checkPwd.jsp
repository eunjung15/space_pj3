<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../../form/userTop.jsp" %>
<script type="text/javascript">
	$(function(){
		$('input[type=submit]').click(function(){
			if($('input[name=userPwd]').val().length<1){
				$('.error').html("비밀번호를 입력해주세요.");
				event.preventDefault();
				return false;
			}
		});
	});
</script>
<style type="text/css">

	.userModify{
		width: 100%;
		padding-top: 250px;
		margin-bottom: 250px;
		display: flex;
		justify-content: center;
		
	}
	.align_center{
		width: 1500px;
		display: flex;
		justify-content: center;
	}
	
	.userModify td {
        padding: 10px; /* 마진 설정 */
    }
	
	
	
	td:first-child{
		background-color: #eef1f8;
		text-align: center;
		font-weight: bold;
	}
	
	td:last-child{
		width:470px;
		background-color: white;
		text-align: center;
		border-left: 1px solid gray;
	}
	
	tr:first-child{
		border-top: 3px solid #193D76;
	}
	
	input[name=userPwd]{
		width: 300px;
		float: left;
	}
	
	.modifyBt{
		display: flex;
		margin-left: 200px;
	}
	.button {
		color: white;
		background-color: #193D76;
		border: 1px solid black;
		border-radius: 2px;
		padding: 10px 15px 10px;
		text-decoration: none;
		font: 9px sans-serif;
		background: -webkit-gradient(bottom, from(black), to(#193D76));
		margin: 15px 0 0 15px;
		
	}
	.error{
		color: red;
		font-size: 10px;
	}
	
	
	
	
</style>
<div class="userModify">
	<div class="align_center">
		<form name="frmCheckPwd" method="post" action="<c:url value='/guest/myPage/checkPwd'/>">
			<h1>회원정보확인</h1>
			<b>${sessionScope.userId }님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.</b>
			<table style="border: 1px solid #193D76;" id="checkPwdTable">
				<tr>
					<td>아이디(이메일)</td>
					<td style="border-bottom: 1px solid gray; text-align: left;">
					${sessionScope.userId }</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="userPwd" placeholder="">
						<span class="error"></span>
					</td>
				</tr>
			</table>
			<div class="modifyBt">
				<input type="submit" value="확인" class="button">
				<input type="button" value="취소" class="button">
			</div>
		</form>
	</div>
</div>
<%@ include file="../../form/userBottom.jsp" %>
