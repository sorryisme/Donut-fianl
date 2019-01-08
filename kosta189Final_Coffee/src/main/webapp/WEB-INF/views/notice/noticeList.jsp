<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../common/header.jsp"%>

<%
	/* session.setAttribute("id", "company1"); */
%>

<SCRIPT language=javascript>
   $(function(){
	   $("input[value=글쓰기]").click(function(){
		   $("#requestForm").attr("action", "${pageContext.request.contextPath}/notice/noticeInsertForm");
		   $("#requestForm").submit();
	   })
   })
   
  function list(page){
		location.href="${pageContext.request.contextPath}/notice/noticeList?curPage="+page;
	}
   
</script>

<div class="notice-wrap">
	<div class="notice-container">
		<p class="notice-title">
			<span style="font-size: 30px;">공지사항</span>
		</p>

		<table class="notice-table">
			<tr style="background-color: #DC287C">
				<td>번호</td>
				<td style="text-align: center">제목</td>
				<td>등록일</td>
				<td>작성자</td>
			</tr>

			<c:choose>
				<c:when test="${empty map.list}">
					<tr>
						<td colspan="5">
							<p align="center">
								<b><span style="font-size: 9pt;">등록된 공지사항이 없습니다.</span></b>
							</p>
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${map.list}" var="noticeDTO" varStatus="status">

						<tr>
							<td>${noticeDTO.noticeNo}</td>
							<td><a
								href="${pageContext.request.contextPath}/notice/noticeRead?noticeNo=${noticeDTO.noticeNo}">
									${noticeDTO.noticeTitle}</a></td>
							<td>${noticeDTO.noticeRegdate}</td>
							<td>${noticeDTO.id}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="5">
						<c:if test="${map.boardPager.curBlock>0}">
							<a href="javascript:list('1')">[처음]</a>
						</c:if>
						
						<c:if test="${map.boardPager.curBlock>1}">
							<a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
						</c:if>
						
						<c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
							<c:choose>
								<c:when test="${num==map.boardPager.curPage}">
									<span style="color: red">${num}</span>&nbsp;
								</c:when>
								<c:otherwise>
									<a href="javascript:list('${num}')">${num}</a>&nbsp;
								</c:otherwise>
							</c:choose>
						</c:forEach>
				
				
						<c:if test="${map.boardPager.curBlock<map.boardPager.totBlock}">
							<a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
						</c:if>
		
						<c:if test="${map.boardPager.curBlock<=map.boardPager.totPage}">
							<a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
						</c:if>
				</td>
			</tr>

			
		</table>
		

		<div class="notice-read-btn" align="center">
			<c:if test="${userDTO.statusFlag == 0}">
				<form name="requestForm" method="post" id="requestForm">
					<input type=hidden name="noticeNo"
						value="${requestScope.noticeDTO.noticeNo}"> <input
						type="button" value="글쓰기">
				</form>
			</c:if>
		</div>

	</div>
</div>

<%@ include file="../common/footer.jsp"%>
