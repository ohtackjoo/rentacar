<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/rentacar.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mainstyle.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/clear.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/layout.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mystyle.css"/>
<script type="text/javascript" src="../jquery/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
 $(function(){
	 $(".long a").each(function(idx,item){
		 $(this).mouseenter(function(){
			 $(this).find("img").attr("src","../images/left"+(idx)+"_over.png");
		 });
		 $(this).mouseout(function(){
			 $(this).find("img").attr("src","../images/left"+(idx)+".png");
		 });
	 });
	 $(".shot a").each(function(idx,item){
		 $(this).mouseenter(function(){
			 $(this).find("img").attr("src","../images/right"+(idx)+"_over.png");
		 });
		 $(this).mouseout(function(){
			 $(this).find("img").attr("src","../images/right"+(idx)+".png");
		 });
	 });
 });
</script>
<body>
	<div class="all" style="background-image: url('<%=request.getContextPath()%>/images/20170818005.jpg')">
		<img alt="2조 로고이미지" src="">
		<a>로그인</a>
		<div class="long">
			<a><h1>장기</h1></a>
			<a><img src="../images/left1.png" alt="개인상담 이미지"></a>
			<a><img src="../images/left2.png" alt="차량관리 이미지"></a><br>
			<a><img src="../images/left3.png" alt="다이렉트 이미지"></a>
			<a><img src="../images/left4.png" alt="차량관리확인 이미지"></a><br>	<!-- 여기 차량관리확인와야해요&나머지4개넣었습니다 -->
		</div>
		<span>2조 재은이와 아이들</span>
		<div class="short">
			<a><h1>단기</h1></a>
			<a><img src="../images/right1.png" alt="중장기안내 이미지"></a>
			<a><img src="../images/right2.png" alt="예약이미지"></a><br>
			<a><img src="../images/right3.png" alt="예약확인 이미지"></a>
			<a><img src="../images/right4.png" alt="요금안내 이미지"></a><br>
		</div>
	</div>
</body>
</html>