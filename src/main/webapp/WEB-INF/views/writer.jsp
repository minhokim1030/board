<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
</head>
<body>
			
		<h1>글쓰기</h1>
		<form name="form2" action="writer" method="POST">
		<table border=1 width=600>
		<tr>
		<td>작성자:${vo.unick}</td>
		</tr>
		<tr>
		<td>
		제목:<input type="text" name="btitle" size=50>
		<select name="national">
			<option value="korean">Korean</option>
			<option value="western">Western</option>
			<option value="chinese">Chinese</option>
			<option value="japanese">Japanese</option>
			<option value="other">Other</option>
		</select>
		<select name="time">
			<option value="15min">15min</option>
			<option value="30min">30min</option>
			<option value="1hour">1Hours</option>
			<option value="over">Over</option>
		</select>
		<select name="sort">
			<option value="solo">Solo</option>
			<option value="family">Family</option>
			<option value="healthy">Healthy</option>
			<option value="dessert">Dessert</option>
			<option value="etc">etc</option>
		</select>
		</td>
		<td>재료:<textarea rows="5" cols="50" name="bingredient"></textarea></td>
		</tr>
		<tr>
		<td>내용:<textarea rows="5" cols="50" name="bcontent"></textarea></td>
		</tr>
		</table>
		<input type="submit" value="저장">
		<input type="reset" value="취소">
		<input type="button" value="목록" onClick="location.href='mainpage'">
		</form>
			
</body>
		<script>
		$(frm2).submit(function(){
			var btitle=$(frm2.btitle).val();
			var bingredient=$(frm2.bingredient)val();
			var bcontent=$(frm2.bcontent)val();
			if(btitle==""){
				alert("제목을 입력해주세요");
				$("#btitle").focus();
				return false;
			}else if(bingredient=""){
				alert("재료를 작성해주세요");
				$("#bingredient").focus();
				return false;
			}else if(bcontent=""){
				alert("내용을 작성해주세요");
				$("#bcontent").focus();
				return false;
			}
		});
		</script>
		
</html>