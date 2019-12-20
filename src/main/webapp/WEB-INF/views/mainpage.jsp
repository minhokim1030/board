<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
#darken-background {
	position: absolute;
	top: 0px;
	left: 0px;
	right: 0px;
	height: 100%;
	width: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: 1000;
	overflow-y: scroll;
	display: none;
}

#lightbox {
	width: 700px;
	margin: 20px auto;
	padding: 15px;
	border: 1px solid #333333;
	border-radius: 5px;
	background: white;
	box-shadow: 0px 5px 5px rgba(34, 25, 25, 0.4);
	text-align: center;
}
</style>
<title>Insert title here</title>
</head>
<body>	
		<div class="left">
			
			<button onClick="location.href='writer?unick+${vo.unick}'">글쓰기</button>
			
			<c:if test="${uemail != null }">
			아이디:${unick} <br>
			<button onClick="location.href='logout'">로그아웃</button>
			</c:if>
			<c:if test="${uemail == null }">
			<button id="login">로그인</button>
			</c:if>
			</div>

		<div class="page" style="width:1000px; height:800px; margin-left:200px;">
		<form name="mainplus"  >
		<div class="top" style="background:red; border:1; width:500; height:500; margin-bottom:40px;">
			<h1>BEST RECIPES</h1>
		</div>
		<div class="center" style="background:blue; border:1; width:700; height:800;margin-top:40px;">
			<h2>Recipes</h2>
		</div>
			<button id="plus" >더보기</button>
		
		</form>
		</div>
		
		<!-- 라이트박스 -->

	<div id="darken-background">
	<div id="lightbox">
			<form name="loginform" action="loginPost">
			<table border=1 width=300>
			<tr>
				<td>이메일:</td>
				<td><input type="text" name="uemail"></td>
			</tr>
			<tr>
				<td colspan=2><input type="submit" value="로그인"></td>
			</tr>
			</table>
			</form>
	<br>
	<a id="btnClose" href="#">닫기</a>
	</div>
	</div>

</body>
	<script>
		$("#login").on("click", function(){
			$("#darken-background").show();
				
		});
		
		 $("#btnClose").on("click", function(){
			$("#darken-background").hide();
		}); 
		
	</script>
	
	

</html>