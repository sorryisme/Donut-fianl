<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../common/header.jsp" %>

<SCRIPT language=javascript>
   $(function(){
	   $("input[value=수정완료]").click(function(){
		   //document.requestForm.action="${pageContext.request.contextPath}/board/updateForm";
		   
		   $("#noticeUpdateForm").attr("action", "${pageContext.request.contextPath}/notice/noticeUpdate");
		   $("#noticeUpdateForm").submit();
	   })
	 
	   $("input[value=목록]").click(function(){
			   $("#noticeUpdateForm").attr("action", "${pageContext.request.contextPath}/notice/noticeList");
			   $("#noticeUpdateForm").submit();
		   
	   })
	   
   })
</script>

<div class="notice-update-wrap">
    <div class="notice-update-container">
    <form name=noticeUpdateForm method=post id=noticeUpdateForm >
    <input type='hidden' name='noticeNo' value="${noticeDTO.noticeNo}">
        <table>
            <tr>
                <td>
                    <div><input type=text name="noticeTitle" size="30"
		 value="${requestScope.noticeDTO.noticeTitle}"></div>
                </td>
            </tr>
            <tr>
                <td>
                    <div>
                        <textarea name="noticeContent">${requestScope.noticeDTO.noticeContent}</textarea>
                    </div>
                </td>
            </tr>
        </table>
        <div class="notice-update-btn">
            <input type="button" value="수정완료">
            <input type="button" value="목록">
        </div>
        
        </form>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>