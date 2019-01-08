<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../common/header.jsp"%>

<SCRIPT language=javascript>
   $(function(){
	   $("input[value=수정하기]").click(function(){
		   //document.requestForm.action="${pageContext.request.contextPath}/board/updateForm";
		   
		   $("#requestForm").attr("action", "${pageContext.request.contextPath}/notice/noticeUpdateForm");
		   $("#requestForm").submit();
	   })
	   
	   
	   $("input[value=삭제하기]").click(function(){
			   $("#requestForm").attr("action", "${pageContext.request.contextPath}/notice/noticeDelete");
			   $("#requestForm").submit();
		   
	   })
	   
	   $("input[value=목록]").click(function(){
			   $("#requestForm").attr("action", "${pageContext.request.contextPath}/notice/noticeList");
			   $("#requestForm").submit();
		   
	   })
	   
   })
</script>

<div class="notice-read-wrap">
	<div class="notice-read-container">
		<table style="min-height: 500px; width: 900px;">
			<tr>
				<td>
					<div>
						<b>${requestScope.noticeDTO.noticeTitle}</b>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<p align="right">
							작성일 &nbsp;:&nbsp; <span style="font-size: 9pt;"> ${noticeDTO.noticeRegdate}</span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							작성자 &nbsp;:&nbsp; <span style="font-size: 9pt;"> ${noticeDTO.id}</span>
						</p>
						
					</div>
				</td>
			</tr>
			<tr>
				<td style="white-space: pre-line; vertical-align: top;">
					<div style="padding-left: 40px; padding-right: 40px">
						<b><span>${requestScope.noticeDTO.noticeContent}</span></b>
					</div>
				</td>
			</tr>
		</table>
		<div class="notice-read-btn">
			<c:choose>
				<c:when test="${userDTO.statusFlag == 0 && userDTO.id eq noticeDTO.id }">
					<form name="requestForm" method="post" id="requestForm">
						<input type=hidden name="noticeNo" value="${requestScope.noticeDTO.noticeNo}"> 
						<input type="button" value="수정하기">
						<input type="button" value="삭제하기">
						<input type="button" value="목록">
					</form>
				</c:when>
				<c:otherwise>
					<form name="requestForm" method="post" id="requestForm">
						<input type="button" value="목록">
					</form>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>

<%@ include file="../common/footer.jsp"%>