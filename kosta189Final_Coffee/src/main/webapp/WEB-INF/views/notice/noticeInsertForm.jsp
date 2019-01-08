<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../common/header.jsp"%>

<SCRIPT language=javascript>
   $(function(){
	   $("input[value=등록완료]").click(function(){
		   $("#noticeInsertForm").attr("action", "${pageContext.request.contextPath}/notice/noticeInsert");
		   $("#noticeInsertForm").submit();
	   
   })
	   $("input[value=목록]").click(function(){
			   $("#noticeInsertForm").attr("action", "${pageContext.request.contextPath}/notice/noticeList");
			   $("#noticeInsertForm").submit();
		   
	   })
	   
   })
</script>

<form name="noticeInsertForm" method="post" id="noticeInsertForm" >


	<div class="notice-write-wrap">
		<div class="notice-write-container">
			<table>
				<tr>
					<td>
						<div>
							<input name="noticeTitle" type="text" maxlength="50"
								placeholder="제목">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>
							<textarea name="noticeContent" placeholder="내용"></textarea>
						</div>
					</td>
				</tr>
			</table>
			<input type="hidden" name="id" value="${userDTO.id}">
			<div class="notice-write-btn">
				<input type="button" value="등록완료"> 
				<input type="button" value="목록">
			</div>
		</div>
	</div>

</form>

<%@ include file="../common/footer.jsp"%>