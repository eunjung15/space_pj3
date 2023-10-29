/**
 * guest.js
 */

	var contextPath = "/spaceCollection";

	function validate_hp(userHp) {
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(userHp); //정규식과 일치하면 true
		/* 정규식 /^[0-9]*$/g
		0 에서 9사이의 숫자로 시작하거나 끝나야 한다는 의미 (^는 시작, $는 끝을 의미)
		닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복		 */
	}

	function validate_userId(userId) {
		var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
		return pattern.test(userId);
		/*
		정규식 /^[a-zA-Z0-9_]+$/g
		a에서 z 사이의 문자, A~Z사이의 문자, 0 에서 9사이의 숫자나 _로 시작하거나 끝나야 한다는 의미
		닫기 대괄호(]) 뒤의 + 기호는 이 패턴이 한 번 또는 그 이상 반복된다는 의미	 */
	}
	
	function validate_userPwd(userPwd){
		var pattern = new RegExp(/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,30}$/);
		return pattern.test(userPwd);
		/*정규식 /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,30}$/
		영문, 숫자, 특수기호 조합 8자리 이상 30자리 이하*/
	}
	
	function validate_userEmail(userEmail){
		var pattern = new RegExp(/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i);
		return pattern.test(userEmail);
	}
	
	
	