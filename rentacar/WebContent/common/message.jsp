<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>message.jsp</title>
</head>
<body>
<%
	String msg=(String)request.getAttribute("msg");
	String url=(String)request.getAttribute("url");
	
	url=request.getContextPath()+url;	//=> /mymvc + /pd/pdList.do
		//=> /mymvc/pd/pdList.do
%>

<script type="text/javascript">
	<%if(msg!=null && !msg.isEmpty()){%>
	alert("<%=msg%>");
	<%}//if%>
	location.href="<%=url %>"
</script>

</body>
</html>