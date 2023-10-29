<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
	String msg=(String)request.getAttribute("msg");
	String url=(String)request.getAttribute("url");
	String ctxPath = request.getContextPath();
	url = ctxPath + url; //=> /mymvc + /pd/pdList.do => /mymvc/pd/pdList.do 
%>
	<script type="text/javascript">
   		
   		swal({
   			text : "<%=msg%>",
   			closeOnClickOutside : false 
   		})
   		.then(function(result){ 
   			console.log(result);
   		    if(result) {
   		    	location.href = "<%=url%>";
   		    }
   		    
   		})
   	</script>
</body>
</html>









