<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>board6</title>
<script>
function fn_formSubmit(){
	var form1 = document.form1;
	
	if (form1.uno.value=="") {
		alert("작성자를 입력해주세요.");
		form1.uno.focus();
		return;
	}
	if (form1.btitle.value=="") {
		alert("글 제목을 입력해주세요.");
		form1.btitle.focus();
		return;
	}
	if (form1.bcontent.value=="") {
		alert("글 내용을 입력해주세요.");
		form1.bcontent.focus();
		return;
	}
	document.form1.submit();	
} 
</script>
</head>
<body>
	<form name="form1" action="board6Save" method="post" enctype="multipart/form-data">
		<table border="1" style="width:600px">
			<caption>게시판</caption>
			<colgroup>
				<col width='15%' />
				<col width='*%' />
			</colgroup>
			<tbody>
				<tr>
					<td>작성자</td> 
					<td><input type="text" name="uno" size="20" maxlength="20" value="<c:out value="${boardInfo.uno}"/>"></td> 
				</tr>
				<tr>
					<td>제목</td> 
					<td><input type="text" name="btitle" size="70" maxlength="250" value="<c:out value="${boardInfo.btitle}"/>"></td> 
				</tr>
				<tr>
					<td>내용</td> 
					<td><textarea name="bcontent" rows="5" cols="60"><c:out value="${boardInfo.bcontent}"/></textarea></td> 
				</tr>
				<tr>
					<td>첨부</td> 
					<td>
						<c:forEach var="listview" items="${listview}" varStatus="status">
							<input type="checkbox" name="fileno" value="<c:out value="${listview.fileno}"/>">	
            				<a href="fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>"> 							 
							<c:out value="${listview.filename}"/></a> <c:out value="${listview.size2String()}"/><br/>
						</c:forEach>					
					
						<input type="file" name="uploadfile" multiple="" />
					</td> 
				</tr>
			</tbody>
		</table>     
		<input type="hidden" name="bno" value="<c:out value="${boardInfo.bno}"/>"> 
		<a href="#" onclick="fn_formSubmit()">저장</a>
	</form>	
</body>
</html>
