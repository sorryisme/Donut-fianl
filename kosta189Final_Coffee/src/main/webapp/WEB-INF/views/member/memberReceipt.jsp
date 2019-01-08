<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../common/header.jsp"%>
<style>
th,td{padding: 10px};
</style>
<div class="mypage-wrap" data-aos="fade-in">
	<div class="mypage-container">
		<div class="mypage-sidebar">
			<div class="mypage-sidebar-title">
				<span><b>마이페이지</b></span> <span
					style="font-size: 18px; font-weight: 600;">mypage</span>
			</div>
			<ul>
				<li class="sidebar-1"><a
					href="${pageContext.request.contextPath}/member/memberMypage">회원정보수정</a></li>
				<li class="sidebar-2"><a
					href="${pageContext.request.contextPath}/member/memberGive">내
						후원</a></li>
				<li class="select sidebar-3"><a
					href="${pageContext.request.contextPath}/member/memberReceipt">영수증관리</a></li>
				<li class="sidebar-4"><a
					href="${pageContext.request.contextPath}/member/memberQnA">Q&A</a>
					<c:choose>
						<c:when test="${qnaNewAlarm==1}">
							<i class="fa fa-bell faa-tada animated" id="alarm"
								style="color: #FF607F"></i>
						</c:when>
					</c:choose></li>
				<li class="sidebar-5"><a
					href="${pageContext.request.contextPath}/member/memberCheer">내
						응원</a> <c:choose>
						<c:when test="${newAlarm==1}">
							<i class="fa fa-bell faa-tada animated" id="alarm"
								style="color: #FF607F"></i>
						</c:when>
					</c:choose></li>
				<li class="sidebar-6"><a
					href="${pageContext.request.contextPath}/member/memberFavorite">즐겨찾기</a></li>
			</ul>
		</div>


		<div class="mypage-contents">
			<p align="center" class="mypage-title">
				<span style="font-size: 30px; color: black;">영수증 관리</span>
			</p>
			<div class="mypage-wrap" data-aos="fade-in">
				<div>
					<table style="text-align: center;" id="listTable" >
						<tr style="background-color: #fcf4f4">
							<td>기부단체 ID</td>
							<td style="text-align: center">기부프로젝트</td>
							<td>기부금액</td>
							<td>기부일자</td>
							<td>개별영수증</td>
						</tr>
						<c:choose>
							<c:when test="${empty requestScope.receiptList}">
								<tr>
									<td colspan="4">
										<p align="center">
											<b><span style="font-size: 9pt;">list가 존재하지 않습니다.</span></b>
										</p>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${requestScope.receiptList}" var="item">
									<tr style="background-color:white">
										<td>
											${item.project.id}
										</td>
										<td>
											<p align="center">
												<span style="font-size: 9pt;">
													<a href="${pageContext.request.contextPath}/project/projectRead?projectNo=${item.project.projectNo}">${item.project.projectSubject}</a> </span>
											</p>
										</td>

										<td>
											<p align="center">
												<span style="font-size: 9pt;">
													${item.giveMoney}</span>
											</p>
										</td>
										<td>
											<p align="center">
												<span style="font-size: 9pt;"> 
													${item.giveRegdate}
												</span>
											</p>
										</td>
										
										<td>
											<p align="center">
												<span style="font-size: 9pt;"> 
													<input type="button" onclick='window.open("${item.payment.receiptURL}", "MsgWindow", "width=410,height=510");' value="확인" style="background-color:black;color:white;border-radius:5px;border:none;width:40px;height:20px;cursor:pointer"/> 
												</span>
											</p>
										</td>
										

									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					<input type="button" value="전체영수증출력" style="background-color:black;color:white;border-radius:5px;border:none;width:100px;height:20px;cursor:pointer">
					
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../common/footer.jsp"%>
<script>
	$(function(){
		$("input[value=전체영수증출력]").on("click",function(){
			window.open("${pageContext.request.contextPath}/member/receipt",
					"MsgWindow",
					"width=600,height=1000");
		});
	})
</script>