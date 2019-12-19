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
	
	if (form1.rewriter.value=="") {
		alert("작성자를 입력해주세요.");
		form1.rewriter.focus();
		return;
	}
	if (form1.rememo.value=="") {
		alert("글 내용을 입력해주세요.");
		form1.rememo.focus();
		return;
	}
	form1.submit();	
}

function fn_replyDelete(rno){
	if (!confirm("삭제하시겠습니까?")) {
		return;
	}
	var form = document.form2;

	form.action="board6ReplyDelete";
	form.rno.value=rno;
	form.submit();	
} 

var updaterno = updateRememo = null;
function fn_replyUpdate(rno){
	hideDiv("replyDialog");
	
	var form = document.form2;
	var reply = document.getElementById("reply"+rno);
	var replyDiv = document.getElementById("replyDiv");
	replyDiv.style.display = "";
	
	if (updaterno) {
		document.body.appendChild(replyDiv);
		var oldrno = document.getElementById("reply"+updaterno);
		oldrno.innerText = updateRememo;
	} 
	
	form.rno.value=rno;
	form.rememo.value = reply.innerText;
	reply.innerText ="";
	reply.appendChild(replyDiv);
	updaterno   = rno;
	updateRememo = form.rememo.value;
	form.rememo.focus();
} 

function fn_replyUpdateSave(){
	var form = document.form2;
	if (form.rememo.value=="") {
		alert("글 내용을 입력해주세요.");
		form.rememo.focus();
		return;
	}
	
	form.action="board6ReplySave";
	form.submit();	
} 

function fn_replyUpdateCancel(){
	var form = document.form2;
	hideDiv("replyDiv");
	
	var oldrno = document.getElementById("reply"+updaterno);
	oldrno.innerText = updateRememo;
	updaterno = updateRememo = null;
} 

function hideDiv(id){
	var div = document.getElementById(id);
	div.style.display = "none";
	document.body.appendChild(div);
}

function fn_replyReply(rno){
	var form = document.form3;
	var reply = document.getElementById("reply"+rno);
	var replyDia = document.getElementById("replyDialog");
	replyDia.style.display = "";
	
	if (updaterno) {
		fn_replyUpdateCancel();
	} 
	
	form.rememo.value = "";
	form.reparent.value=rno;
	reply.appendChild(replyDia);
	form.rewriter.focus();
} 
function fn_replyReplyCancel(){
	hideDiv("replyDialog");
} 

function fn_replyReplySave(){
	var form = document.form3;
	
	if (form.rewriter.value=="") {
		alert("작성자를 입력해주세요.");
		form.rewriter.focus();
		return;
	}
	if (form.rememo.value=="") {
		alert("글 내용을 입력해주세요.");
		form.rememo.focus();
		return;
	}
	
	form.action="board6ReplySave";
	form.submit();	
}
</script>

</head>
<body>
		<table border="1" style="width:600px">
			<caption>게시판</caption>
			<colgroup>
				<col width='15%' />
				<col width='*%' />
			</colgroup>
			<tbody>
				<tr>
					<td>작성자</td> 
					<td><c:out value="${boardInfo.uno}"/></td> 
				</tr>
				<tr>
					<td>제목</td> 
					<td><c:out value="${boardInfo.btitle}"/></td>  
				</tr>
				<tr>
					<td>내용</td> 
					<td><c:out value="${boardInfo.bcontent}" escapeXml="false"/></td> 
				</tr>
				<tr>
					<td>첨부</td> 
					<td>
						<c:forEach var="listview" items="${listview}" varStatus="status">	
            				<a href="fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>"> 							 
							<c:out value="${listview.filename}"/></a> <c:out value="${listview.size2String()}"/><br/>
						</c:forEach>					
					</td> 
				</tr>
			</tbody>
		</table>    
		<a href="board6List">돌아가기</a>
		<a href="board6Delete?bno=<c:out value="${boardInfo.bno}"/>">삭제</a>
		<a href="board6Form?bno=<c:out value="${boardInfo.bno}"/>">수정</a>
		<p>&nbsp;</p>
		<div style="border: 1px solid; width: 600px; padding: 5px">
			<form name="form1" action="board6ReplySave" method="post">
				<input type="hidden" name="bno" value="<c:out value="${boardInfo.bno}"/>"> 
				작성자: <input type="text" name="rewriter" size="20" maxlength="20"> <br/>
				<textarea name="rememo" rows="3" cols="60" maxlength="500" placeholder="댓글을 달아주세요."></textarea>
				<a href="#" onclick="fn_formSubmit()">저장</a>
			</form>
		</div>
		
		<c:forEach var="replylist" items="${replylist}" varStatus="status">
			<div style="border: 1px solid gray; width: 600px; padding: 5px; margin-top: 5px; margin-left: <c:out value="${20*replylist.redepth}"/>px; display: inline-block">	
				<c:out value="${replylist.rewriter}"/> <c:out value="${replylist.redate}"/>
				<a href="#" onclick="fn_replyDelete('<c:out value="${replylist.rno}"/>')">삭제</a>
				<a href="#" onclick="fn_replyUpdate('<c:out value="${replylist.rno}"/>')">수정</a>
				<a href="#" onclick="fn_replyReply('<c:out value="${replylist.rno}"/>')">댓글</a>
				<br/>
				<div id="reply<c:out value="${replylist.rno}"/>"><c:out value="${replylist.rememo}"/></div>
			</div><br/>
		</c:forEach>

		<div id="replyDiv" style="width: 99%; display:none">
			<form name="form2" action="board6ReplySave" method="post">
				<input type="hidden" name="bno" value="<c:out value="${boardInfo.bno}"/>"> 
				<input type="hidden" name="rno"> 
				<textarea name="rememo" rows="3" cols="60" maxlength="500"></textarea>
				<a href="#" onclick="fn_replyUpdateSave()">저장</a>
				<a href="#" onclick="fn_replyUpdateCancel()">취소</a>
			</form>
		</div>
		
		<div id="replyDialog" style="width: 99%; display:none">
			<form name="form3" action="board6ReplySave" method="post">
				<input type="hidden" name="bno" value="<c:out value="${boardInfo.bno}"/>"> 
				<input type="hidden" name="rno"> 
				<input type="hidden" name="reparent"> 
				작성자: <input type="text" name="rewriter" size="20" maxlength="20"> <br/>
				<textarea name="rememo" rows="3" cols="60" maxlength="500"></textarea>
				<a href="#" onclick="fn_replyReplySave()">저장</a>
				<a href="#" onclick="fn_replyReplyCancel()">취소</a>
			</form>
		</div>							
</body>
</html>
