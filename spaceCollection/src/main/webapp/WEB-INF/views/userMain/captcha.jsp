<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://www.google.com/recaptcha/enterprise.js?render=6LdaPBUoAAAAADV2lBmVfEgk7Vcq88hAzM_gals9"></script>
</head>

<script>
function onClick(e) {
	  e.preventDefault();
	  grecaptcha.enterprise.ready(async () => {
	    const token = await grecaptcha.enterprise.execute('6LdaPBUoAAAAADV2lBmVfEgk7Vcq88hAzM_gals9', {action: 'LOGIN'});
	    // IMPORTANT: The 'token' that results from execute is an encrypted response sent by
	    // reCAPTCHA Enterprise to the end user's browser.
	    // This token must be validated by creating an assessment.
	    // See https://cloud.google.com/recaptcha-enterprise/docs/create-assessment
	  });
	}
</script>

<body>

<div id="google_recaptha">
<script src='https://www.google.com/recaptcha/api.js'></script>
<div class="g-recaptcha" data-sitekey="6LdaPBUoAAAAAI4qwpEHPe8Q9ojbukrvowQsmvzv"></div>
</div>

</body>
</html>