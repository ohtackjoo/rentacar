<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/proTop.jsp"%>
<article id="centerCon">
<script type="text/javascript">
 $(function(){
	 $(".long a").each(function(idx,item){
		 $(this).mouseenter(function(){
			 $(this).find("img").attr("src","images/left"+(idx)+"_over.png");
		 });
		 $(this).mouseout(function(){
			 $(this).find("img").attr("src","images/left"+(idx)+".png");
		 });
	 });
	 $(".short a").each(function(idx,item){
		 $(this).mouseenter(function(){
			 $(this).find("img").attr("src","images/right"+(idx)+"_over.png");
		 });
		 $(this).mouseout(function(){
			 $(this).find("img").attr("src","images/right"+(idx)+".png");
		 });
	 });
 });
</script>
   <div id="mainServiceWrapper" class="hidden">
  		<div class="align_center center">
			<div class="long align_center">
				<a><p>장기</p></a>
				<a><img src="images/left1.png" alt="개인상담 이미지"></a>
				<a><img src="images/left2.png" alt="차량관리 이미지"></a><br>
				<a><img src="images/left3.png" alt="다이렉트 이미지"></a>
				<a><img src="images/left4.png" alt="차량관리확인 이미지"></a><br>	<!-- 여기 차량관리확인와야해요&나머지4개넣었습니다 -->
			</div>
			<div class="short align_center">
				<a><p>단기</p></a>
				<a><img src="images/right1.png" alt="중장기안내 이미지"></a>
				<a><img src="images/right2.png" alt="예약이미지"></a><br>
				<a><img src="images/right3.png" alt="예약확인 이미지"></a>
				<a><img src="images/right4.png" alt="요금안내 이미지"></a><br>
			</div>
		</div>
	</div>
</article>
<%@ include file="../inc/proBottom.jsp"%>