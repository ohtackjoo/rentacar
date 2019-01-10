<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#mainServiceWrapper{
	display:block;
	margin:0 auto;
	background:url("images/KakaoTalk_20190109_193652308.jpg") no-repeat center center;
	min-width: 1920px;
	min-height: 1080px;
	position: relative;
}

.long a{
 opacity:0.7 ;
}

.short a{
 opacity:0.7 ;
}
.center{
	vertical-align:middle;
	margin:0 auto;
	width: 1080px;
	opacity:1;
	position:absolute;
    top:50%; left:50%;
    transform: translate(-50%, -50%);
    
}

.center:after {
    content: "";
    display: block;
    clear: both;
}
.center p{
margin-top:220px;
font-size: 100px;
}
#mainServiceWrapper .center .short{
	float:left;
	width: 50%;
	margin-bottom: 220px;
}
#mainServiceWrapper .center .long{
	float:left;
	width: 50%;
}
.show{
display:inline-block;
text-align: center;
margin-top: 50px;
margin-right: 250px;
}
.show li{
text-align: center;
}
.sub{
text-align: center;
background-color: gray;
margin-left: -45px;
margin-top: -32px;
opacity: 0.7;
}
.logo{
position: relative;}
.logo a{
vertical-align: top;
position: absolute;
margin-top:-40px; 
margin-left: 100px;
}

</style>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/proTop.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mainstyle.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/clear.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/layout.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mystyle.css"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/rentacar.css'/>"/>
<script type="text/javascript" src="<c:url value='/jquery/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript">
$(function(){
	$(".sub").css("display","none");
		 $(".show").click(function(){
			$(".sub").css("display","block");
		 });
		 $(".hidden").mouseenter(function(){
			 $(".sub").css("display","none");
		 });
		 $(".sub").find("li").find("a").css("color","white");
	});
</script>
</head>
<body>
<div id="wrap">
        <div id="headerWrap">
            <header>
                <div id="header">                    
                    <div class="logo"><a href="<c:url value='/proindex.do'/>"><img src="<c:url value='/images/logo2.png'/>" alt="DIGITAL Hyundai Card>"></a></div>
                    
                    <nav id="navWrap">
                        <ul class="t_menu">
                            <li class="on"><a href="#">로그인</a></li>
                            <li><a href="#">회원가입</a></li>
                            <li><a href="#">고개센터</a></li>
                            <li><a href="#">공지사항</a></li>
                        </ul><!--  //t_menu  -->
                        <div class="show">
                        <ul class="gnb">
                            <li><a href="#">회사소개</a>
                                <ul class="sub">
                                    <li><a href="#">CEO메시지</a></li>
                                    <li><a href="#">현대카드 소개</a></li>
                                    <li><a href="#">주주구성</a></li>
                                    <li><a href="#">기업문화</a></li>
                                    <li><a href="#">사회공헌</a></li>
                                    <li><a href="#">CI소개</a></li>
                                </ul>
                            </li>
                            <li><a href="#">홍보자료</a>
                                <ul class="sub">
                                    <li><a href="#">뉴스룸</a></li>
                                    <li><a href="#">갤러리</a></li>
                                </ul>
                            </li>
                            <li><a href="#">투자정보</a>
                                <ul class="sub">
                                    <li><a href="#">신용등급</a></li>
                                    <li><a href="#">IR자료</a></li>
                                    <li><a href="#">감사보고서</a></li>
                                    <li><a href="#">경영공시</a></li>
                                    <li><a href="#">문의</a></li>
                                </ul>
                            </li>
                            <li><a href="#">윤리경영</a>
                                <ul class="sub">
                                    <li><a href="#">기업윤리</a></li>
                                    <li><a href="#">공정거래자율준수</a></li>
                                    <li><a href="#">불공정거래 제보</a></li>
                                    <li><a href="#">외부제보Hot-Line</a></li>
                                    <li><a href="#">사이버감사실</a></li>
                                </ul>
                            </li>
                            <li><a href="#">관리자 페이지</a>

                            </li>
                        </ul>
                        </div><!-- show -->
                    </nav>
                </div><!-- //header  -->
                <div class="sub_bg"></div>
            </header>
            </div>
            </div>
</body>
</html>